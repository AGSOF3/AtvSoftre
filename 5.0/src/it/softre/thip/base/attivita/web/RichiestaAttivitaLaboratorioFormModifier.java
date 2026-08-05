package it.softre.thip.base.attivita.web;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

import com.thera.thermfw.gui.cnr.OpenType;
import com.thera.thermfw.web.WebFormModifier;

import it.softre.thip.base.attivita.RichiestaAttivitaLaboratorio;
import it.thera.thip.base.profilo.UtenteAzienda;

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

public class RichiestaAttivitaLaboratorioFormModifier extends WebFormModifier {

	@Override
	public void writeHeadElements(JspWriter out) throws IOException {
		RichiestaAttivitaLaboratorio bo = (RichiestaAttivitaLaboratorio) getBODataCollector().getBo();
		int mode = getMode();
		if(mode == OpenType.NEW) {
			bo.setRubricaSoftre(UtenteAzienda.getUtenteAziendaConnesso().getDipendente());
		}
	}

	@Override
	public void writeBodyStartElements(JspWriter out) throws IOException {

	}

	@Override
	public void writeFormStartElements(JspWriter out) throws IOException {

	}

	@Override
	public void writeFormEndElements(JspWriter out) throws IOException {

	}

	@Override
	public void writeBodyEndElements(JspWriter out) throws IOException {

	}

}
