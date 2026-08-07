package it.softre.thip.base.attivita.web;

import java.sql.SQLException;

import com.thera.thermfw.base.Trace;
import com.thera.thermfw.security.Entity;
import com.thera.thermfw.security.EntityNotFoundException;
import com.thera.thermfw.web.WebToolBar;
import com.thera.thermfw.web.WebToolBarButton;
import com.thera.thermfw.web.servlet.FormActionAdapter;

import it.softre.thip.base.attivita.AttivitaSoftre;

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

public class AttivitaSoftreFormActionAdapter extends FormActionAdapter {

	private static final long serialVersionUID = 1L;

	public static final String RES_FILE = "it.softre.thip.base.attivita.resources.AttivitaSoftre";
	public static final String INVIO_RIEP_RICHIEDENTE = "INV_RIE_RICH";

	@Override
	public void modifyToolBar(WebToolBar toolBar) {
		super.modifyToolBar(toolBar);

		if(isUserAuthorized(INVIO_RIEP_RICHIEDENTE)) {
			toolBar.addButton(getgButtonInvioRiepilogoRichiedente());
		}

	}

	public boolean isUserAuthorized(String taskId) {
		try {
			String entityId = Entity.findEntityId(AttivitaSoftre.class);
			return com.thera.thermfw.security.Security.validate(entityId, taskId);
		} catch (SQLException e) {
			e.printStackTrace(Trace.excStream);
		} catch (EntityNotFoundException e) {
			e.printStackTrace(Trace.excStream);
		}
		return false;
	}

	public WebToolBarButton getgButtonInvioRiepilogoRichiedente(){
		return new WebToolBarButton("InvioRiepilogoRichiedente", "action_submit", "errorsFrame", "no",
				RES_FILE, "InvioRiepilogoRichiedenteBtn",
				getInvioRiepilogoRichiedenteImmagine(), INVIO_RIEP_RICHIEDENTE, "single", false, true, getInvioRiepilogoRichiedenteImmagine());
	}

	public String getInvioRiepilogoRichiedenteImmagine() {
		return "thermweb/image/gui/cnr/SendDocument.svg";
	}
}
