package it.softre.thip.base.cliente;

import java.sql.SQLException;
import com.thera.thermfw.base.SystemParam;
import com.thera.thermfw.persist.Factory;
import com.thera.thermfw.persist.TableManager;
import it.thera.thip.cs.DatiComuniEstesiTTM;

/**
 * <p>
 * Company: Softre Solutions<br>
 * Author: Daniele Signoroni<br>
 * Date: 20/05/2024
 * </p>
 */

/*
 * Revisions:
 * Number   Date        Owner    Description
 * 71543    20/05/2024  DSSOF3   Prima stesura
 * 72395    10/03/2026  GLSOF3   Aggiunta campi
 * 72424    10/03/2026  GLSOF3   Aggiunta campi
 * 72521    10/06/2026  GLSOF3   Aggiunta campo Kasko
 */
public class ClienteSoftreTM extends TableManager {

	public static final String ID_AZIENDA = "ID_AZIENDA";

	public static final String STATO = "STATO";

	public static final String R_UTENTE_CRZ = "R_UTENTE_CRZ";

	public static final String TIMESTAMP_CRZ = "TIMESTAMP_CRZ";

	public static final String R_UTENTE_AGG = "R_UTENTE_AGG";

	public static final String TIMESTAMP_AGG = "TIMESTAMP_AGG";

	public static final String ID_ANAGRAFICO = "ID_ANAGRAFICO";

	public static final String AMBIENTE_SVILUPPO = "AMBIENTE_SVILUPPO";

	//public static final String DATABASE_VENDOR = "DATABASE_VENDOR";

	//Informazioni su Panthera
	public static final String PTH_VRM_01 = "PTH_VRM_01";
	public static final String PTH_VRM_02 = "PTH_VRM_02";
	public static final String SIRIO_VRM_01 = "SIRIO_VRM_01";
	public static final String SIRIO_VRM_02 = "SIRIO_VRM_02";
	public static final String NGINX_ACTIVE_01 = "NGINX_ACTIVE_01";
	public static final String NGINX_ACTIVE_02 = "NGINX_ACTIVE_02";

	//Informazioni su tool di stampa
	public static final String CRYSTAL_VRM_01 = "CRYSTAL_VRM_01";
	public static final String CRYSTAL_VRM_02 = "CRYSTAL_VRM_02";

	//Informazioni sull'application server
	public static final String JVM_APPLICATION_01 = "JVM_APPLICATION_01";
	public static final String JVM_APPLICATION_02 = "JVM_APPLICATION_02";
	public static final String APPLICATION_SVRV_01 = "APPLICATION_SVRV_01";
	public static final String APPLICATION_SVRV_02 = "APPLICATION_SVRV_02";
	public static final String APPLICATION_SVRV_VERSION_01 = "APPLICATION_SVRV_VERSION_01";
	public static final String APPLICATION_SVRV_VERSION_02 = "APPLICATION_SVRV_VERSION_02";
	//public static final String APPLICATION_SVRV_TYPE = "APPLICATION_SVRV_TYPE";

	//Informazioni sul batch server
	public static final String JVM_BATCH_01 = "JVM_BATCH_01";
	public static final String JVM_BATCH_02 = "JVM_BATCH_02";

	//Informazioni sul database
	public static final String DB_VENDOR_01 = "DB_VENDOR_01";
	public static final String DB_VENDOR_02 = "DB_VENDOR_02";
	public static final String DB_VRM_VENDOR_01 = "DB_VRM_VENDOR_01";
	public static final String DB_VRM_VENDOR_02 = "DB_VRM_VENDOR_02";
	public static final String DB_DRIVER_01 = "DB_DRIVER_01";
	public static final String DB_DRIVER_02 = "DB_DRIVER_02";
	public static final String DB_VRM_DRIVER_01 = "DB_VRM_DRIVER_01";
	public static final String DB_VRM_DRIVER_02 = "DB_VRM_DRIVER_02";

	//Informazioni sul Sistema Operativo
	public static final String OS_NAME = "OS_NAME";
	public static final String OS_VERSION = "OS_VERSION";
	public static final String OS_ARCHITECTURE = "OS_ARCHITECTURE";

	public static final String PASSWORD_ADMIN_01 = "PASSWORD_ADMIN_01";

	public static final String PASSWORD_ADMIN_02 = "PASSWORD_ADMIN_02";

	public static final String NOTE_SERVER_SVIL = "NOTE_SERVER_SVIL";

	public static final String MANAGER_PROJECT = "MANAGER_PROJECT";

	public static final String PROJECT_NOTE = "PROJECT_NOTE";

	public static final String NOTE_CLIENTE = "NOTE_CLIENTE";

	public static final String GIT_PROJECT = "GIT_PROJECT";

	public static final String LINK_VPN_CONFIGURATION = "LINK_VPN_CONFIGURATION";

	public static final String LINK_PANTHERA_EXT = "LINK_PANTHERA_EXT";

	public static final String AGGIORNATO_REMOTO = "AGGIORNATO_REMOTO";

	public static final String TIMESTAMP_AGG_REMOTO = "TIMESTAMP_AGG_REMOTO";

	public static final String INTEGRAZIONE_ARCHISMALL = "INTEGRAZIONE_ARCHISMALL";

	public static final String PRESENZA_FIX = "PRESENZA_FIX";

	public static final String PRODOTTO_PRINCIPALE_GESTIONALE = "PRODOTTO_PRINCIPALE";
	public static final String PRODOTTO_PRINCIPALE_CONTABILE = "PRODOTTO_PRINCIPALE_CONTABILE";

	public static final String REF_GESTIONALE = "REF_GESTIONALE";

	public static final String REF_CONTABILE = "REF_CONTABILE";

	public static final String REF_COMMERCIALE_SMEUP = "REF_COMMERCIALE_SMEUP";

	public static final String REF_COMMERCIALE_SISTHEMA = "REF_COMMERCIALE_SISTHEMA";

	public static final String PROPRIETA_CLIENTE = "PROPRIETA_CLIENTE";

	public static final String DATI_EXTRA_CLIENTE = "DATI_EXTRA_CLIENTE";

	public static final String INDIRIZZO_SERVER = "INDIRIZZO_SERVER";

	public static final String USERNAME_SERVER = "USERNAME_SERVER";

	public static final String PASSWORD_SERVER = "PASSWORD_SERVER";

	public static final String NOTE_SERVER = "NOTE_SERVER";

	public static final String URL_PANTH01_INTERNO = "URL_PANTH01_INTERNO";

	public static final String URL_PANTH01_ESTERNO = "URL_PANTH01_ESTERNO";

	public static final String URL_PANTH02_INTERNO = "URL_PANTH02_INTERNO";

	public static final String URL_PANTH02_ESTERNO = "URL_PANTH02_ESTERNO";

	public static final String HTTPS_ATTIVO = "HTTPS_ATTIVO";

	public static final String HTTPS_INTERNO_ESTERNO = "HTTPS_INTERNO_ESTERNO";

	public static final String NOTE_HTTPS = "NOTE_HTTPS";

	public static final String NOTE_CONTABILITA = "NOTE_CONTABILITA";
	
	//<72395 inizio
	public static final String NUMERO_UTENTI = "NUMERO_UTENTI";

	public static final String INDIRIZZO_SVR_STAMPA_AS400 = "INDIRIZZO_SVR_STAMPA_AS400";

	public static final String USERNAME_SVR_STAMPA_AS400 = "USERNAME_SVR_STAMPA_AS400";

	public static final String PASSWORD_SVR_STAMPA_AS400 = "PASSWORD_SVR_STAMPA_AS400";

	public static final String NOTE_SVR_STAMPA_AS400 = "NOTE_SVR_STAMPA_AS400";

	public static final String CAPO_PROGETTO_CLIENTE = "CAPO_PROGETTO_CLIENTE";

	public static final String UTENTE_AREA_RISERVATA_PTH = "UTENTE_AREA_RISERVATA_PTH";

	public static final String PASSWORD_AREA_RISERVATA_PTH = "PASSWORD_AREA_RISERVATA_PTH";

	public static final String UTENTE_MONITOR_FTT_ELETT = "UTENTE_MONITOR_FTT_ELETT";

	public static final String PASSWORD_MONITOR_FTT_ELETT = "PASSWORD_MONITOR_FTT_ELETT";
	//72395 fine>
	
	public static final String SQL_SERVER_EXPRESS_01 = "SQL_SERVER_EXPRESS_01"; //72424

	public static final String SQL_SERVER_EXPRESS_02 = "SQL_SERVER_EXPRESS_02"; //72424
	
	public static final String DATA_SCADENZA_CERTIFICATI = "DATA_SCADENZA_CERTIFICATI"; //72424
	
	public static final String ENDPOINT_TRASMISSIONE = "ENDPOINT_TRASMISSIONE"; //72424
	
	public static final String ENDPOINT_RICEZIONE = "ENDPOINT_RICEZIONE"; //72424
	
	public static final String TIPO_CONSERVAZIONE_SOSTITUTIVA = "TIPO_CONSERVAZIONE_SOSTITUTIVA"; //72424
	
	public static final String KASKO = "KASKO"; //72521
	
	public static final String REF_PERSONALIZZAZIONI = "REF_PERSONALIZZAZIONI"; //72521
	
	public static final String TABLE_NAME = SystemParam.getSchema("SOFTRE") + "CLIENTE_SOFTRE";

	private static TableManager cInstance;

	private static final String CLASS_NAME = it.softre.thip.base.cliente.ClienteSoftre.class.getName();

	public synchronized static TableManager getInstance() throws SQLException {
		if (cInstance == null) {
			cInstance = (TableManager) Factory.createObject(ClienteSoftreTM.class);
		}
		return cInstance;
	}

	public ClienteSoftreTM() throws SQLException {
		super();
	}

	protected void initialize() throws SQLException {
		setTableName(TABLE_NAME);
		setObjClassName(CLASS_NAME);
		init();
	}

	protected void initializeRelation() throws SQLException {
		super.initializeRelation();
		addAttribute("AmbienteSviluppo", AMBIENTE_SVILUPPO);
		//addAttribute("DatabaseVendor", DATABASE_VENDOR);
		addAttribute("PthVrm01", PTH_VRM_01);
		addAttribute("PthVrm02", PTH_VRM_02);
		addAttribute("JvmApplication01", JVM_APPLICATION_01);
		addAttribute("JvmApplication02", JVM_APPLICATION_02);
		addAttribute("JvmBatch01", JVM_BATCH_01);
		addAttribute("JvmBatch02", JVM_BATCH_02);
		addAttribute("SirioVrm01", SIRIO_VRM_01);
		addAttribute("SirioVrm02", SIRIO_VRM_02);
		addAttribute("CrystalVrm01", CRYSTAL_VRM_01);
		addAttribute("CrystalVrm02", CRYSTAL_VRM_02);
		//addAttribute("ApplicationSvrvType", APPLICATION_SVRV_TYPE);
		addAttribute("PasswordAdmin01", PASSWORD_ADMIN_01);
		addAttribute("PasswordAdmin02", PASSWORD_ADMIN_02);
		addAttribute("NoteServerSvil", NOTE_SERVER_SVIL);
		addAttribute("ManagerProject", MANAGER_PROJECT);
		addAttribute("ProjectNote", PROJECT_NOTE);
		addAttribute("NoteCliente", NOTE_CLIENTE);
		addAttribute("GitProject", GIT_PROJECT);
		addAttribute("LinkVpnConfiguration", LINK_VPN_CONFIGURATION);
		addAttribute("LinkPantheraExt", LINK_PANTHERA_EXT);
		addAttribute("IdAzienda", ID_AZIENDA);
		addAttribute("IdAnagrafico", ID_ANAGRAFICO);
		addAttribute("AggiornatoRemoto", AGGIORNATO_REMOTO);
		addAttribute("TimestampAggRemoto", TIMESTAMP_AGG_REMOTO,"getTimestamp");
		addAttribute("IntegrazioneArchismall", INTEGRAZIONE_ARCHISMALL);
		addAttribute("PresenzaFix", PRESENZA_FIX);
		addAttribute("NginxActive01", NGINX_ACTIVE_01);
		addAttribute("NginxActive02", NGINX_ACTIVE_02);
		addAttribute("ApplicationSvrv01", APPLICATION_SVRV_01);
		addAttribute("ApplicationSvrv02", APPLICATION_SVRV_02);
		addAttribute("ApplicationSrvVer01", APPLICATION_SVRV_VERSION_01);
		addAttribute("ApplicationSrvVer02", APPLICATION_SVRV_VERSION_02);
		addAttribute("DbVendor01", DB_VENDOR_01);
		addAttribute("DbVendor02", DB_VENDOR_02);
		addAttribute("DbVrmVendor01", DB_VRM_VENDOR_01);
		addAttribute("DbVrmVendor02", DB_VRM_VENDOR_02);
		addAttribute("DbDriver01", DB_DRIVER_01);
		addAttribute("DbDriver02", DB_DRIVER_02);
		addAttribute("DbVrmDriver01", DB_VRM_DRIVER_01);
		addAttribute("DbVrmDriver02", DB_VRM_DRIVER_02);
		addAttribute("OsName", OS_NAME);
		addAttribute("OsVersion", OS_VERSION);
		addAttribute("OsArchitecture", OS_ARCHITECTURE);
		addAttribute("ProdottoPrincipaleGest", PRODOTTO_PRINCIPALE_GESTIONALE);
		addAttribute("ProdottoPrincipaleCont", PRODOTTO_PRINCIPALE_CONTABILE);
		addAttribute("ProprietaCliente", PROPRIETA_CLIENTE);
		addAttribute("DatiExtraCliente", DATI_EXTRA_CLIENTE);
		addAttribute("IndirizzoServer", INDIRIZZO_SERVER);
		addAttribute("UsernameServer", USERNAME_SERVER);
		addAttribute("PasswordServer", PASSWORD_SERVER);
		addAttribute("NoteServer", NOTE_SERVER);
		addAttribute("UrlPanth01Interno", URL_PANTH01_INTERNO);
		addAttribute("UrlPanth01Esterno", URL_PANTH01_ESTERNO);
		addAttribute("UrlPanth02Interno", URL_PANTH02_INTERNO);
		addAttribute("UrlPanth02Esterno", URL_PANTH02_ESTERNO);
		addAttribute("HttpsAttivo", HTTPS_ATTIVO);
		addAttribute("HttpsInternoEsterno", HTTPS_INTERNO_ESTERNO);
		addAttribute("NoteHttps", NOTE_HTTPS);
		addAttribute("NoteContabilita", NOTE_CONTABILITA);
		addAttribute("RefGestionale", REF_GESTIONALE);
		addAttribute("RefContabile", REF_CONTABILE);
		addAttribute("RefCommercialeSmeup", REF_COMMERCIALE_SMEUP);
		addAttribute("RefCommercialeSisth", REF_COMMERCIALE_SISTHEMA);
		//<72395 inizio
		addAttribute("NumeroUtenti", NUMERO_UTENTI);
		addAttribute("IndirizzoSvrStampaAS400", INDIRIZZO_SVR_STAMPA_AS400);
		addAttribute("UsernameSvrStampaAS400", USERNAME_SVR_STAMPA_AS400);
		addAttribute("PasswordSvrStampaAS400", PASSWORD_SVR_STAMPA_AS400);
		addAttribute("NoteSvrStampaAS400", NOTE_SVR_STAMPA_AS400);
		addAttribute("CapProgettoCliente", CAPO_PROGETTO_CLIENTE);
		addAttribute("UtenteAreaRiservataPth", UTENTE_AREA_RISERVATA_PTH);
		addAttribute("PasswordAreaRiservataPth", PASSWORD_AREA_RISERVATA_PTH);
		addAttribute("UtenteMonitorFttElett", UTENTE_MONITOR_FTT_ELETT);
		addAttribute("PasswordMonitorFttElett", PASSWORD_MONITOR_FTT_ELETT);
		//72395 fine>
		addAttribute("SQLServerExpress01", SQL_SERVER_EXPRESS_01); //72424
		addAttribute("SQLServerExpress02", SQL_SERVER_EXPRESS_02); //72424
		addAttribute("DataScadenzaCertificati", DATA_SCADENZA_CERTIFICATI); //72424
		addAttribute("EndpointTrasmissione", ENDPOINT_TRASMISSIONE); //72424
		addAttribute("EndpointRicezione", ENDPOINT_RICEZIONE); //72424
		addAttribute("TipoConservazSostitutiva", TIPO_CONSERVAZIONE_SOSTITUTIVA); //72424
		addAttribute("Kasko", KASKO); //72521
		addAttribute("RefPersonalizzazioni", REF_PERSONALIZZAZIONI);

		addComponent("DatiComuniEstesi", DatiComuniEstesiTTM.class);
		setKeys(ID_AZIENDA + "," + ID_ANAGRAFICO);

		setTimestampColumn("TIMESTAMP_AGG");
		((it.thera.thip.cs.DatiComuniEstesiTTM) getTransientTableManager("DatiComuniEstesi")).setExcludedColums();
	}

	private void init() throws SQLException {
		configure();
	}

}
