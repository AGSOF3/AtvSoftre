package it.softre.thip.base.attivita.web;
import com.thera.thermfw.persist.KeyHelper;
import com.thera.thermfw.persist.PersistentObject;
import com.thera.thermfw.web.ServletEnvironment;
import com.thera.thermfw.web.servlet.BaseServlet;

import it.softre.thip.base.attivita.AttivitaSoftre;
import it.thera.thip.base.azienda.Azienda;

/**
 *
 * <p></p>
 *
 * <p>
 * Company: Softre Solutions<br>
 * Author: Daniele Signoroni<br>
 * Date: 06/08/2026
 * </p>
 */

/*
 * Revisions:
 * Number   Date        Owner    Description
 * 72XXX    06/08/2026  DSSOF3   Prima stesura
 */

public class InvioRiepilogoAttivitaRichiedente extends BaseServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void processAction(ServletEnvironment se) throws Exception {
		String id = getStringParameter(se.getRequest(), "Id");
		AttivitaSoftre atv = (AttivitaSoftre) AttivitaSoftre.elementWithKey(AttivitaSoftre.class, KeyHelper.buildObjectKey(new String[] {
				Azienda.getAziendaCorrente(), id
		}), PersistentObject.NO_LOCK);
		if(atv != null) {

		}
	}

}
