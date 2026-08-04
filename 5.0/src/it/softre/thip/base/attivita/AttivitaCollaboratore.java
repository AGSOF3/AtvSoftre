package it.softre.thip.base.attivita;

import java.sql.SQLException;

import com.thera.thermfw.base.Trace;
import com.thera.thermfw.common.ErrorMessage;
//import com.thera.thermfw.persist.KeyHelper;
import com.thera.thermfw.persist.PersistentObject;
import com.thera.thermfw.pref.ApplicationPreferences;

//import it.thera.thip.base.dipendente.Dipendente;
//import it.thera.thip.base.profilo.UtenteAzienda;

/**
 * <h1>Softre Solutions</h1> <br>
 * 
 * @author Daniele Signoroni 22/05/2024 <br>
 *         <br>
 *         <b>71543 DSSOF3 22/05/2024</b>
 *         <p>
 *         Prima stesura.<br>
 * 
 *         </p>
 * <b>71558	DSSOF3	20/06/2024</b>
 * <p>
 * Implementazione notifiche prima versione.<br>
 * </p>
 */

public class AttivitaCollaboratore extends AttivitaCollaboratorePO {

	//protected Dipendente dipendente;

	public ErrorMessage checkDelete() {
		return null;
	}

	/*public Dipendente getDipendente() {
		return dipendente;
	}

	public void setDipendente(Dipendente dipendente) {
		this.dipendente = dipendente;
	}*/

	@Override
	public boolean initializeOwnedObjects(boolean retFather) {
		boolean ret = super.initializeOwnedObjects(retFather);
		/*if(ret && isOnDB()) {
			UtenteAzienda utenteAzienda = null;
			try {
				utenteAzienda = (UtenteAzienda) 
						UtenteAzienda.elementWithKey(UtenteAzienda.class,
								KeyHelper.buildObjectKey(new String[] {
										getIdAzienda(),
										getIdUtente()
								}), PersistentObject.NO_LOCK);
			} catch (Exception e) {
				//
			}
			dipendente = utenteAzienda.getDipendente();
		}*/
		return ret;
	}

	public String getNomeCollaboratore() {
		/*if(dipendente != null) {
			return dipendente.getNome() + " "+ dipendente.getCognome();
		}*/
		if(getUtente() != null) {
			return getUtente().getNome() + " "+ getUtente().getCognome();
		}
		return getIdUtente();
	}

	public String getUrlImmagineCollaboratore() {
		String image = null;
		/*if(dipendente != null) {
			if(dipendente != null) {
				image = dipendente.getURLImmagineDipendente();
			}
		}*/
		if(getUtente() != null) {
			image = getUtente().getURLImmagineDipendente();
		}
		if(image == null)
			image = "https://tacm.com/wp-content/uploads/2018/01/no-image-available.jpeg";
		return image;
	}

	public String getUrlImmagineCollaboratorePerEsterno() {
		String urlImmagine = "";
		try {
			String urlPub = null;
			ApplicationPreferences appPref = (ApplicationPreferences) ApplicationPreferences.elementWithKey(ApplicationPreferences.class, "0", PersistentObject.NO_LOCK);
			if(appPref != null)
				urlPub = appPref.getURLPubblico();

			if(urlPub != null && !urlPub.equals("") && !urlPub.startsWith("http://") && !urlPub.startsWith("https://"))
				urlPub = "http://" + urlPub;

			String webAppPath = "panth03";
			if(urlPub != null && !urlPub.equals("") && !urlPub.endsWith("/"+webAppPath) && !urlPub.endsWith("/"+webAppPath+"/"))
				urlPub = urlPub + "/" + "panth03";

			if(urlPub != null && !urlPub.equals("") && urlPub.endsWith("/"))
				urlPub = urlPub.substring(0, urlPub.length()-1);
			//urlImmagine = urlPub + "/" + getDipendente().getURLImmagineDipendente();
			urlImmagine = urlPub + "/" + getUtente().getURLImmagineDipendente();
		}catch (SQLException e) {
			e.printStackTrace(Trace.excStream);
		}
		return urlImmagine;
	}

}
