package it.softre.thip.base.attivita.web;

import com.thera.thermfw.collector.BaseBOComponentManager;
import com.thera.thermfw.collector.SecondaryDataCollector;
import com.thera.thermfw.gui.cnr.OpenType;
import com.thera.thermfw.web.WebEnhDataCollector;

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

public class RichiestaAttivitaLaboratorioDC extends WebEnhDataCollector {

	@Override
	public void initializeHandlingModeOnComponentManagers() {
		int mode = getMode();
		if(mode == OpenType.NEW) {
			getComponentManager("NomeAttivita").setMandatory(true);
			getComponentManager("IdClienteSoftre").setMandatory(true);
			getComponentManager("DescrizioneAttivita").setMandatory(true);
			getComponentManager("RichiedenteSoftre").setReadOnly(true);
		}
	}

	@Override
	public void updateHandlingModeOnComponentManagers() {

	}

	@Override
	protected BaseBOComponentManager createComponentManager(String classADCollectionName, String classADName,
			SecondaryDataCollector secondaryDataCollector) {
		BaseBOComponentManager man = null;
		if (classADName.equalsIgnoreCase("StatoAttivita"))
		{
			man = new RichiestaAtvLabStatoAttivitaComponent(classADCollectionName, classADName);
		}
		else
		{
			man = super.createComponentManager(classADCollectionName,classADName,secondaryDataCollector);
		}
		man.setBODataCollector(this);
		man.setSecondaryDataCollector(secondaryDataCollector);
		return man;
	}

}
