package it.softre.thip.base.attivita;

import java.sql.SQLException;

import com.thera.thermfw.persist.Factory;

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

public class RichiestaAttivitaLaboratorio extends AttivitaSoftre {

	public RichiestaAttivitaLaboratorio() {
		setPriorita(NON_SIGNIFICATIVO);
	}

	@Override
	public int save() throws SQLException {
		boolean isOnDB = isOnDB();
		if(getRubricaSoftre() != null && !isOnDB) {
			aggiuntiRichiedenteCollaboratore();
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
}