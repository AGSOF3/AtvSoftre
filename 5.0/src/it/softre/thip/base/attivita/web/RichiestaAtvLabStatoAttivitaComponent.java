package it.softre.thip.base.attivita.web;

import java.util.Vector;

import com.thera.thermfw.collector.BaseBOComponentManager;
import com.thera.thermfw.type.EnumType;
import com.thera.thermfw.type.Type;

import it.softre.thip.base.attivita.AttivitaSoftre;

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

public class RichiestaAtvLabStatoAttivitaComponent extends BaseBOComponentManager {

	protected Type originalType = null;

	public RichiestaAtvLabStatoAttivitaComponent(String classADCollectionName,String classADName)
	{
		super(classADCollectionName, classADName);
	}

	public void initialize()
	{
		super.initialize();
		disabilitaStati();
	}

	public void loadAttValue()
	{
		disabilitaStati();
		super.loadAttValue();
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected void disabilitaStati()
	{
		if (originalType == null)
			originalType = type;

		EnumType et = new EnumType(type.getAttributeRef());
		Vector originalValues = et.getAttValues();
		Vector originalDescs = et.getAttValueDescriptions();
		Vector newValues = new Vector();
		Vector newDescs = new Vector();

		for (int i = 0; i < originalValues.size(); i++) {
			String val = (String) originalValues.get(i);

			if (val.equalsIgnoreCase(String.valueOf(AttivitaSoftre.DA_ANALIZZARE))
					|| val.equalsIgnoreCase(String.valueOf(AttivitaSoftre.DA_QUOTARE))
					|| val.equalsIgnoreCase(String.valueOf(AttivitaSoftre.CONFERMATO_CLIENTE))) {

				newValues.add(originalValues.get(i));
				newDescs.add(originalDescs.get(i));
			}
		}

		type = new EnumType(newValues, newDescs);
		type.setCorrespondingJavaClass(originalType.getCorrespondingJavaClass());
		type.setCorrespondingJavaClass(originalType.getCorrespondingJavaClass());
	}
}
