package it.softre.thip.base.attivita.web;

import com.thera.thermfw.ad.ClassADCollection;
import com.thera.thermfw.web.ServletEnvironment;
import com.thera.thermfw.web.ViewSelectorDefault;

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
public class RichiestaAttivitaLaboratorioViewSelector extends ViewSelectorDefault {

	@Override
	public String getNewObjectURL(ClassADCollection cadc, ServletEnvironment se, String actionAdapterName) {
		String newObjectURL = super.getNewObjectURL(cadc, se, actionAdapterName);
		newObjectURL = newObjectURL.replace("AttivitaSoftre", "RichiestaAttivitaLaboratorio");
		return newObjectURL;
	}
}