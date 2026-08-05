package it.softre.thip.base.attivita.utils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

import it.thera.thip.base.generale.ParametroPsn;

/**
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

public class UtilsInvioMail {

	/**
	 * Restituisce il path base dei template mail.
	 */
	public static String pathTemplateMail() {
		return ParametroPsn.getValoreParametroPsn("AttivitaSoftre", "PathTemplateMail");
	}

	/**
	 * Carica il contenuto di un template.
	 *
	 * @param templateName es. "assegnazione-attivita.html"
	 */
	public static String loadTemplate(String templateName) throws IOException {

		Path path = Paths.get(pathTemplateMail(), templateName);

		if (!Files.exists(path)) {
			throw new IOException("Template mail non trovato: " + path.toString());
		}

		return new String(Files.readAllBytes(path), StandardCharsets.UTF_8);
	}

	/**
	 * Esegue il rendering del template sostituendo tutti i placeholder.
	 *
	 * Placeholder:
	 * {{NOME}}
	 * {{CLIENTE}}
	 * {{DATA}}
	 */
	public static String renderTemplate(String templateName, Map<String, String> values) throws IOException {

		String html = loadTemplate(templateName);

		if (values != null) {
			for (Map.Entry<String, String> entry : values.entrySet()) {

				String value = entry.getValue() == null ? "" : entry.getValue();

				html = html.replace("{{" + entry.getKey() + "}}", value);
			}
		}

		// Elimina eventuali placeholder non valorizzati
		html = html.replaceAll("\\{\\{[^}]+\\}\\}", "");

		return html;
	}

	/**
	 * Verifica l'esistenza di un template.
	 */
	public static boolean existsTemplate(String templateName) {

		Path path = Paths.get(pathTemplateMail(), templateName);

		return Files.exists(path);
	}
}