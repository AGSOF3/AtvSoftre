package it.softre.thip.base.cliente;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import com.thera.thermfw.common.BaseComponentsCollection;
import com.thera.thermfw.common.BusinessObject;
import com.thera.thermfw.common.Deletable;
import com.thera.thermfw.persist.CopyException;
import com.thera.thermfw.persist.Copyable;
import com.thera.thermfw.persist.ErrorCodes;
import com.thera.thermfw.persist.Factory;
import com.thera.thermfw.persist.KeyHelper;
import com.thera.thermfw.persist.OneToMany;
import com.thera.thermfw.persist.PersistentObject;
import com.thera.thermfw.persist.Proxy;
import com.thera.thermfw.persist.TableManager;
import com.thera.thermfw.security.Authorizable;
import com.thera.thermfw.security.Conflictable;
import it.thera.thip.base.azienda.Azienda;
import it.thera.thip.base.dipendente.Dipendente;
import it.thera.thip.base.partner.AnagraficoDiBasePrimrose;
import it.thera.thip.base.profilo.UtenteAzienda;
import it.thera.thip.cs.EntitaAzienda;

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
 * 72447    16/04/2026  GLSOF3   Aggiunta campi
 * 72521    10/06/2026  GLSOF3   Aggiunta campo Kasko
 */
public abstract class ClienteSoftrePO extends EntitaAzienda implements BusinessObject, Authorizable, Deletable, Conflictable {

	private static ClienteSoftre cInstance;

	protected char iAmbienteSviluppo = '-';

	protected char iDatabaseVendor = '1';

	protected String iPthVrm01;

	protected String iPthVrm02;

	protected String iJvmApplication01;

	protected String iJvmApplication02;

	protected String iJvmBatch01;

	protected String iJvmBatch02;

	protected String iSirioVrm01;

	protected String iSirioVrm02;

	protected String iCrystalVrm01;

	protected String iCrystalVrm02;

	protected String iApplicationSvrvType;

	protected String iPasswordAdmin01;

	protected String iPasswordAdmin02;

	protected String iNoteServerSvil;

	protected char iManagerProject = '0';

	protected String iProjectNote;

	protected String iNoteCliente;

	protected String iGitProject;

	protected String iLinkVpnConfiguration;

	protected String iLinkPantheraExt;

	protected Proxy iAnagraficodibase = new Proxy(it.thera.thip.base.partner.AnagraficoDiBasePrimrose.class);

	protected boolean iIntegrazioneArchismall;

	protected boolean iPresenzaFix;

	// Informazioni su NGINX
	protected String iNginxActive01;
	protected String iNginxActive02;

	// Informazioni sull'application server
	protected String iApplicationSvrv01;
	protected String iApplicationSvrv02;
	protected String iApplicationSrvVer01;
	protected String iApplicationSrvVer02;

	// Informazioni sul database
	protected String iDbVendor01;
	protected String iDbVendor02;
	protected String iDbVrmVendor01;
	protected String iDbVrmVendor02;
	protected String iDbDriver01;
	protected String iDbDriver02;
	protected String iDbVrmDriver01;
	protected String iDbVrmDriver02;

	// Informazioni sul Sistema Operativo
	protected String iOsName;
	protected String iOsVersion;
	protected String iOsArchitecture;

	protected char iProdottoPrincipaleGest = '-';
	protected char iProdottoPrincipaleCont = '-';

	protected char iProprietaCliente = '0';

	protected String iDatiExtraCliente;

	protected String iIndirizzoServer;

	protected String iUsernameServer;

	protected String iPasswordServer;

	protected String iNoteServer;

	protected String iUrlPanth01Interno;

	protected String iUrlPanth01Esterno;

	protected String iUrlPanth02Interno;

	protected String iUrlPanth02Esterno;

	protected boolean iHttpsAttivo = false;

	protected char iHttpsInternoEsterno = 'I';

	protected String iNoteHttps;

	protected String iNoteContabilita;

	protected Proxy iReferentegestionale = new Proxy(it.thera.thip.base.profilo.UtenteAzienda.class);

	protected Proxy iReferentecontabile = new Proxy(it.thera.thip.base.profilo.UtenteAzienda.class);

	protected Proxy iReferentecommercialesmeup = new Proxy(it.thera.thip.base.profilo.UtenteAzienda.class);

	protected Proxy iReferentesisthcommerciale = new Proxy(it.thera.thip.base.profilo.UtenteAzienda.class);

	protected OneToMany iFixAddOn = new OneToMany(it.softre.thip.base.cliente.YFixAddonCliSoftre.class, this, 3, false);

	protected OneToMany iVPNCliente = new OneToMany(it.softre.thip.base.cliente.YYvpnCliente.class, this, 3, false);

	//<72395 inizio
	protected Integer iNumeroUtenti;

	protected String iIndirizzoSvrStampaAS400;

	protected String iUsernameSvrStampaAS400;

	protected String iPasswordSvrStampaAS400;

	protected String iNoteSvrStampaAS400;

	protected Proxy iCapoProgettoCliente = new Proxy(it.thera.thip.base.profilo.UtenteAzienda.class);

	protected String iUtenteAreaRiservataPth;

	protected String iPasswordAreaRiservataPth;

	protected String iUtenteMonitorFttElett;

	protected String iPasswordMonitorFttElett;

	protected OneToMany iModuliInstallati = new OneToMany(it.softre.thip.base.cliente.YModuliCliente.class, this, 3, false);

	protected OneToMany iInterventiSpot = new OneToMany(it.softre.thip.base.cliente.YInterventiSpot.class, this, 3, false);

	protected OneToMany iDocumentazioneCliente = new OneToMany(it.softre.thip.base.cliente.YDocumentazioneCliente.class, this, 3, false);
	//72395 fine>

	protected boolean iSQLServerExpress01; //72424
	
	protected boolean iSQLServerExpress02; //72424
	
	protected Date iDataScadenzaCertificati; //72424
	
	protected String iEndpointTrasmissione; //72424
	
	protected String iEndpointRicezione; //72424
	
	protected char iTipoConservazSostitutiva = '5'; //72424
	
	protected OneToMany iWifiCliente = new OneToMany(it.softre.thip.base.cliente.YWifiCliente.class, this, 3, false); //72447

	protected OneToMany iServerAggiuntivi = new OneToMany(it.softre.thip.base.cliente.YServerAggiuntivi.class, this, 3, false);//72447
	
	protected boolean iKasko = false; //72521
	
	protected Proxy iRefPersonalizzazioni = new Proxy(Dipendente.class);
	
	// Database vendor
	public static final char SQL_SERVER = '1';
	public static final char DB2 = '2';
	public static final char DB2_AS400 = '3';

	// Gestore progetto
	public static final char SOFTRE = '0';
	public static final char SISTHEMA = '1';
	public static final char PARTNER_TERZO = '2';

	// Tipo ambiente
	public static final char NON_SIGNIFICATIVO = '-';
	public static final char ALTRO = 'A';
	public static final char LOCALE = 'L';
	public static final char SERVER = 'S';

	//Prodotto principale
	public static final char PANTHERA = 'P';
	public static final char SAP = 'A';
	public static final char SMEUP_ERP = 'S';
	public static final char GIRPOS = 'G';
	public static final char FREEDOM = 'F';

	@SuppressWarnings("rawtypes")
	public static Vector retrieveList(String where, String orderBy, boolean optimistic)
			throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		if (cInstance == null)
			cInstance = (ClienteSoftre) Factory.createObject(ClienteSoftre.class);
		return PersistentObject.retrieveList(cInstance, where, orderBy, optimistic);
	}

	public static ClienteSoftre elementWithKey(String key, int lockType) throws SQLException {
		return (ClienteSoftre) PersistentObject.elementWithKey(ClienteSoftre.class, key, lockType);
	}

	public ClienteSoftrePO() {
		setAmbienteSviluppo(NON_SIGNIFICATIVO);
		setDatabaseVendor(SQL_SERVER);
		setManagerProject(SOFTRE);
		setIdAzienda(Azienda.getAziendaCorrente());
		setIntegrazioneArchismall(false);
		setPresenzaFix(false);
		setProdottoPrincipaleGest(PANTHERA);
		setProdottoPrincipaleCont(PANTHERA);
		setProprietaCliente('0');
		setHttpsAttivo(false);
		setHttpsInternoEsterno('I');
		setTipoConservazSostitutiva('5'); //72424
	}

	public void setAmbienteSviluppo(char ambienteSviluppo) {
		this.iAmbienteSviluppo = ambienteSviluppo;
		setDirty();
	}

	public char getAmbienteSviluppo() {
		return iAmbienteSviluppo;
	}

	public void setDatabaseVendor(char databaseVendor) {
		this.iDatabaseVendor = databaseVendor;
		setDirty();
	}

	public char getDatabaseVendor() {
		return iDatabaseVendor;
	}

	public void setPthVrm01(String pthVrm01) {
		this.iPthVrm01 = pthVrm01;
		setDirty();
	}

	public String getPthVrm01() {
		return iPthVrm01;
	}

	public void setPthVrm02(String pthVrm02) {
		this.iPthVrm02 = pthVrm02;
		setDirty();
	}

	public String getPthVrm02() {
		return iPthVrm02;
	}

	public void setJvmApplication01(String jvmApplication01) {
		this.iJvmApplication01 = jvmApplication01;
		setDirty();
	}

	public String getJvmApplication01() {
		return iJvmApplication01;
	}

	public void setJvmApplication02(String jvmApplication02) {
		this.iJvmApplication02 = jvmApplication02;
		setDirty();
	}

	public String getJvmApplication02() {
		return iJvmApplication02;
	}

	public void setJvmBatch01(String jvmBatch01) {
		this.iJvmBatch01 = jvmBatch01;
		setDirty();
	}

	public String getJvmBatch01() {
		return iJvmBatch01;
	}

	public void setJvmBatch02(String jvmBatch02) {
		this.iJvmBatch02 = jvmBatch02;
		setDirty();
	}

	public String getJvmBatch02() {
		return iJvmBatch02;
	}

	public void setSirioVrm01(String sirioVrm01) {
		this.iSirioVrm01 = sirioVrm01;
		setDirty();
	}

	public String getSirioVrm01() {
		return iSirioVrm01;
	}

	public void setSirioVrm02(String sirioVrm02) {
		this.iSirioVrm02 = sirioVrm02;
		setDirty();
	}

	public String getSirioVrm02() {
		return iSirioVrm02;
	}

	public void setCrystalVrm01(String crystalVrm01) {
		this.iCrystalVrm01 = crystalVrm01;
		setDirty();
	}

	public String getCrystalVrm01() {
		return iCrystalVrm01;
	}

	public void setCrystalVrm02(String crystalVrm02) {
		this.iCrystalVrm02 = crystalVrm02;
		setDirty();
	}

	public String getCrystalVrm02() {
		return iCrystalVrm02;
	}

	public void setApplicationSvrvType(String applicationSvrvType) {
		this.iApplicationSvrvType = applicationSvrvType;
		setDirty();
	}

	public String getApplicationSvrvType() {
		return iApplicationSvrvType;
	}

	public void setPasswordAdmin01(String passwordAdmin01) {
		this.iPasswordAdmin01 = passwordAdmin01;
		setDirty();
	}

	public String getPasswordAdmin01() {
		return iPasswordAdmin01;
	}

	public void setPasswordAdmin02(String passwordAdmin02) {
		this.iPasswordAdmin02 = passwordAdmin02;
		setDirty();
	}

	public String getPasswordAdmin02() {
		return iPasswordAdmin02;
	}

	public void setNoteServerSvil(String noteServerSvil) {
		this.iNoteServerSvil = noteServerSvil;
		setDirty();
	}

	public String getNoteServerSvil() {
		return iNoteServerSvil;
	}

	public void setManagerProject(char managerProject) {
		this.iManagerProject = managerProject;
		setDirty();
	}

	public char getManagerProject() {
		return iManagerProject;
	}

	public void setProjectNote(String projectNote) {
		this.iProjectNote = projectNote;
		setDirty();
	}

	public String getProjectNote() {
		return iProjectNote;
	}

	public void setNoteCliente(String noteCliente) {
		this.iNoteCliente = noteCliente;
		setDirty();
	}

	public String getNoteCliente() {
		return iNoteCliente;
	}

	public void setGitProject(String gitProject) {
		this.iGitProject = gitProject;
		setDirty();
	}

	public String getGitProject() {
		return iGitProject;
	}

	public void setLinkVpnConfiguration(String linkVpnConfiguration) {
		this.iLinkVpnConfiguration = linkVpnConfiguration;
		setDirty();
	}

	public String getLinkVpnConfiguration() {
		return iLinkVpnConfiguration;
	}

	public void setLinkPantheraExt(String linkPantheraExt) {
		this.iLinkPantheraExt = linkPantheraExt;
		setDirty();
	}

	public String getLinkPantheraExt() {
		return iLinkPantheraExt;
	}

	public void setIdAzienda(String idAzienda) {
		iAzienda.setKey(idAzienda);
		setDirty();
		setOnDB(false);
		iFixAddOn.setFatherKeyChanged();
		iVPNCliente.setFatherKeyChanged();
		iModuliInstallati.setFatherKeyChanged(); //72395
		iInterventiSpot.setFatherKeyChanged(); //72395
		iDocumentazioneCliente.setFatherKeyChanged(); //72395
		iWifiCliente.setFatherKeyChanged(); //72447
		iServerAggiuntivi.setFatherKeyChanged(); //72447
	}

	public String getIdAzienda() {
		String key = iAzienda.getKey();
		return key;
	}

	public void setAnagraficodibase(AnagraficoDiBasePrimrose anagraficodibase) {
		this.iAnagraficodibase.setObject(anagraficodibase);
		setDirty();
		setOnDB(false);
	}

	public AnagraficoDiBasePrimrose getAnagraficodibase() {
		return (AnagraficoDiBasePrimrose) iAnagraficodibase.getObject();
	}

	public void setAnagraficodibaseKey(String key) {
		iAnagraficodibase.setKey(key);
		setDirty();
		setOnDB(false);
	}

	public String getAnagraficodibaseKey() {
		return iAnagraficodibase.getKey();
	}

	public void setIdAnagrafico(java.math.BigDecimal idAnagrafico) {
		iAnagraficodibase.setKey(KeyHelper.objectToString(idAnagrafico));
		setDirty();
		setOnDB(false);
		iFixAddOn.setFatherKeyChanged();
		iVPNCliente.setFatherKeyChanged();
		iModuliInstallati.setFatherKeyChanged(); //72395
		iInterventiSpot.setFatherKeyChanged(); //72395
		iDocumentazioneCliente.setFatherKeyChanged(); //72395
		iWifiCliente.setFatherKeyChanged(); //72447
		iServerAggiuntivi.setFatherKeyChanged(); //72447
	}

	public java.math.BigDecimal getIdAnagrafico() {
		String key = iAnagraficodibase.getKey();
		return KeyHelper.stringToBigDecimal(key);
	}

	public boolean isIntegrazioneArchismall() {
		return iIntegrazioneArchismall;
	}

	public void setIntegrazioneArchismall(boolean iIntegrazioneArchismall) {
		this.iIntegrazioneArchismall = iIntegrazioneArchismall;
		setDirty();
	}

	public boolean isPresenzaFix() {
		return iPresenzaFix;
	}

	public void setPresenzaFix(boolean iPresenzaFix) {
		this.iPresenzaFix = iPresenzaFix;
		setDirty();
	}

	public String getNginxActive01() {
		return iNginxActive01;
	}

	public void setNginxActive01(String iNginxActive01) {
		this.iNginxActive01 = iNginxActive01;
	}

	public String getNginxActive02() {
		return iNginxActive02;
	}

	public void setNginxActive02(String iNginxActive02) {
		this.iNginxActive02 = iNginxActive02;
	}

	public String getApplicationSvrv01() {
		return iApplicationSvrv01;
	}

	public void setApplicationSvrv01(String iApplicationSvrv01) {
		this.iApplicationSvrv01 = iApplicationSvrv01;
	}

	public String getApplicationSvrv02() {
		return iApplicationSvrv02;
	}

	public void setApplicationSvrv02(String iApplicationSvrv02) {
		this.iApplicationSvrv02 = iApplicationSvrv02;
	}

	public String getApplicationSrvVer01() {
		return iApplicationSrvVer01;
	}

	public void setApplicationSrvVer01(String iApplicationSrvVer01) {
		this.iApplicationSrvVer01 = iApplicationSrvVer01;
	}

	public String getApplicationSrvVer02() {
		return iApplicationSrvVer02;
	}

	public void setApplicationSrvVer02(String iApplicationSrvVer02) {
		this.iApplicationSrvVer02 = iApplicationSrvVer02;
	}

	public String getDbVendor01() {
		return iDbVendor01;
	}

	public void setDbVendor01(String iDbVendor01) {
		this.iDbVendor01 = iDbVendor01;
	}

	public String getDbVendor02() {
		return iDbVendor02;
	}

	public void setDbVendor02(String iDbVendor02) {
		this.iDbVendor02 = iDbVendor02;
	}

	public String getDbVrmVendor01() {
		return iDbVrmVendor01;
	}

	public void setDbVrmVendor01(String iDbVrmVendor01) {
		this.iDbVrmVendor01 = iDbVrmVendor01;
	}

	public String getDbVrmVendor02() {
		return iDbVrmVendor02;
	}

	public void setDbVrmVendor02(String iDbVrmVendor02) {
		this.iDbVrmVendor02 = iDbVrmVendor02;
	}

	public String getDbDriver01() {
		return iDbDriver01;
	}

	public void setDbDriver01(String iDbDriver01) {
		this.iDbDriver01 = iDbDriver01;
	}

	public String getDbDriver02() {
		return iDbDriver02;
	}

	public void setDbDriver02(String iDbDriver02) {
		this.iDbDriver02 = iDbDriver02;
	}

	public String getDbVrmDriver01() {
		return iDbVrmDriver01;
	}

	public void setDbVrmDriver01(String iDbVrmDriver01) {
		this.iDbVrmDriver01 = iDbVrmDriver01;
	}

	public String getDbVrmDriver02() {
		return iDbVrmDriver02;
	}

	public void setDbVrmDriver02(String iDbVrmDriver02) {
		this.iDbVrmDriver02 = iDbVrmDriver02;
	}

	public String getOsName() {
		return iOsName;
	}

	public void setOsName(String iOsName) {
		this.iOsName = iOsName;
	}

	public String getOsVersion() {
		return iOsVersion;
	}

	public void setOsVersion(String iOsVersion) {
		this.iOsVersion = iOsVersion;
	}

	public String getOsArchitecture() {
		return iOsArchitecture;
	}

	public void setOsArchitecture(String iOsArchitecture) {
		this.iOsArchitecture = iOsArchitecture;
	}

	public void setEqual(Copyable obj) throws CopyException {
		super.setEqual(obj);
		ClienteSoftrePO clienteSoftrePO = (ClienteSoftrePO) obj;
		iAnagraficodibase.setEqual(clienteSoftrePO.iAnagraficodibase);
		iReferentegestionale.setEqual(clienteSoftrePO.iReferentegestionale);
		iReferentecontabile.setEqual(clienteSoftrePO.iReferentecontabile);
		iReferentecommercialesmeup.setEqual(clienteSoftrePO.iReferentecommercialesmeup);
		iReferentesisthcommerciale.setEqual(clienteSoftrePO.iReferentesisthcommerciale);
		iFixAddOn.setEqual(clienteSoftrePO.iFixAddOn);
		iVPNCliente.setEqual(clienteSoftrePO.iVPNCliente);
		iCapoProgettoCliente.setEqual(clienteSoftrePO.iCapoProgettoCliente); //72395
		iModuliInstallati.setEqual(clienteSoftrePO.iModuliInstallati); //72395
		iInterventiSpot.setEqual(clienteSoftrePO.iInterventiSpot); //72395
		iDocumentazioneCliente.setEqual(clienteSoftrePO.iDocumentazioneCliente); //72395
		iWifiCliente.setEqual(clienteSoftrePO.iWifiCliente); //72447
		iServerAggiuntivi.setEqual(clienteSoftrePO.iServerAggiuntivi); //72447
	}

	@SuppressWarnings("rawtypes")
	public Vector checkAll(BaseComponentsCollection components) {
		Vector errors = new Vector();
		components.runAllChecks(errors);
		return errors;
	}

	public void setKey(String key) {
		setIdAzienda(KeyHelper.getTokenObjectKey(key, 1));
		setIdAnagrafico(KeyHelper.stringToBigDecimal(KeyHelper.getTokenObjectKey(key, 2)));
	}

	public String getKey() {
		String idAzienda = getIdAzienda();
		java.math.BigDecimal idAnagrafico = getIdAnagrafico();
		Object[] keyParts = { idAzienda, idAnagrafico };
		return KeyHelper.buildObjectKey(keyParts);
	}

	public boolean isDeletable() {
		return checkDelete() == null;
	}

	public String toString() {
		return getClass().getName() + " [" + KeyHelper.formatKeyString(getKey()) + "]";
	}

	protected TableManager getTableManager() throws SQLException {
		return ClienteSoftreTM.getInstance();
	}

	public void setProdottoPrincipaleGest(char prodottoPrincipale) {
		this.iProdottoPrincipaleGest = prodottoPrincipale;
		setDirty();
	}

	public char getProdottoPrincipaleGest() {
		return iProdottoPrincipaleGest;
	}

	public char getProdottoPrincipaleCont() {
		return iProdottoPrincipaleCont;
	}

	public void setProdottoPrincipaleCont(char iProdottoPrincipaleCont) {
		this.iProdottoPrincipaleCont = iProdottoPrincipaleCont;
		setDirty();
	}

	public void setProprietaCliente(char proprietaCliente) {
		this.iProprietaCliente = proprietaCliente;
		setDirty();
	}

	public char getProprietaCliente() {
		return iProprietaCliente;
	}

	public void setDatiExtraCliente(String datiExtraCliente) {
		this.iDatiExtraCliente = datiExtraCliente;
		setDirty();
	}

	public String getDatiExtraCliente() {
		return iDatiExtraCliente;
	}

	public void setIndirizzoServer(String indirizzoServer) {
		this.iIndirizzoServer = indirizzoServer;
		setDirty();
	}

	public String getIndirizzoServer() {
		return iIndirizzoServer;
	}

	public void setUsernameServer(String usernameServer) {
		this.iUsernameServer = usernameServer;
		setDirty();
	}

	public String getUsernameServer() {
		return iUsernameServer;
	}

	public void setPasswordServer(String passwordServer) {
		this.iPasswordServer = passwordServer;
		setDirty();
	}

	public String getPasswordServer() {
		return iPasswordServer;
	}

	public void setNoteServer(String noteServer) {
		this.iNoteServer = noteServer;
		setDirty();
	}

	public String getNoteServer() {
		return iNoteServer;
	}

	public void setUrlPanth01Interno(String urlPanth01Interno) {
		this.iUrlPanth01Interno = urlPanth01Interno;
		setDirty();
	}

	public String getUrlPanth01Interno() {
		return iUrlPanth01Interno;
	}

	public void setUrlPanth01Esterno(String urlPanth01Esterno) {
		this.iUrlPanth01Esterno = urlPanth01Esterno;
		setDirty();
	}

	public String getUrlPanth01Esterno() {
		return iUrlPanth01Esterno;
	}

	public void setUrlPanth02Interno(String urlPanth02Interno) {
		this.iUrlPanth02Interno = urlPanth02Interno;
		setDirty();
	}

	public String getUrlPanth02Interno() {
		return iUrlPanth02Interno;
	}

	public void setUrlPanth02Esterno(String urlPanth02Esterno) {
		this.iUrlPanth02Esterno = urlPanth02Esterno;
		setDirty();
	}

	public String getUrlPanth02Esterno() {
		return iUrlPanth02Esterno;
	}

	public void setHttpsAttivo(boolean httpsAttivo) {
		this.iHttpsAttivo = httpsAttivo;
		setDirty();
	}

	public boolean getHttpsAttivo() {
		return iHttpsAttivo;
	}

	public void setHttpsInternoEsterno(char httpsInternoEsterno) {
		this.iHttpsInternoEsterno = httpsInternoEsterno;
		setDirty();
	}

	public char getHttpsInternoEsterno() {
		return iHttpsInternoEsterno;
	}

	public void setNoteHttps(String noteHttps) {
		this.iNoteHttps = noteHttps;
		setDirty();
	}

	public String getNoteHttps() {
		return iNoteHttps;
	}

	public void setNoteContabilita(String noteContabilita) {
		this.iNoteContabilita = noteContabilita;
		setDirty();
	}

	public String getNoteContabilita() {
		return iNoteContabilita;
	}

	public void setReferentegestionale(UtenteAzienda referentegestionale) {
		String oldObjectKey = getKey();
		String idAzienda = getIdAzienda();
		if (referentegestionale != null) {
			idAzienda = KeyHelper.getTokenObjectKey(referentegestionale.getKey(), 1);
		}
		setIdAziendaInternal(idAzienda);
		this.iReferentegestionale.setObject(referentegestionale);
		setDirty();
		if (!KeyHelper.areEqual(oldObjectKey, getKey())) {
			setOnDB(false);
			iFixAddOn.setFatherKeyChanged();
			iVPNCliente.setFatherKeyChanged();
		}
	}

	public UtenteAzienda getReferentegestionale() {
		return (UtenteAzienda) iReferentegestionale.getObject();
	}

	public void setReferentegestionaleKey(String key) {
		String oldObjectKey = getKey();
		iReferentegestionale.setKey(key);
		String idAzienda = KeyHelper.getTokenObjectKey(key, 1);
		setIdAziendaInternal(idAzienda);
		setDirty();
		if (!KeyHelper.areEqual(oldObjectKey, getKey())) {
			setOnDB(false);
			iFixAddOn.setFatherKeyChanged();
			iVPNCliente.setFatherKeyChanged();
		}
	}

	public String getReferentegestionaleKey() {
		return iReferentegestionale.getKey();
	}

	public void setRefGestionale(String refGestionale) {
		String key = iReferentegestionale.getKey();
		iReferentegestionale.setKey(KeyHelper.replaceTokenObjectKey(key, 1, refGestionale));
		setDirty();
	}

	public String getRefGestionale() {
		String key = iReferentegestionale.getKey();
		String objRefGestionale = KeyHelper.getTokenObjectKey(key, 1);
		return objRefGestionale;
	}

	public void setReferentecontabile(UtenteAzienda referentecontabile) {
		String oldObjectKey = getKey();
		String idAzienda = getIdAzienda();
		if (referentecontabile != null) {
			idAzienda = KeyHelper.getTokenObjectKey(referentecontabile.getKey(), 1);
		}
		setIdAziendaInternal(idAzienda);
		this.iReferentecontabile.setObject(referentecontabile);
		setDirty();
		if (!KeyHelper.areEqual(oldObjectKey, getKey())) {
			setOnDB(false);
			iFixAddOn.setFatherKeyChanged();
			iVPNCliente.setFatherKeyChanged();
		}
	}

	public UtenteAzienda getReferentecontabile() {
		return (UtenteAzienda) iReferentecontabile.getObject();
	}

	public void setReferentecontabileKey(String key) {
		String oldObjectKey = getKey();
		iReferentecontabile.setKey(key);
		String idAzienda = KeyHelper.getTokenObjectKey(key, 1);
		setIdAziendaInternal(idAzienda);
		setDirty();
		if (!KeyHelper.areEqual(oldObjectKey, getKey())) {
			setOnDB(false);
			iFixAddOn.setFatherKeyChanged();
			iVPNCliente.setFatherKeyChanged();
		}
	}

	public String getReferentecontabileKey() {
		return iReferentecontabile.getKey();
	}

	public void setRefContabile(String refContabile) {
		String key = iReferentecontabile.getKey();
		iReferentecontabile.setKey(KeyHelper.replaceTokenObjectKey(key, 1, refContabile));
		setDirty();
	}

	public String getRefContabile() {
		String key = iReferentecontabile.getKey();
		String objRefContabile = KeyHelper.getTokenObjectKey(key, 1);
		return objRefContabile;
	}

	public void setReferentecommercialesmeup(UtenteAzienda referentecommercialesmeup) {
		String oldObjectKey = getKey();
		String idAzienda = getIdAzienda();
		if (referentecommercialesmeup != null) {
			idAzienda = KeyHelper.getTokenObjectKey(referentecommercialesmeup.getKey(), 1);
		}
		setIdAziendaInternal(idAzienda);
		this.iReferentecommercialesmeup.setObject(referentecommercialesmeup);
		setDirty();
		if (!KeyHelper.areEqual(oldObjectKey, getKey())) {
			setOnDB(false);
			iFixAddOn.setFatherKeyChanged();
			iVPNCliente.setFatherKeyChanged();
		}
	}

	public UtenteAzienda getReferentecommercialesmeup() {
		return (UtenteAzienda) iReferentecommercialesmeup.getObject();
	}

	public void setReferentecommercialesmeupKey(String key) {
		String oldObjectKey = getKey();
		iReferentecommercialesmeup.setKey(key);
		String idAzienda = KeyHelper.getTokenObjectKey(key, 1);
		setIdAziendaInternal(idAzienda);
		setDirty();
		if (!KeyHelper.areEqual(oldObjectKey, getKey())) {
			setOnDB(false);
			iFixAddOn.setFatherKeyChanged();
			iVPNCliente.setFatherKeyChanged();
		}
	}

	public String getReferentecommercialesmeupKey() {
		return iReferentecommercialesmeup.getKey();
	}

	public void setRefCommercialeSmeup(String refCommercialeSmeup) {
		String key = iReferentecommercialesmeup.getKey();
		iReferentecommercialesmeup.setKey(KeyHelper.replaceTokenObjectKey(key, 1, refCommercialeSmeup));
		setDirty();
	}

	public String getRefCommercialeSmeup() {
		String key = iReferentecommercialesmeup.getKey();
		String objRefCommercialeSmeup = KeyHelper.getTokenObjectKey(key, 1);
		return objRefCommercialeSmeup;
	}

	public void setReferentesisthcommerciale(UtenteAzienda referentesisthcommerciale) {
		String oldObjectKey = getKey();
		String idAzienda = getIdAzienda();
		if (referentesisthcommerciale != null) {
			idAzienda = KeyHelper.getTokenObjectKey(referentesisthcommerciale.getKey(), 1);
		}
		setIdAziendaInternal(idAzienda);
		this.iReferentesisthcommerciale.setObject(referentesisthcommerciale);
		setDirty();
		if (!KeyHelper.areEqual(oldObjectKey, getKey())) {
			setOnDB(false);
			iFixAddOn.setFatherKeyChanged();
			iVPNCliente.setFatherKeyChanged();
		}
	}

	public UtenteAzienda getReferentesisthcommerciale() {
		return (UtenteAzienda) iReferentesisthcommerciale.getObject();
	}

	public void setReferentesisthcommercialeKey(String key) {
		String oldObjectKey = getKey();
		iReferentesisthcommerciale.setKey(key);
		String idAzienda = KeyHelper.getTokenObjectKey(key, 1);
		setIdAziendaInternal(idAzienda);
		setDirty();
		if (!KeyHelper.areEqual(oldObjectKey, getKey())) {
			setOnDB(false);
			iFixAddOn.setFatherKeyChanged();
			iVPNCliente.setFatherKeyChanged();
		}
	}

	public String getReferentesisthcommercialeKey() {
		return iReferentesisthcommerciale.getKey();
	}

	public void setRefCommercialeSisth(String refCommercialeSisth) {
		String key = iReferentesisthcommerciale.getKey();
		iReferentesisthcommerciale.setKey(KeyHelper.replaceTokenObjectKey(key, 1, refCommercialeSisth));
		setDirty();
	}

	public String getRefCommercialeSisth() {
		String key = iReferentesisthcommerciale.getKey();
		String objRefCommercialeSisth = KeyHelper.getTokenObjectKey(key, 1);
		return objRefCommercialeSisth;
	}

	@SuppressWarnings("rawtypes")
	public List getFixAddOn() {
		return getFixAddOnInternal();
	}

	@SuppressWarnings("rawtypes")
	public List getVPNCliente() {
		return getVPNClienteInternal();
	}

	//<72395 inizio
	public Integer getNumeroUtenti() {
		return iNumeroUtenti;
	}

	public void setNumeroUtenti(Integer numeroUtenti) {
		this.iNumeroUtenti = numeroUtenti;
		setDirty();
	}

	public String getIndirizzoSvrStampaAS400() {
		return iIndirizzoSvrStampaAS400;
	}

	public void setIndirizzoSvrStampaAS400(String indirizzoSvrStampaAS400) {
		this.iIndirizzoSvrStampaAS400 = indirizzoSvrStampaAS400;
		setDirty();
	}

	public String getUsernameSvrStampaAS400() {
		return iUsernameSvrStampaAS400;
	}

	public void setUsernameSvrStampaAS400(String usernameSvrStampaAS400) {
		this.iUsernameSvrStampaAS400 = usernameSvrStampaAS400;
		setDirty();
	}

	public String getPasswordSvrStampaAS400() {
		return iPasswordSvrStampaAS400;
	}

	public void setPasswordSvrStampaAS400(String passwordSvrStampaAS400) {
		this.iPasswordSvrStampaAS400 = passwordSvrStampaAS400;
		setDirty();
	}

	public String getNoteSvrStampaAS400() {
		return iNoteSvrStampaAS400;
	}

	public void setNoteSvrStampaAS400(String noteSvrStampaAS400) {
		this.iNoteSvrStampaAS400 = noteSvrStampaAS400;
		setDirty();
	}

	public void setCapoProgettoCliente(UtenteAzienda capoProgettoCliente) {
		String oldObjectKey = getKey();
		String idAzienda = getIdAzienda();
		if (capoProgettoCliente != null) {
			idAzienda = KeyHelper.getTokenObjectKey(capoProgettoCliente.getKey(), 1);
		}
		setIdAziendaInternal(idAzienda);
		this.iCapoProgettoCliente.setObject(capoProgettoCliente);
		setDirty();
		if (!KeyHelper.areEqual(oldObjectKey, getKey())) {
			setOnDB(false);
			iFixAddOn.setFatherKeyChanged();
			iVPNCliente.setFatherKeyChanged();
		}
	}

	public UtenteAzienda getCapoProgettoCliente() {
		return (UtenteAzienda) iCapoProgettoCliente.getObject();
	}

	public void setCapoProgettoClienteKey(String key) {
		String oldObjectKey = getKey();
		iCapoProgettoCliente.setKey(key);
		String idAzienda = KeyHelper.getTokenObjectKey(key, 1);
		setIdAziendaInternal(idAzienda);
		setDirty();
		if (!KeyHelper.areEqual(oldObjectKey, getKey())) {
			setOnDB(false);
			iFixAddOn.setFatherKeyChanged();
			iVPNCliente.setFatherKeyChanged();
		}
	}

	public String getCapoProgettoClienteKey() {
		return iCapoProgettoCliente.getKey();
	}

	public void setCapProgettoCliente(String capProgettoCliente) {
		String key = iCapoProgettoCliente.getKey();
		iCapoProgettoCliente.setKey(KeyHelper.replaceTokenObjectKey(key, 1, capProgettoCliente));
		setDirty();
	}

	public String getCapProgettoCliente() {
		String key = iCapoProgettoCliente.getKey();
		String objCapProgettoCliente = KeyHelper.getTokenObjectKey(key, 1);
		return objCapProgettoCliente;
	}

	public String getUtenteAreaRiservataPth() {
		return iUtenteAreaRiservataPth;
	}

	public void setUtenteAreaRiservataPth(String utenteAreaRiservataPth) {
		this.iUtenteAreaRiservataPth = utenteAreaRiservataPth;
		setDirty();
	}

	public String getPasswordAreaRiservataPth() {
		return iPasswordAreaRiservataPth;
	}

	public void setPasswordAreaRiservataPth(String passwordAreaRiservataPth) {
		this.iPasswordAreaRiservataPth = passwordAreaRiservataPth;
		setDirty();
	}

	public String getUtenteMonitorFttElett() {
		return iUtenteMonitorFttElett;
	}

	public void setUtenteMonitorFttElett(String utenteMonitorFttElett) {
		this.iUtenteMonitorFttElett = utenteMonitorFttElett;
		setDirty();
	}

	public String getPasswordMonitorFttElett() {
		return iPasswordMonitorFttElett;
	}

	public void setPasswordMonitorFttElett(String passwordMonitorFttElett) {
		this.iPasswordMonitorFttElett = passwordMonitorFttElett;
		setDirty();
	}

	@SuppressWarnings("rawtypes")
	public List getModuliInstallati() {
		return getModuliInstallatiInternal();
	}

	protected OneToMany getModuliInstallatiInternal() {
		if (iModuliInstallati.isNew())
			iModuliInstallati.retrieve();
		return iModuliInstallati;
	}

	protected OneToMany getInterventiSpotInternal() {
		if (iInterventiSpot.isNew())
			iInterventiSpot.retrieve();
		return iInterventiSpot;
	}

	@SuppressWarnings("rawtypes")
	public List getInterventiSpot() {
		return getInterventiSpotInternal();
	}

	protected OneToMany getDocumentazioneClienteInternal() {
		if (iDocumentazioneCliente.isNew())
			iDocumentazioneCliente.retrieve();
		return iDocumentazioneCliente;
	}

	@SuppressWarnings("rawtypes")
	public List getDocumentazioneCliente() {
		return getDocumentazioneClienteInternal();
	}
	//72395 fine>

	//<72424 inizio
	public boolean isSQLServerExpress01() {
		return iSQLServerExpress01;
	}

	public void setSQLServerExpress01(boolean SQLServerExpress01) {
		this.iSQLServerExpress01 = SQLServerExpress01;
		setDirty();
	}

	public boolean isSQLServerExpress02() {
		return iSQLServerExpress02;
	}

	public void setSQLServerExpress02(boolean SQLServerExpress02) {
		this.iSQLServerExpress02 = SQLServerExpress02;
		setDirty();
	}
	
	public Date getDataScadenzaCertificati() {
		return iDataScadenzaCertificati;
	}

	public void setDataScadenzaCertificati(Date dataScadenzaCertificati) {
		this.iDataScadenzaCertificati = dataScadenzaCertificati;
		setDirty();
	}
	
	public String getEndpointTrasmissione() {
		return iEndpointTrasmissione;
	}

	public void setEndpointTrasmissione(String endpointTrasmissione) {
		this.iEndpointTrasmissione = endpointTrasmissione;
		setDirty();
	}

	public String getEndpointRicezione() {
		return iEndpointRicezione;
	}

	public void setEndpointRicezione(String endpointRicezione) {
		this.iEndpointRicezione = endpointRicezione;
		setDirty();
	}
	
	public char getTipoConservazSostitutiva() {
		return iTipoConservazSostitutiva;
	}

	public void setTipoConservazSostitutiva(char tipoConservazSostitutiva) {
		this.iTipoConservazSostitutiva = tipoConservazSostitutiva;
		setDirty();
	}
	//72424 fine>
	
	//<72447 inizio
	@SuppressWarnings("rawtypes")
	public List getWifiCliente() {
		return getWifiClienteInternal();
	}

	@SuppressWarnings("rawtypes")
	public List getServerAggiuntivi() {
		return getServerAggiuntiviInternal();
	}
	
	protected OneToMany getWifiClienteInternal() {
		if (iWifiCliente.isNew())
			iWifiCliente.retrieve();
		return iWifiCliente;
	}

	protected OneToMany getServerAggiuntiviInternal() {
		if (iServerAggiuntivi.isNew())
			iServerAggiuntivi.retrieve();
		return iServerAggiuntivi;
	}
	//72447 fine>
	
	//<72521 inizio
	public boolean getKasko() {
		return iKasko;
	}

	public void setKasko(boolean kasko) {
		this.iKasko = kasko;
		setDirty();
	}
	//72521 fine>
	
	public void setReferentePersonalizzazioni(Dipendente refPersonalizzazioni) {
		this.iRefPersonalizzazioni.setObject(refPersonalizzazioni);
		setDirty();
	}

	public Dipendente getReferentePersonalizzazioni() {
		return (Dipendente) iRefPersonalizzazioni.getObject();
	}

	public void setRefPersonalizzazioniKey(String key) {
		iRefPersonalizzazioni.setKey(key);
		setDirty();
	}

	public String getRefPersonalizzazioniKey() {
		return iRefPersonalizzazioni.getKey();
	}

	public void setRefPersonalizzazioni(String idIncaricato) {
		String key = iRefPersonalizzazioni.getKey();
		iRefPersonalizzazioni.setKey(KeyHelper.replaceTokenObjectKey(key , 2, idIncaricato));
		setDirty();
	}

	public String getRefPersonalizzazioni() {
		//String key = iIncaricato.getKey();
		//return key;
		String key = iRefPersonalizzazioni.getKey();
		return KeyHelper.getTokenObjectKey(key, 2);
	}
	
	public int saveOwnedObjects(int rc) throws SQLException {
		rc = iFixAddOn.save(rc);
		rc = iVPNCliente.save(rc);
		rc = iModuliInstallati.save(rc); //72395
		rc = iInterventiSpot.save(rc); //72395
		rc = iDocumentazioneCliente.save(rc); //72395
		rc = iWifiCliente.save(rc); //72447
		rc = iServerAggiuntivi.save(rc); //72447
		return rc;
	}

	public int deleteOwnedObjects() throws SQLException {
		int rcFixAddOn = getFixAddOnInternal().delete();
		if (rcFixAddOn < ErrorCodes.NO_ROWS_UPDATED)
			return rcFixAddOn;
		int rcVPNCliente = getVPNClienteInternal().delete();
		if (rcVPNCliente < ErrorCodes.NO_ROWS_UPDATED)
			return rcVPNCliente;
		//<72395 inizio
		int rcModuliInstallati = getModuliInstallatiInternal().delete();
		if (rcModuliInstallati < ErrorCodes.NO_ROWS_UPDATED)
			return rcModuliInstallati;
		int rcInterventiSpot = getInterventiSpotInternal().delete();
		if (rcInterventiSpot < ErrorCodes.NO_ROWS_UPDATED)
			return rcInterventiSpot;
		int rcDocumentazioneCliente = getDocumentazioneClienteInternal().delete();
		if (rcDocumentazioneCliente < ErrorCodes.NO_ROWS_UPDATED)
			return rcDocumentazioneCliente;
		//72395 fine>
		//<72447 inizio
		int rcWifiCliente = getWifiClienteInternal().delete();
		if (rcWifiCliente < ErrorCodes.NO_ROWS_UPDATED)
			return rcWifiCliente;
		int rcServerAggiuntivi = getServerAggiuntiviInternal().delete();
		if (rcServerAggiuntivi < ErrorCodes.NO_ROWS_UPDATED)
			return rcServerAggiuntivi;
		//72447 fine>
		return rcFixAddOn + rcVPNCliente + rcModuliInstallati + rcInterventiSpot + rcDocumentazioneCliente + rcWifiCliente + rcServerAggiuntivi; //72395 //72447
	}

	public boolean initializeOwnedObjects(boolean result) {
		result = iFixAddOn.initialize(result);
		result = iVPNCliente.initialize(result);
		result = iModuliInstallati.initialize(result); //72395
		result = iInterventiSpot.initialize(result); //72395
		result = iDocumentazioneCliente.initialize(result); //72395
		result = iWifiCliente.initialize(result); //72447
		result = iServerAggiuntivi.initialize(result); //72447
		return result;
	}

	protected OneToMany getFixAddOnInternal() {
		if (iFixAddOn.isNew())
			iFixAddOn.retrieve();
		return iFixAddOn;
	}

	protected OneToMany getVPNClienteInternal() {
		if (iVPNCliente.isNew())
			iVPNCliente.retrieve();
		return iVPNCliente;
	}

	protected void setIdAziendaInternal(String idAzienda) {
		iAzienda.setKey(idAzienda);
		String key2 = iReferentegestionale.getKey();
		iReferentegestionale.setKey(KeyHelper.replaceTokenObjectKey(key2, 1, idAzienda));
		String key3 = iReferentecontabile.getKey();
		iReferentecontabile.setKey(KeyHelper.replaceTokenObjectKey(key3, 1, idAzienda));
		String key4 = iReferentecommercialesmeup.getKey();
		iReferentecommercialesmeup.setKey(KeyHelper.replaceTokenObjectKey(key4, 1, idAzienda));
		String key5 = iReferentesisthcommerciale.getKey();
		iReferentesisthcommerciale.setKey(KeyHelper.replaceTokenObjectKey(key5, 1, idAzienda));
		String key6 = iRefPersonalizzazioni.getKey();
		iRefPersonalizzazioni.setKey(KeyHelper.replaceTokenObjectKey(key6, 1, idAzienda));
	}

}