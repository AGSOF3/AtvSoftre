package it.softre.thip.base.attivita;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.thera.thermfw.base.Trace;
import com.thera.thermfw.common.ObjectWithPostSave;
import com.thera.thermfw.persist.Factory;
import com.thera.thermfw.persist.KeyHelper;
import com.thera.thermfw.persist.PersistentObject;
import com.thera.thermfw.type.EnumType;

import it.softre.thip.base.attivita.utils.UtilsInvioMail;
import it.softre.thip.base.cliente.ClienteSoftre;
import it.thera.thip.base.azienda.Azienda;
import it.thera.thip.base.azienda.AziendaPrimrose;
import it.thera.thip.base.dipendente.Dipendente;
import it.thera.thip.base.partner.AnagraficoDiBase;

/**
 *
 * <p></p>
 *
 * <p>
 * Company: Softre Solutions<br>
 * Author: Daniele Signoroni<br>
 * Date: 05/08/2026
 * </p>
 */

/*
 * Revisions:
 * Number   Date        Owner    Description
 * 72XXX    05/08/2026  DSSOF3   Prima stesura
 */

public class RichiestaAttivitaLaboratorio extends AttivitaSoftre implements ObjectWithPostSave {

	private boolean notificaLaboratorio = false;

	public boolean isNotificaLaboratorio() {
		return notificaLaboratorio;
	}

	public void setNotificaLaboratorio(boolean notificaLaboratorio) {
		this.notificaLaboratorio = notificaLaboratorio;
	}

	public RichiestaAttivitaLaboratorio() {
		setPriorita(NON_SIGNIFICATIVO);
	}

	@Override
	public int save() throws SQLException {
		boolean isOnDB = isOnDB();
		if(getRubricaSoftre() != null && !isOnDB) {
			aggiuntiRichiedenteCollaboratore();
			setNotificaLaboratorio(true);
		}
		int rc = super.save();
		return rc;
	}

	@SuppressWarnings("unchecked")
	protected void aggiuntiRichiedenteCollaboratore() {
		AttivitaCollaboratore collaboratore = (AttivitaCollaboratore) Factory.createObject(AttivitaCollaboratore.class);
		collaboratore.setParent(this);
		collaboratore.setUtente(getRubricaSoftre());
		getAttivitaCollaboratori().add(collaboratore);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List postSave() {
		List errors = new ArrayList();

		if(isNotificaLaboratorio()) {
			Dipendente responsabileCliente = getClientesoftre().getReferentePersonalizzazioni();

			if(responsabileCliente == null) {
				responsabileCliente = recuperaResponsabileLaboratorio();
			}

			if(responsabileCliente != null) {
				try {

					Message message = new MimeMessage(sessionForSendMail());

					message.setFrom(new InternetAddress("info@softre.it"));
					message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(responsabileCliente.getEmail()));
					message.setSubject(responsabileCliente.getNome() + " " +responsabileCliente.getCognome()+ " ha richiesto un'attività : "+getNomeAttivita());

					Map<String, String> values = new HashMap<String, String>();

					values.put("DESTINATARIO",responsabileCliente.getNome() + " " + responsabileCliente.getCognome());

					values.put("NOME_ATTIVITA", getNomeAttivita());

					values.put("CLIENTE",getClientesoftre() != null ? getClientesoftre().getRagioneSociale() : "");

					values.put("RICHIEDENTE", getRubricaSoftre().getNome() + " " + getRubricaSoftre().getCognome());

					values.put("DESCRIZIONE", getDescrizioneAttivita() != null ? getDescrizioneAttivita().replace("\n", "<br/>") : "");

					values.put("STATO", EnumType.getEnumTypeInstance("StatoAttivitaSoftre", EnumType.class).descriptionFromValue(String.valueOf(getStatoAttivita())));

					String htmlContent = UtilsInvioMail.renderTemplate("richiesta-attivita-laboratorio.html", values);

					message.setContent(htmlContent, "text/html; charset=utf-8");

					sendMessage(message);

				} catch (Exception e) {
					e.printStackTrace(Trace.excStream);
				}
			}
		}

		return errors;
	}

	public static Dipendente recuperaResponsabileLaboratorio() {
		Dipendente responsabileLaboratorio = null;
		try {
			AziendaPrimrose azienda = (AziendaPrimrose) AziendaPrimrose.elementWithKey(AziendaPrimrose.class, Azienda.getAziendaCorrente(), PersistentObject.NO_LOCK);
			if(azienda != null && azienda.getAnagraficoDiBase() != null) {
				AnagraficoDiBase anagrSoftre = azienda.getAnagraficoDiBase();
				ClienteSoftre cli = (ClienteSoftre) ClienteSoftre.elementWithKey(ClienteSoftre.class, KeyHelper.buildObjectKey(new String[] {
						Azienda.getAziendaCorrente(), anagrSoftre.getIdAnagrafico().toString()
				}), PersistentObject.NO_LOCK);
				if(cli != null) {
					responsabileLaboratorio = cli.getReferentePersonalizzazioni();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace(Trace.excStream);
		}
		return responsabileLaboratorio;
	}
}