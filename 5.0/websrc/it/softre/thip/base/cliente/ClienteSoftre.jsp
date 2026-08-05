<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
                      "file:///K:/Thip/5.1.0/websrcsvil/dtd/xhtml1-transitional.dtd">
<html>
<!-- WIZGEN Therm 2.0.0 as Form - multiBrowserGen = true -->
<%=WebGenerator.writeRuntimeInfo()%>

<head>
<%@ page contentType="text/html; charset=Cp1252"%>
<%@ page import= " 
  java.sql.*, 
  java.util.*, 
  java.lang.reflect.*, 
  javax.naming.*, 
  com.thera.thermfw.common.*, 
  com.thera.thermfw.type.*, 
  com.thera.thermfw.web.*, 
  com.thera.thermfw.security.*, 
  com.thera.thermfw.base.*, 
  com.thera.thermfw.ad.*, 
  com.thera.thermfw.persist.*, 
  com.thera.thermfw.gui.cnr.*, 
  com.thera.thermfw.setting.*, 
  com.thera.thermfw.collector.*, 
  com.thera.thermfw.batch.web.*, 
  com.thera.thermfw.batch.*, 
  com.thera.thermfw.pref.* 
"%> 
<%
  ServletEnvironment se = (ServletEnvironment)Factory.createObject("com.thera.thermfw.web.ServletEnvironment"); 
  BODataCollector ClienteSoftreBODC = null; 
  List errors = new ArrayList(); 
  WebJSTypeList jsList = new WebJSTypeList(); 
  WebForm ClienteSoftreForm =  
     new com.thera.thermfw.web.WebForm(request, response, "ClienteSoftreForm", "ClienteSoftre", null, "it.softre.thip.base.cliente.web.ClienteSoftreFormActionAdapter", false, false, true, true, true, true, null, 0, true, "it/softre/thip/base/cliente/ClienteSoftre.js"); 
  ClienteSoftreForm.setServletEnvironment(se); 
  ClienteSoftreForm.setJSTypeList(jsList); 
  ClienteSoftreForm.setHeader("it.thera.thip.cs.PantheraHeader.jsp"); 
  ClienteSoftreForm.setFooter("com.thera.thermfw.common.Footer.jsp"); 
  ClienteSoftreForm.setWebFormModifierClass("it.softre.thip.base.cliente.web.ClienteSoftreFormModifier"); 
  ClienteSoftreForm.setDeniedAttributeModeStr("hideNone"); 
  int mode = ClienteSoftreForm.getMode(); 
  String key = ClienteSoftreForm.getKey(); 
  String errorMessage; 
  boolean requestIsValid = false; 
  boolean leftIsKey = false; 
  boolean conflitPresent = false; 
  String leftClass = ""; 
  try 
  {
     se.initialize(request, response); 
     if(se.begin()) 
     { 
        ClienteSoftreForm.outTraceInfo(getClass().getName()); 
        String collectorName = ClienteSoftreForm.findBODataCollectorName(); 
                ClienteSoftreBODC = (BODataCollector)Factory.createObject(collectorName); 
        if (ClienteSoftreBODC instanceof WebDataCollector) 
            ((WebDataCollector)ClienteSoftreBODC).setServletEnvironment(se); 
        ClienteSoftreBODC.initialize("ClienteSoftre", true, 0); 
        ClienteSoftreForm.setBODataCollector(ClienteSoftreBODC); 
        int rcBODC = ClienteSoftreForm.initSecurityServices(); 
        mode = ClienteSoftreForm.getMode(); 
        if (rcBODC == BODataCollector.OK) 
        { 
           requestIsValid = true; 
           ClienteSoftreForm.write(out); 
           if(mode != WebForm.NEW) 
              rcBODC = ClienteSoftreBODC.retrieve(key); 
           if(rcBODC == BODataCollector.OK) 
           { 
              ClienteSoftreForm.writeHeadElements(out); 
           // fine blocco XXX  
           // a completamento blocco di codice YYY a fine body con catch e gestione errori 
%> 

<style>
details.custom-details.wifi-fixed fieldset,
details.custom-details.server-fixed fieldset {
    max-width: 900px; 
    width: 100%;
    margin: 0;
    box-sizing: border-box;
}

details.custom-details.wifi-fixed fieldset > table,
details.custom-details.server-fixed fieldset > table {
    width: 100%;
    table-layout: fixed;
}

fieldset {
	width: fit-content;
	padding: 5px !important;
}

/* Container */
.custom-details {
	width: fit-content;
	border: 1px solid #d6d6d6;
	margin-bottom: 8px;
	background-color: #f9f9f9;
}

/* Header */
.custom-details summary {
	padding: 8px 12px;
	font-weight: bold;
	font-size: 13px;
	background-color: #ececec;
	cursor: pointer;
	list-style: none;
}

/* Remove default arrow */
.custom-details summary::-webkit-details-marker {
	display: none;
}

/* Custom arrow using simple ASCII character */
.custom-details summary:before {
	content: ">";
	margin-right: 8px;
	display: inline-block;
	transition: transform 0.2s ease;
}

/* Rotate arrow when open */
.custom-details[open] summary:before {
	transform: rotate(90deg);
}

/* Hover */
.custom-details summary:hover {
	background-color: #e2e2e2;
}

/* Content */
.details-content {
	padding: 12px;
	background-color: #ffffff;
	border-top: 1px solid #d6d6d6;
}

/* Width of field "Elenco moduli installati" when is open */
#moduliDetails[open] {
	width: 50%;
}
</style>
<% 
  WebMenuBar menuBar = new com.thera.thermfw.web.WebMenuBar("HM_Array1", "150", "#000000","#000000","#A5B6CE","#E4EAEF","#FFFFFF","#000000"); 
  menuBar.setParent(ClienteSoftreForm); 
   request.setAttribute("menuBar", menuBar); 
%> 
<jsp:include page="/it/thera/thip/cs/defObjMenu.jsp" flush="true"> 
<jsp:param name="partRequest" value="menuBar"/> 
</jsp:include> 
<% 
  menuBar.write(out); 
  menuBar.writeChildren(out); 
%> 
<% 
  WebToolBar myToolBarTB = new com.thera.thermfw.web.WebToolBar("myToolBar", "24", "24", "16", "16", "#f7fbfd","#C8D6E1"); 
  myToolBarTB.setParent(ClienteSoftreForm); 
   request.setAttribute("toolBar", myToolBarTB); 
%> 
<jsp:include page="/it/thera/thip/cs/defObjMenu.jsp" flush="true"> 
<jsp:param name="partRequest" value="toolBar"/> 
</jsp:include> 
<% 
   myToolBarTB.write(out); 
%> 
</head>

<body onbeforeunload="<%=ClienteSoftreForm.getBodyOnBeforeUnload()%>" onload="<%=ClienteSoftreForm.getBodyOnLoad()%>" onunload="<%=ClienteSoftreForm.getBodyOnUnload()%>" style="margin: 0px; overflow: hidden;"><%
   ClienteSoftreForm.writeBodyStartElements(out); 
%> 

	<table width="100%" height="100%" cellspacing="0" cellpadding="0">
<tr>
<td style="height:0" valign="top">
<% String hdr = ClienteSoftreForm.getCompleteHeader();
 if (hdr != null) { 
   request.setAttribute("dataCollector", ClienteSoftreBODC); 
   request.setAttribute("servletEnvironment", se); %>
  <jsp:include page="<%= hdr %>" flush="true"/> 
<% } %> 
</td>
</tr>

<tr>
<td valign="top" height="100%">
<form action="<%=ClienteSoftreForm.getServlet()%>" method="post" name="ClienteSoftreForm" style="height:100%"><%
  ClienteSoftreForm.writeFormStartElements(out); 
%>

		<table cellpadding="0" cellspacing="0" height="100%" id="emptyborder" width="100%">
			<tr>
				<td style="height: 0"><% menuBar.writeElements(out); %> 

				</td>
			</tr>
			<tr>
				<td style="height: 0"><% myToolBarTB.writeChildren(out); %> 

				</td>
			</tr>
			<tr>
				<td><% 
  WebTextInput ClienteSoftreIdAzienda =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "IdAzienda"); 
  ClienteSoftreIdAzienda.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreIdAzienda.getClassType()%>" id="<%=ClienteSoftreIdAzienda.getId()%>" maxlength="<%=ClienteSoftreIdAzienda.getMaxLength()%>" name="<%=ClienteSoftreIdAzienda.getName()%>" size="<%=ClienteSoftreIdAzienda.getSize()%>" type="hidden"><% 
  ClienteSoftreIdAzienda.write(out); 
%>
</td>
			</tr>
			<tr>
				<td height="100%"><!--<span class="tabbed" id="mytabbed">-->
<table width="100%" height="100%" cellpadding="0" cellspacing="0" style="padding-right:1px">
   <tr valign="top">
     <td><% 
  WebTabbed mytabbed = new com.thera.thermfw.web.WebTabbed("mytabbed", "100%", "100%"); 
  mytabbed.setParent(ClienteSoftreForm); 
 mytabbed.addTab("tab1", "it.softre.thip.base.cliente.resources.ClienteSoftre", "tab1", "ClienteSoftre", null, null, null, null); 
 mytabbed.addTab("tab2", "it.softre.thip.base.cliente.resources.ClienteSoftre", "tab2", "ClienteSoftre", null, null, null, null); 
 mytabbed.addTab("tab4", "it.softre.thip.base.cliente.resources.ClienteSoftre", "tab4", "ClienteSoftre", null, null, null, null); 
 mytabbed.addTab("tab5", "it.softre.thip.base.cliente.resources.ClienteSoftre", "tab5", "ClienteSoftre", null, null, null, null); 
 mytabbed.addTab("tab3", "it.softre.thip.base.cliente.resources.ClienteSoftre", "tab3", "ClienteSoftre", null, null, null, null); 
 mytabbed.addTab("tab6", "it.softre.thip.base.cliente.resources.ClienteSoftre", "tab6", "ClienteSoftre", null, null, null, null); 
 mytabbed.addTab("tab7", "it.softre.thip.base.cliente.resources.ClienteSoftre", "tab7", "ClienteSoftre", null, null, null, null); 
  mytabbed.write(out); 
%>

     </td>
   </tr>
   <tr>
     <td height="100%"><div class="tabbed_pagine" id="tabbedPagine" style="position: relative; width: 100%; height: 100%;"> <div class="tabbed_page" id="<%=mytabbed.getTabPageId("tab1")%>" style="width:100%;height:100%;overflow:auto;"><% mytabbed.startTab("tab1"); %>
							<table style="width: 100%; height: 100%;">
								<tr>
									<td style="width: 30%" valign="top">
										<table>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "IdAnagrafico", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="AnagraficoDiBase"><%label.write(out);%></label><%}%></td>
												<td valign="top"><% 
  WebMultiSearchForm ClienteSoftreAnagraficoDiBase =  
     new com.thera.thermfw.web.WebMultiSearchForm("ClienteSoftre", "AnagraficoDiBase", false, false, true, 1, null, null); 
  ClienteSoftreAnagraficoDiBase.setParent(ClienteSoftreForm); 
  ClienteSoftreAnagraficoDiBase.write(out); 
%>
<!--<span class="multisearchform" id="AnagraficoDiBase"></span>--></td>
											</tr>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "ProdottoPrincipale", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="ProdottoPrincipale"><%label.write(out);%></label><%}%>
												</td>
												<td valign="top"><% 
  WebComboBox ClienteSoftreProdottoPrincipale =  
     new com.thera.thermfw.web.WebComboBox("ClienteSoftre", "ProdottoPrincipale", null); 
  ClienteSoftreProdottoPrincipale.setParent(ClienteSoftreForm); 
%>
<select id="<%=ClienteSoftreProdottoPrincipale.getId()%>" name="<%=ClienteSoftreProdottoPrincipale.getName()%>"><% 
  ClienteSoftreProdottoPrincipale.write(out); 
%> 
</select></td>
											</tr>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "ProdottoPrincipaleCont", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="ProdottoPrincipaleCont"><%label.write(out);%></label><%}%>
												</td>
												<td valign="top"><% 
  WebComboBox ClienteSoftreProdottoPrincipaleCont =  
     new com.thera.thermfw.web.WebComboBox("ClienteSoftre", "ProdottoPrincipaleCont", null); 
  ClienteSoftreProdottoPrincipaleCont.setParent(ClienteSoftreForm); 
%>
<select id="<%=ClienteSoftreProdottoPrincipaleCont.getId()%>" name="<%=ClienteSoftreProdottoPrincipaleCont.getName()%>"><% 
  ClienteSoftreProdottoPrincipaleCont.write(out); 
%> 
</select></td>
											</tr>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "NumeroUtenti", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="NumeroUtenti"><%label.write(out);%></label><%}%></td>
												<td valign="top"><% 
  WebTextInput ClienteSoftreNumeroUtenti =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "NumeroUtenti"); 
  ClienteSoftreNumeroUtenti.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreNumeroUtenti.getClassType()%>" id="<%=ClienteSoftreNumeroUtenti.getId()%>" maxlength="<%=ClienteSoftreNumeroUtenti.getMaxLength()%>" name="<%=ClienteSoftreNumeroUtenti.getName()%>" size="<%=ClienteSoftreNumeroUtenti.getSize()%>"><% 
  ClienteSoftreNumeroUtenti.write(out); 
%>
</td>
											</tr>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "CapProgettoCliente", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="CapoProgettoCliente"><%label.write(out);%></label><%}%>
												</td>
												<td valign="top"><% 
  WebMultiSearchForm ClienteSoftreCapoProgettoCliente =  
     new com.thera.thermfw.web.WebMultiSearchForm("ClienteSoftre", "CapoProgettoCliente", true, false, true, 1, null, null); 
  ClienteSoftreCapoProgettoCliente.setParent(ClienteSoftreForm); 
  ClienteSoftreCapoProgettoCliente.write(out); 
%>
<!--<span class="multisearchform" id="CapoProgettoCliente"></span>--></td>
											</tr>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "RefGestionale", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="ReferenteGestionale"><%label.write(out);%></label><%}%>
												</td>
												<td valign="top"><% 
  WebMultiSearchForm ClienteSoftreReferenteGestionale =  
     new com.thera.thermfw.web.WebMultiSearchForm("ClienteSoftre", "ReferenteGestionale", true, false, true, 1, null, null); 
  ClienteSoftreReferenteGestionale.setParent(ClienteSoftreForm); 
  ClienteSoftreReferenteGestionale.write(out); 
%>
<!--<span class="multisearchform" id="ReferenteGestionale"></span>--></td>
											</tr>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "RefContabile", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="ReferenteContabile"><%label.write(out);%></label><%}%>
												</td>
												<td valign="top"><% 
  WebMultiSearchForm ClienteSoftreReferenteContabile =  
     new com.thera.thermfw.web.WebMultiSearchForm("ClienteSoftre", "ReferenteContabile", true, false, true, 1, null, null); 
  ClienteSoftreReferenteContabile.setParent(ClienteSoftreForm); 
  ClienteSoftreReferenteContabile.write(out); 
%>
<!--<span class="multisearchform" id="ReferenteContabile"></span>--></td>
											</tr>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "RefCommercialeSmeup", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="ReferenteCommercialeSmeup"><%label.write(out);%></label><%}%>
												</td>
												<td valign="top"><% 
  WebMultiSearchForm ClienteSoftreReferenteCommercialeSmeup =  
     new com.thera.thermfw.web.WebMultiSearchForm("ClienteSoftre", "ReferenteCommercialeSmeup", true, false, true, 1, null, null); 
  ClienteSoftreReferenteCommercialeSmeup.setParent(ClienteSoftreForm); 
  ClienteSoftreReferenteCommercialeSmeup.write(out); 
%>
<!--<span class="multisearchform" id="ReferenteCommercialeSmeup"></span>--></td>
											</tr>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "RefPersonalizzazioni", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="RefPersonalizzazioni"><%label.write(out);%></label><%}%>
												</td>
												<td valign="top"><% 
  WebMultiSearchForm ClienteSoftreRefPersonalizzazioni =  
     new com.thera.thermfw.web.WebMultiSearchForm("ClienteSoftre", "RefPersonalizzazioni", false, false, true, 1, null, null); 
  ClienteSoftreRefPersonalizzazioni.setParent(ClienteSoftreForm); 
  ClienteSoftreRefPersonalizzazioni.write(out); 
%>
<!--<span class="multisearchform" id="RefPersonalizzazioni"></span>--></td>
											</tr>
											<tr style="display: none">
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "RefCommercialeSisth", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="ReferenteSisthCommerciale"><%label.write(out);%></label><%}%>
												</td>
												<td valign="top"><% 
  WebMultiSearchForm ClienteSoftreReferenteSisthCommerciale =  
     new com.thera.thermfw.web.WebMultiSearchForm("ClienteSoftre", "ReferenteSisthCommerciale", true, false, true, 1, null, null); 
  ClienteSoftreReferenteSisthCommerciale.setParent(ClienteSoftreForm); 
  ClienteSoftreReferenteSisthCommerciale.write(out); 
%>
<!--<span class="multisearchform" id="ReferenteSisthCommerciale"></span>--></td>
											</tr>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "ProprietaCliente", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="ProprietaCliente"><%label.write(out);%></label><%}%>
												</td>
												<td valign="top"><% 
  WebComboBox ClienteSoftreProprietaCliente =  
     new com.thera.thermfw.web.WebComboBox("ClienteSoftre", "ProprietaCliente", null); 
  ClienteSoftreProprietaCliente.setParent(ClienteSoftreForm); 
%>
<select id="<%=ClienteSoftreProprietaCliente.getId()%>" name="<%=ClienteSoftreProprietaCliente.getName()%>"><% 
  ClienteSoftreProprietaCliente.write(out); 
%> 
</select></td>
											</tr>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "DatiExtraCliente", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="DatiExtraCliente"><%label.write(out);%></label><%}%>
												</td>
												<td valign="top"><% 
  WebTextInput ClienteSoftreDatiExtraCliente =  
     new com.thera.thermfw.web.WebTextArea("ClienteSoftre", "DatiExtraCliente"); 
  ClienteSoftreDatiExtraCliente.setParent(ClienteSoftreForm); 
%>
<textarea class="<%=ClienteSoftreDatiExtraCliente.getClassType()%>" cols="60" id="<%=ClienteSoftreDatiExtraCliente.getId()%>" maxlength="<%=ClienteSoftreDatiExtraCliente.getMaxLength()%>" name="<%=ClienteSoftreDatiExtraCliente.getName()%>" rows="5" size="<%=ClienteSoftreDatiExtraCliente.getSize()%>"></textarea><% 
  ClienteSoftreDatiExtraCliente.write(out); 
%>
</td>
											</tr>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "NoteCliente", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="NoteCliente"><%label.write(out);%></label><%}%></td>
												<td valign="top"><% 
  WebTextInput ClienteSoftreNoteCliente =  
     new com.thera.thermfw.web.WebTextArea("ClienteSoftre", "NoteCliente"); 
  ClienteSoftreNoteCliente.setParent(ClienteSoftreForm); 
%>
<textarea class="<%=ClienteSoftreNoteCliente.getClassType()%>" cols="60" id="<%=ClienteSoftreNoteCliente.getId()%>" maxlength="<%=ClienteSoftreNoteCliente.getMaxLength()%>" name="<%=ClienteSoftreNoteCliente.getName()%>" rows="5" size="<%=ClienteSoftreNoteCliente.getSize()%>"></textarea><% 
  ClienteSoftreNoteCliente.write(out); 
%>
</td>
											</tr>
											<tr>
												<td><% 
   request.setAttribute("parentForm", ClienteSoftreForm); 
   String CDForDatiComuniEstesi$it$thera$thip$cs$DatiComuniEstesi$jsp = "DatiComuniEstesi"; 
%>
<jsp:include page="/it/thera/thip/cs/DatiComuniEstesi.jsp" flush="true"> 
<jsp:param name="CDName" value="<%=CDForDatiComuniEstesi$it$thera$thip$cs$DatiComuniEstesi$jsp%>"/> 
</jsp:include> 
<!--<span class="subform" id="T3" name="T3"></span>--></td>
											</tr>
										</table>
									</td>
									<td style="width: 70%" valign="top">
										<table style="width: 100%;">
											<tr>
												<td valign="top"><details class="custom-details">
														<summary>Informazioni su Panthera (01)</summary>
														<fieldset>
															<table>
																<tr>
																	<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "PthVrm01", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="PthVrm01"><%label.write(out);%></label><%}%></td>
																	<td valign="top"><% 
  WebTextInput ClienteSoftrePthVrm01 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "PthVrm01"); 
  ClienteSoftrePthVrm01.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftrePthVrm01.getClassType()%>" id="<%=ClienteSoftrePthVrm01.getId()%>" maxlength="<%=ClienteSoftrePthVrm01.getMaxLength()%>" name="<%=ClienteSoftrePthVrm01.getName()%>" size="<%=ClienteSoftrePthVrm01.getSize()%>"><% 
  ClienteSoftrePthVrm01.write(out); 
%>
</td>
																</tr>
																<tr>
																	<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "SirioVrm01", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="SirioVrm01"><%label.write(out);%></label><%}%></td>
																	<td valign="top"><% 
  WebTextInput ClienteSoftreSirioVrm01 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "SirioVrm01"); 
  ClienteSoftreSirioVrm01.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreSirioVrm01.getClassType()%>" id="<%=ClienteSoftreSirioVrm01.getId()%>" maxlength="<%=ClienteSoftreSirioVrm01.getMaxLength()%>" name="<%=ClienteSoftreSirioVrm01.getName()%>" size="<%=ClienteSoftreSirioVrm01.getSize()%>"><% 
  ClienteSoftreSirioVrm01.write(out); 
%>
</td>
																</tr>

																<!--              <tr> -->
																<!--               <td colspan="2"> -->
																<!--                <fieldset> -->
																<!--                 <legend>NGINX</legend> -->
																<!--                 <table> -->
																<!--                  <tr> -->
																<!--                   <td valign="top"><label for="NginxActive01"></label></td> -->
																<!--                   <td valign="top"><input id="NginxActive01" -->
																<!--                    name="NginxActive01"></input></td> -->
																<!--                  </tr> -->
																<!--                 </table> -->
																<!--                </fieldset> -->
																<!--               </td> -->
																<!--              </tr> -->

																<tr>
																	<td colspan="2">
																		<fieldset>
																			<legend>Informazioni sul tool di stampa</legend>
																			<table>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "CrystalVrm01", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="CrystalVrm01"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreCrystalVrm01 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "CrystalVrm01"); 
  ClienteSoftreCrystalVrm01.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreCrystalVrm01.getClassType()%>" id="<%=ClienteSoftreCrystalVrm01.getId()%>" maxlength="<%=ClienteSoftreCrystalVrm01.getMaxLength()%>" name="<%=ClienteSoftreCrystalVrm01.getName()%>" size="<%=ClienteSoftreCrystalVrm01.getSize()%>"><% 
  ClienteSoftreCrystalVrm01.write(out); 
%>
</td>
																				</tr>
																			</table>
																		</fieldset>
																	</td>
																</tr>

																<tr>
																	<td colspan="2">
																		<fieldset>
																			<legend>Informazioni sull'application server</legend>
																			<table>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "ApplicationSvrv01", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="ApplicationSvrv01"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreApplicationSvrv01 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "ApplicationSvrv01"); 
  ClienteSoftreApplicationSvrv01.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreApplicationSvrv01.getClassType()%>" id="<%=ClienteSoftreApplicationSvrv01.getId()%>" maxlength="<%=ClienteSoftreApplicationSvrv01.getMaxLength()%>" name="<%=ClienteSoftreApplicationSvrv01.getName()%>" size="<%=ClienteSoftreApplicationSvrv01.getSize()%>"><% 
  ClienteSoftreApplicationSvrv01.write(out); 
%>
</td>
																				</tr>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "ApplicationSrvVer01", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="ApplicationSrvVer01"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreApplicationSrvVer01 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "ApplicationSrvVer01"); 
  ClienteSoftreApplicationSrvVer01.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreApplicationSrvVer01.getClassType()%>" id="<%=ClienteSoftreApplicationSrvVer01.getId()%>" maxlength="<%=ClienteSoftreApplicationSrvVer01.getMaxLength()%>" name="<%=ClienteSoftreApplicationSrvVer01.getName()%>" size="<%=ClienteSoftreApplicationSrvVer01.getSize()%>"><% 
  ClienteSoftreApplicationSrvVer01.write(out); 
%>
</td>
																				</tr>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "JvmApplication01", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="JvmApplication01"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreJvmApplication01 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "JvmApplication01"); 
  ClienteSoftreJvmApplication01.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreJvmApplication01.getClassType()%>" id="<%=ClienteSoftreJvmApplication01.getId()%>" maxlength="<%=ClienteSoftreJvmApplication01.getMaxLength()%>" name="<%=ClienteSoftreJvmApplication01.getName()%>" size="<%=ClienteSoftreJvmApplication01.getSize()%>"><% 
  ClienteSoftreJvmApplication01.write(out); 
%>
</td>
																				</tr>
																			</table>
																		</fieldset>
																	</td>
																</tr>

																<tr>
																	<td colspan="2">
																		<fieldset>
																			<legend>Informazioni sul batch server</legend>
																			<table>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "JvmBatch01", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="JvmBatch01"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreJvmBatch01 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "JvmBatch01"); 
  ClienteSoftreJvmBatch01.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreJvmBatch01.getClassType()%>" id="<%=ClienteSoftreJvmBatch01.getId()%>" maxlength="<%=ClienteSoftreJvmBatch01.getMaxLength()%>" name="<%=ClienteSoftreJvmBatch01.getName()%>" size="<%=ClienteSoftreJvmBatch01.getSize()%>"><% 
  ClienteSoftreJvmBatch01.write(out); 
%>
</td>
																				</tr>
																			</table>
																		</fieldset>
																	</td>
																</tr>

																<tr>
																	<td colspan="2">
																		<fieldset>
																			<legend>Informazioni sul database</legend>
																			<table>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "DbVendor01", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="DbVendor01"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreDbVendor01 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "DbVendor01"); 
  ClienteSoftreDbVendor01.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreDbVendor01.getClassType()%>" id="<%=ClienteSoftreDbVendor01.getId()%>" maxlength="<%=ClienteSoftreDbVendor01.getMaxLength()%>" name="<%=ClienteSoftreDbVendor01.getName()%>" size="<%=ClienteSoftreDbVendor01.getSize()%>"><% 
  ClienteSoftreDbVendor01.write(out); 
%>
</td>
																				</tr>
																				<!-- 72424 inizio -->
																				<tr id="rowSQLServerExpress01">
																					<td valign="top"><% 
  WebCheckBox ClienteSoftreSQLServerExpress01 =  
     new com.thera.thermfw.web.WebCheckBox("ClienteSoftre", "SQLServerExpress01"); 
  ClienteSoftreSQLServerExpress01.setParent(ClienteSoftreForm); 
%>
<input id="<%=ClienteSoftreSQLServerExpress01.getId()%>" name="<%=ClienteSoftreSQLServerExpress01.getName()%>" type="checkbox" value="Y"><%
  ClienteSoftreSQLServerExpress01.write(out); 
%>
</td>
																				</tr>
																				<!-- 72424 fine -->
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "DbVrmVendor01", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="DbVrmVendor01"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreDbVrmVendor01 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "DbVrmVendor01"); 
  ClienteSoftreDbVrmVendor01.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreDbVrmVendor01.getClassType()%>" id="<%=ClienteSoftreDbVrmVendor01.getId()%>" maxlength="<%=ClienteSoftreDbVrmVendor01.getMaxLength()%>" name="<%=ClienteSoftreDbVrmVendor01.getName()%>" size="<%=ClienteSoftreDbVrmVendor01.getSize()%>"><% 
  ClienteSoftreDbVrmVendor01.write(out); 
%>
</td>
																				</tr>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "DbDriver01", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="DbDriver01"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreDbDriver01 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "DbDriver01"); 
  ClienteSoftreDbDriver01.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreDbDriver01.getClassType()%>" id="<%=ClienteSoftreDbDriver01.getId()%>" maxlength="<%=ClienteSoftreDbDriver01.getMaxLength()%>" name="<%=ClienteSoftreDbDriver01.getName()%>" size="<%=ClienteSoftreDbDriver01.getSize()%>"><% 
  ClienteSoftreDbDriver01.write(out); 
%>
</td>
																				</tr>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "DbVrmDriver01", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="DbVrmDriver01"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreDbVrmDriver01 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "DbVrmDriver01"); 
  ClienteSoftreDbVrmDriver01.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreDbVrmDriver01.getClassType()%>" id="<%=ClienteSoftreDbVrmDriver01.getId()%>" maxlength="<%=ClienteSoftreDbVrmDriver01.getMaxLength()%>" name="<%=ClienteSoftreDbVrmDriver01.getName()%>" size="<%=ClienteSoftreDbVrmDriver01.getSize()%>"><% 
  ClienteSoftreDbVrmDriver01.write(out); 
%>
</td>
																				</tr>
																			</table>
																		</fieldset>
																	</td>
																</tr>


															</table>
														</fieldset>
													</details> <details class="custom-details">
														<summary>Informazioni su Panthera (02)</summary>
														<fieldset>
															<table>
																<tr>
																	<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "PthVrm02", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="PthVrm02"><%label.write(out);%></label><%}%></td>
																	<td valign="top"><% 
  WebTextInput ClienteSoftrePthVrm02 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "PthVrm02"); 
  ClienteSoftrePthVrm02.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftrePthVrm02.getClassType()%>" id="<%=ClienteSoftrePthVrm02.getId()%>" maxlength="<%=ClienteSoftrePthVrm02.getMaxLength()%>" name="<%=ClienteSoftrePthVrm02.getName()%>" size="<%=ClienteSoftrePthVrm02.getSize()%>"><% 
  ClienteSoftrePthVrm02.write(out); 
%>
</td>
																</tr>
																<tr>
																	<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "SirioVrm02", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="SirioVrm02"><%label.write(out);%></label><%}%></td>
																	<td valign="top"><% 
  WebTextInput ClienteSoftreSirioVrm02 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "SirioVrm02"); 
  ClienteSoftreSirioVrm02.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreSirioVrm02.getClassType()%>" id="<%=ClienteSoftreSirioVrm02.getId()%>" maxlength="<%=ClienteSoftreSirioVrm02.getMaxLength()%>" name="<%=ClienteSoftreSirioVrm02.getName()%>" size="<%=ClienteSoftreSirioVrm02.getSize()%>"><% 
  ClienteSoftreSirioVrm02.write(out); 
%>
</td>
																</tr>

																<!--              <tr> -->
																<!--               <td colspan="2"> -->
																<!--                <fieldset> -->
																<!--                 <legend>NGINX</legend> -->
																<!--                 <table> -->
																<!--                  <tr> -->
																<!--                   <td valign="top"><label for="NginxActive02"></label></td> -->
																<!--                   <td valign="top"><input id="NginxActive02" -->
																<!--                    name="NginxActive02"></input></td> -->
																<!--                  </tr> -->
																<!--                 </table> -->
																<!--                </fieldset> -->
																<!--               </td> -->
																<!--              </tr> -->

																<tr>
																	<td colspan="2">
																		<fieldset>
																			<legend>Informazioni sul tool di stampa</legend>
																			<table>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "CrystalVrm02", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="CrystalVrm02"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreCrystalVrm02 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "CrystalVrm02"); 
  ClienteSoftreCrystalVrm02.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreCrystalVrm02.getClassType()%>" id="<%=ClienteSoftreCrystalVrm02.getId()%>" maxlength="<%=ClienteSoftreCrystalVrm02.getMaxLength()%>" name="<%=ClienteSoftreCrystalVrm02.getName()%>" size="<%=ClienteSoftreCrystalVrm02.getSize()%>"><% 
  ClienteSoftreCrystalVrm02.write(out); 
%>
</td>
																				</tr>
																			</table>
																		</fieldset>
																	</td>
																</tr>

																<tr>
																	<td colspan="2">
																		<fieldset>
																			<legend>Informazioni sull'application server</legend>
																			<table>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "ApplicationSvrv02", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="ApplicationSvrv02"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreApplicationSvrv02 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "ApplicationSvrv02"); 
  ClienteSoftreApplicationSvrv02.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreApplicationSvrv02.getClassType()%>" id="<%=ClienteSoftreApplicationSvrv02.getId()%>" maxlength="<%=ClienteSoftreApplicationSvrv02.getMaxLength()%>" name="<%=ClienteSoftreApplicationSvrv02.getName()%>" size="<%=ClienteSoftreApplicationSvrv02.getSize()%>"><% 
  ClienteSoftreApplicationSvrv02.write(out); 
%>
</td>
																				</tr>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "ApplicationSrvVer02", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="ApplicationSrvVer02"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreApplicationSrvVer02 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "ApplicationSrvVer02"); 
  ClienteSoftreApplicationSrvVer02.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreApplicationSrvVer02.getClassType()%>" id="<%=ClienteSoftreApplicationSrvVer02.getId()%>" maxlength="<%=ClienteSoftreApplicationSrvVer02.getMaxLength()%>" name="<%=ClienteSoftreApplicationSrvVer02.getName()%>" size="<%=ClienteSoftreApplicationSrvVer02.getSize()%>"><% 
  ClienteSoftreApplicationSrvVer02.write(out); 
%>
</td>
																				</tr>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "JvmApplication02", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="JvmApplication02"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreJvmApplication02 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "JvmApplication02"); 
  ClienteSoftreJvmApplication02.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreJvmApplication02.getClassType()%>" id="<%=ClienteSoftreJvmApplication02.getId()%>" maxlength="<%=ClienteSoftreJvmApplication02.getMaxLength()%>" name="<%=ClienteSoftreJvmApplication02.getName()%>" size="<%=ClienteSoftreJvmApplication02.getSize()%>"><% 
  ClienteSoftreJvmApplication02.write(out); 
%>
</td>
																				</tr>
																			</table>
																		</fieldset>
																	</td>
																</tr>

																<tr>
																	<td colspan="2">
																		<fieldset>
																			<legend>Informazioni sul batch server</legend>
																			<table>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "JvmBatch02", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="JvmBatch02"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreJvmBatch02 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "JvmBatch02"); 
  ClienteSoftreJvmBatch02.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreJvmBatch02.getClassType()%>" id="<%=ClienteSoftreJvmBatch02.getId()%>" maxlength="<%=ClienteSoftreJvmBatch02.getMaxLength()%>" name="<%=ClienteSoftreJvmBatch02.getName()%>" size="<%=ClienteSoftreJvmBatch02.getSize()%>"><% 
  ClienteSoftreJvmBatch02.write(out); 
%>
</td>
																				</tr>
																			</table>
																		</fieldset>
																	</td>
																</tr>

																<tr>
																	<td colspan="2">
																		<fieldset>
																			<legend>Informazioni sul database</legend>
																			<table>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "DbVendor02", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="DbVendor02"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreDbVendor02 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "DbVendor02"); 
  ClienteSoftreDbVendor02.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreDbVendor02.getClassType()%>" id="<%=ClienteSoftreDbVendor02.getId()%>" maxlength="<%=ClienteSoftreDbVendor02.getMaxLength()%>" name="<%=ClienteSoftreDbVendor02.getName()%>" size="<%=ClienteSoftreDbVendor02.getSize()%>"><% 
  ClienteSoftreDbVendor02.write(out); 
%>
</td>
																				</tr>
																				<!-- 72424 inizio -->
																				<tr id="rowSQLServerExpress02">
																					<td valign="top"><% 
  WebCheckBox ClienteSoftreSQLServerExpress02 =  
     new com.thera.thermfw.web.WebCheckBox("ClienteSoftre", "SQLServerExpress02"); 
  ClienteSoftreSQLServerExpress02.setParent(ClienteSoftreForm); 
%>
<input id="<%=ClienteSoftreSQLServerExpress02.getId()%>" name="<%=ClienteSoftreSQLServerExpress02.getName()%>" type="checkbox" value="Y"><%
  ClienteSoftreSQLServerExpress02.write(out); 
%>
</td>
																				</tr>
																				<!-- 72424 fine -->
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "DbVrmVendor02", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="DbVrmVendor02"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreDbVrmVendor02 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "DbVrmVendor02"); 
  ClienteSoftreDbVrmVendor02.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreDbVrmVendor02.getClassType()%>" id="<%=ClienteSoftreDbVrmVendor02.getId()%>" maxlength="<%=ClienteSoftreDbVrmVendor02.getMaxLength()%>" name="<%=ClienteSoftreDbVrmVendor02.getName()%>" size="<%=ClienteSoftreDbVrmVendor02.getSize()%>"><% 
  ClienteSoftreDbVrmVendor02.write(out); 
%>
</td>
																				</tr>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "DbDriver02", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="DbDriver02"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreDbDriver02 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "DbDriver02"); 
  ClienteSoftreDbDriver02.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreDbDriver02.getClassType()%>" id="<%=ClienteSoftreDbDriver02.getId()%>" maxlength="<%=ClienteSoftreDbDriver02.getMaxLength()%>" name="<%=ClienteSoftreDbDriver02.getName()%>" size="<%=ClienteSoftreDbDriver02.getSize()%>"><% 
  ClienteSoftreDbDriver02.write(out); 
%>
</td>
																				</tr>
																				<tr>
																					<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "DbVrmDriver02", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="DbVrmDriver02"><%label.write(out);%></label><%}%></td>
																					<td valign="top"><% 
  WebTextInput ClienteSoftreDbVrmDriver02 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "DbVrmDriver02"); 
  ClienteSoftreDbVrmDriver02.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreDbVrmDriver02.getClassType()%>" id="<%=ClienteSoftreDbVrmDriver02.getId()%>" maxlength="<%=ClienteSoftreDbVrmDriver02.getMaxLength()%>" name="<%=ClienteSoftreDbVrmDriver02.getName()%>" size="<%=ClienteSoftreDbVrmDriver02.getSize()%>"><% 
  ClienteSoftreDbVrmDriver02.write(out); 
%>
</td>
																				</tr>
																			</table>
																		</fieldset>
																	</td>
																</tr>
															</table>
														</fieldset>
													</details> <details class="custom-details">
														<summary>Informazioni sistema operativo</summary>
														<fieldset>
															<table>
																<tr>
																	<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "OsName", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="OsName"><%label.write(out);%></label><%}%></td>
																	<td valign="top"><% 
  WebTextInput ClienteSoftreOsName =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "OsName"); 
  ClienteSoftreOsName.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreOsName.getClassType()%>" id="<%=ClienteSoftreOsName.getId()%>" maxlength="<%=ClienteSoftreOsName.getMaxLength()%>" name="<%=ClienteSoftreOsName.getName()%>" size="<%=ClienteSoftreOsName.getSize()%>"><% 
  ClienteSoftreOsName.write(out); 
%>
</td>
																</tr>
																<tr>
																	<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "OsVersion", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="OsVersion"><%label.write(out);%></label><%}%></td>
																	<td valign="top"><% 
  WebTextInput ClienteSoftreOsVersion =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "OsVersion"); 
  ClienteSoftreOsVersion.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreOsVersion.getClassType()%>" id="<%=ClienteSoftreOsVersion.getId()%>" maxlength="<%=ClienteSoftreOsVersion.getMaxLength()%>" name="<%=ClienteSoftreOsVersion.getName()%>" size="<%=ClienteSoftreOsVersion.getSize()%>"><% 
  ClienteSoftreOsVersion.write(out); 
%>
</td>
																</tr>
																<tr>
																	<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "OsArchitecture", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="OsArchitecture"><%label.write(out);%></label><%}%></td>
																	<td valign="top"><% 
  WebTextInput ClienteSoftreOsArchitecture =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "OsArchitecture"); 
  ClienteSoftreOsArchitecture.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreOsArchitecture.getClassType()%>" id="<%=ClienteSoftreOsArchitecture.getId()%>" maxlength="<%=ClienteSoftreOsArchitecture.getMaxLength()%>" name="<%=ClienteSoftreOsArchitecture.getName()%>" size="<%=ClienteSoftreOsArchitecture.getSize()%>"><% 
  ClienteSoftreOsArchitecture.write(out); 
%>
</td>
																</tr>
															</table>
														</fieldset>
													</details> <details class="custom-details">
														<summary>Area riservata Panthera</summary>
														<fieldset>
															<table>
																<tr>
																	<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "UtenteAreaRiservataPth", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="UtenteAreaRiservataPth"><%label.write(out);%></label><%}%></td>
																	<td valign="top"><% 
  WebTextInput ClienteSoftreUtenteAreaRiservataPth =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "UtenteAreaRiservataPth"); 
  ClienteSoftreUtenteAreaRiservataPth.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreUtenteAreaRiservataPth.getClassType()%>" id="<%=ClienteSoftreUtenteAreaRiservataPth.getId()%>" maxlength="<%=ClienteSoftreUtenteAreaRiservataPth.getMaxLength()%>" name="<%=ClienteSoftreUtenteAreaRiservataPth.getName()%>" size="<%=ClienteSoftreUtenteAreaRiservataPth.getSize()%>"><% 
  ClienteSoftreUtenteAreaRiservataPth.write(out); 
%>
</td>
																</tr>
																<tr>
																	<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "PasswordAreaRiservataPth", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="PasswordAreaRiservataPth"><%label.write(out);%></label><%}%></td>
																	<td valign="top"><% 
  WebTextInput ClienteSoftrePasswordAreaRiservataPth =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "PasswordAreaRiservataPth"); 
  ClienteSoftrePasswordAreaRiservataPth.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftrePasswordAreaRiservataPth.getClassType()%>" id="<%=ClienteSoftrePasswordAreaRiservataPth.getId()%>" maxlength="<%=ClienteSoftrePasswordAreaRiservataPth.getMaxLength()%>" name="<%=ClienteSoftrePasswordAreaRiservataPth.getName()%>" size="<%=ClienteSoftrePasswordAreaRiservataPth.getSize()%>"><% 
  ClienteSoftrePasswordAreaRiservataPth.write(out); 
%>
</td>
																</tr>
															</table>
														</fieldset>
													</details> <details class="custom-details" id="moduliDetails">
														<summary>Elenco moduli installati</summary>
														<fieldset style="width: 100%; box-sizing: border-box;">
															<table style="width: 100%;">
																<tr>
																	<td style="width: 100%;" valign="top"><!--<span class="editgrid" id="ModuliInstallati" style="display: block; width: 100%;">--><% 
  WebEditGrid ClienteSoftreModuliInstallati =  
     new com.thera.thermfw.web.WebEditGrid("ClienteSoftre", "ModuliInstallati", 5, new String[]{"IdRiga", "IdAnagrafico", "IdAzienda", "DescrizioneModulo", "Azienda.Descrizione"}, 0, null, null,false,"com.thera.thermfw.web.servlet.GridActionAdapterForIndependentRow"); 
 ClienteSoftreModuliInstallati.setParent(ClienteSoftreForm); 
 ClienteSoftreModuliInstallati.setNoControlRowKeys(false); 
 ClienteSoftreModuliInstallati.addHideAsDefault("Azienda.Descrizione"); 
 ClienteSoftreModuliInstallati.write(out); 
%>
<!--</span>--></td>
																</tr>
															</table>
														</fieldset>
													</details></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
					<% mytabbed.endTab(); %> 
</div> <div class="tabbed_page" id="<%=mytabbed.getTabPageId("tab2")%>" style="width:100%;height:100%;overflow:auto;"><% mytabbed.startTab("tab2"); %>
							<table style="width: 100%;">
								<tr>
									<td style="width: 30%" valign="top">
										<table>
											<tr>
												<td>
													<fieldset>
														<legend>Server</legend>
														<table>
															<tr>
																<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "IndirizzoServer", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="IndirizzoServer"><%label.write(out);%></label><%}%></td>
																<td valign="top"><% 
  WebTextInput ClienteSoftreIndirizzoServer =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "IndirizzoServer"); 
  ClienteSoftreIndirizzoServer.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreIndirizzoServer.getClassType()%>" id="<%=ClienteSoftreIndirizzoServer.getId()%>" maxlength="<%=ClienteSoftreIndirizzoServer.getMaxLength()%>" name="<%=ClienteSoftreIndirizzoServer.getName()%>" size="<%=ClienteSoftreIndirizzoServer.getSize()%>"><% 
  ClienteSoftreIndirizzoServer.write(out); 
%>
</td>
															</tr>
															<tr>
																<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "UsernameServer", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="UsernameServer"><%label.write(out);%></label><%}%></td>
																<td valign="top"><% 
  WebTextInput ClienteSoftreUsernameServer =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "UsernameServer"); 
  ClienteSoftreUsernameServer.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreUsernameServer.getClassType()%>" id="<%=ClienteSoftreUsernameServer.getId()%>" maxlength="<%=ClienteSoftreUsernameServer.getMaxLength()%>" name="<%=ClienteSoftreUsernameServer.getName()%>" size="<%=ClienteSoftreUsernameServer.getSize()%>"><% 
  ClienteSoftreUsernameServer.write(out); 
%>
</td>
															</tr>
															<tr>
																<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "PasswordServer", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="PasswordServer"><%label.write(out);%></label><%}%></td>
																<td valign="top"><% 
  WebTextInput ClienteSoftrePasswordServer =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "PasswordServer"); 
  ClienteSoftrePasswordServer.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftrePasswordServer.getClassType()%>" id="<%=ClienteSoftrePasswordServer.getId()%>" maxlength="<%=ClienteSoftrePasswordServer.getMaxLength()%>" name="<%=ClienteSoftrePasswordServer.getName()%>" size="<%=ClienteSoftrePasswordServer.getSize()%>"><% 
  ClienteSoftrePasswordServer.write(out); 
%>
</td>
															</tr>
															<tr>
																<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "NoteServer", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="NoteServer"><%label.write(out);%></label><%}%></td>
																<td valign="top"><% 
  WebTextInput ClienteSoftreNoteServer =  
     new com.thera.thermfw.web.WebTextArea("ClienteSoftre", "NoteServer"); 
  ClienteSoftreNoteServer.setParent(ClienteSoftreForm); 
%>
<textarea class="<%=ClienteSoftreNoteServer.getClassType()%>" cols="60" id="<%=ClienteSoftreNoteServer.getId()%>" maxlength="<%=ClienteSoftreNoteServer.getMaxLength()%>" name="<%=ClienteSoftreNoteServer.getName()%>" rows="5" size="<%=ClienteSoftreNoteServer.getSize()%>"></textarea><% 
  ClienteSoftreNoteServer.write(out); 
%>
</td>
															</tr>

														</table>
													</fieldset>
												</td>
											</tr>
											<tr>
												<td>
													<fieldset>
														<legend>Server stampa AS400</legend>
														<table>
															<tr>
																<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "IndirizzoSvrStampaAS400", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="IndirizzoSvrStampaAS400"><%label.write(out);%></label><%}%></td>
																<td valign="top"><% 
  WebTextInput ClienteSoftreIndirizzoSvrStampaAS400 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "IndirizzoSvrStampaAS400"); 
  ClienteSoftreIndirizzoSvrStampaAS400.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreIndirizzoSvrStampaAS400.getClassType()%>" id="<%=ClienteSoftreIndirizzoSvrStampaAS400.getId()%>" maxlength="<%=ClienteSoftreIndirizzoSvrStampaAS400.getMaxLength()%>" name="<%=ClienteSoftreIndirizzoSvrStampaAS400.getName()%>" size="<%=ClienteSoftreIndirizzoSvrStampaAS400.getSize()%>"><% 
  ClienteSoftreIndirizzoSvrStampaAS400.write(out); 
%>
</td>
															</tr>
															<tr>
																<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "UsernameSvrStampaAS400", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="UsernameSvrStampaAS400"><%label.write(out);%></label><%}%></td>
																<td valign="top"><% 
  WebTextInput ClienteSoftreUsernameSvrStampaAS400 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "UsernameSvrStampaAS400"); 
  ClienteSoftreUsernameSvrStampaAS400.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreUsernameSvrStampaAS400.getClassType()%>" id="<%=ClienteSoftreUsernameSvrStampaAS400.getId()%>" maxlength="<%=ClienteSoftreUsernameSvrStampaAS400.getMaxLength()%>" name="<%=ClienteSoftreUsernameSvrStampaAS400.getName()%>" size="<%=ClienteSoftreUsernameSvrStampaAS400.getSize()%>"><% 
  ClienteSoftreUsernameSvrStampaAS400.write(out); 
%>
</td>
															</tr>
															<tr>
																<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "PasswordSvrStampaAS400", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="PasswordSvrStampaAS400"><%label.write(out);%></label><%}%></td>
																<td valign="top"><% 
  WebTextInput ClienteSoftrePasswordSvrStampaAS400 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "PasswordSvrStampaAS400"); 
  ClienteSoftrePasswordSvrStampaAS400.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftrePasswordSvrStampaAS400.getClassType()%>" id="<%=ClienteSoftrePasswordSvrStampaAS400.getId()%>" maxlength="<%=ClienteSoftrePasswordSvrStampaAS400.getMaxLength()%>" name="<%=ClienteSoftrePasswordSvrStampaAS400.getName()%>" size="<%=ClienteSoftrePasswordSvrStampaAS400.getSize()%>"><% 
  ClienteSoftrePasswordSvrStampaAS400.write(out); 
%>
</td>
															</tr>
															<tr>
																<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "NoteSvrStampaAS400", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="NoteSvrStampaAS400"><%label.write(out);%></label><%}%></td>
																<td valign="top"><% 
  WebTextInput ClienteSoftreNoteSvrStampaAS400 =  
     new com.thera.thermfw.web.WebTextArea("ClienteSoftre", "NoteSvrStampaAS400"); 
  ClienteSoftreNoteSvrStampaAS400.setParent(ClienteSoftreForm); 
%>
<textarea class="<%=ClienteSoftreNoteSvrStampaAS400.getClassType()%>" cols="60" id="<%=ClienteSoftreNoteSvrStampaAS400.getId()%>" maxlength="<%=ClienteSoftreNoteSvrStampaAS400.getMaxLength()%>" name="<%=ClienteSoftreNoteSvrStampaAS400.getName()%>" rows="5" size="<%=ClienteSoftreNoteSvrStampaAS400.getSize()%>"></textarea><% 
  ClienteSoftreNoteSvrStampaAS400.write(out); 
%>
</td>
															</tr>
														</table>
													</fieldset>
												</td>
											</tr>
											<tr>
												<td>
													<fieldset>
														<legend>PANTH01</legend>
														<table>
															<tr>
																<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "UrlPanth01Interno", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="UrlPanth01Interno"><%label.write(out);%></label><%}%></td>
																<td valign="top"><% 
  WebTextInput ClienteSoftreUrlPanth01Interno =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "UrlPanth01Interno"); 
  ClienteSoftreUrlPanth01Interno.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreUrlPanth01Interno.getClassType()%>" cols="60" id="<%=ClienteSoftreUrlPanth01Interno.getId()%>" maxlength="<%=ClienteSoftreUrlPanth01Interno.getMaxLength()%>" name="<%=ClienteSoftreUrlPanth01Interno.getName()%>" rows="5" size="<%=ClienteSoftreUrlPanth01Interno.getSize()%>"><% 
  ClienteSoftreUrlPanth01Interno.write(out); 
%>
</td>
															</tr>
															<tr>
																<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "UrlPanth01Esterno", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="UrlPanth01Esterno"><%label.write(out);%></label><%}%></td>
																<td valign="top"><% 
  WebTextInput ClienteSoftreUrlPanth01Esterno =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "UrlPanth01Esterno"); 
  ClienteSoftreUrlPanth01Esterno.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreUrlPanth01Esterno.getClassType()%>" cols="60" id="<%=ClienteSoftreUrlPanth01Esterno.getId()%>" maxlength="<%=ClienteSoftreUrlPanth01Esterno.getMaxLength()%>" name="<%=ClienteSoftreUrlPanth01Esterno.getName()%>" rows="5" size="<%=ClienteSoftreUrlPanth01Esterno.getSize()%>"><% 
  ClienteSoftreUrlPanth01Esterno.write(out); 
%>
</td>
															</tr>
															<tr>
																<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "PasswordAdmin01", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="PasswordAdmin01"><%label.write(out);%></label><%}%></td>
																<td valign="top"><% 
  WebTextInput ClienteSoftrePasswordAdmin01 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "PasswordAdmin01"); 
  ClienteSoftrePasswordAdmin01.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftrePasswordAdmin01.getClassType()%>" id="<%=ClienteSoftrePasswordAdmin01.getId()%>" maxlength="<%=ClienteSoftrePasswordAdmin01.getMaxLength()%>" name="<%=ClienteSoftrePasswordAdmin01.getName()%>" size="<%=ClienteSoftrePasswordAdmin01.getSize()%>"><% 
  ClienteSoftrePasswordAdmin01.write(out); 
%>
</td>
															</tr>
														</table>
													</fieldset>
												</td>
											</tr>
											<tr>
												<td>
													<fieldset>
														<legend>PANTH02</legend>
														<table>
															<tr>
																<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "UrlPanth02Interno", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="UrlPanth02Interno"><%label.write(out);%></label><%}%></td>
																<td valign="top"><% 
  WebTextInput ClienteSoftreUrlPanth02Interno =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "UrlPanth02Interno"); 
  ClienteSoftreUrlPanth02Interno.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreUrlPanth02Interno.getClassType()%>" cols="60" id="<%=ClienteSoftreUrlPanth02Interno.getId()%>" maxlength="<%=ClienteSoftreUrlPanth02Interno.getMaxLength()%>" name="<%=ClienteSoftreUrlPanth02Interno.getName()%>" rows="5" size="<%=ClienteSoftreUrlPanth02Interno.getSize()%>"><% 
  ClienteSoftreUrlPanth02Interno.write(out); 
%>
</td>
															</tr>

															<tr>
																<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "UrlPanth02Esterno", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="UrlPanth02Esterno"><%label.write(out);%></label><%}%></td>
																<td valign="top"><% 
  WebTextInput ClienteSoftreUrlPanth02Esterno =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "UrlPanth02Esterno"); 
  ClienteSoftreUrlPanth02Esterno.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreUrlPanth02Esterno.getClassType()%>" cols="60" id="<%=ClienteSoftreUrlPanth02Esterno.getId()%>" maxlength="<%=ClienteSoftreUrlPanth02Esterno.getMaxLength()%>" name="<%=ClienteSoftreUrlPanth02Esterno.getName()%>" rows="5" size="<%=ClienteSoftreUrlPanth02Esterno.getSize()%>"><% 
  ClienteSoftreUrlPanth02Esterno.write(out); 
%>
</td>
															</tr>
															<tr>
																<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "PasswordAdmin02", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="PasswordAdmin02"><%label.write(out);%></label><%}%></td>
																<td valign="top"><% 
  WebTextInput ClienteSoftrePasswordAdmin02 =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "PasswordAdmin02"); 
  ClienteSoftrePasswordAdmin02.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftrePasswordAdmin02.getClassType()%>" id="<%=ClienteSoftrePasswordAdmin02.getId()%>" maxlength="<%=ClienteSoftrePasswordAdmin02.getMaxLength()%>" name="<%=ClienteSoftrePasswordAdmin02.getName()%>" size="<%=ClienteSoftrePasswordAdmin02.getSize()%>"><% 
  ClienteSoftrePasswordAdmin02.write(out); 
%>
</td>
															</tr>
														</table>
													</fieldset>
												</td>
											</tr>
										</table>
									</td>
									<td style="width: 70%" valign="top">
										<table style="width: 100%;">
											<tr>
												<td valign="top">
													<details class="custom-details">
															<summary>HTTPS</summary>
															<fieldset>
																<table>
																	<tr>
																		<td valign="top"><% 
  WebCheckBox ClienteSoftreHttpsAttivo =  
     new com.thera.thermfw.web.WebCheckBox("ClienteSoftre", "HttpsAttivo"); 
  ClienteSoftreHttpsAttivo.setParent(ClienteSoftreForm); 
%>
<input id="<%=ClienteSoftreHttpsAttivo.getId()%>" name="<%=ClienteSoftreHttpsAttivo.getName()%>" type="checkbox" value="Y"><%
  ClienteSoftreHttpsAttivo.write(out); 
%>
</td>
																		<td valign="top"><% 
  WebComboBox ClienteSoftreHttpsInternoEsterno =  
     new com.thera.thermfw.web.WebComboBox("ClienteSoftre", "HttpsInternoEsterno", null); 
  ClienteSoftreHttpsInternoEsterno.setParent(ClienteSoftreForm); 
%>
<select id="<%=ClienteSoftreHttpsInternoEsterno.getId()%>" name="<%=ClienteSoftreHttpsInternoEsterno.getName()%>"><% 
  ClienteSoftreHttpsInternoEsterno.write(out); 
%> 
</select></td>
																	</tr>
																	<tr>
																		<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "NoteHttps", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="NoteHttps"><%label.write(out);%></label><%}%></td>
																		<td valign="top"><% 
  WebTextInput ClienteSoftreNoteHttps =  
     new com.thera.thermfw.web.WebTextArea("ClienteSoftre", "NoteHttps"); 
  ClienteSoftreNoteHttps.setParent(ClienteSoftreForm); 
%>
<textarea class="<%=ClienteSoftreNoteHttps.getClassType()%>" cols="60" id="<%=ClienteSoftreNoteHttps.getId()%>" maxlength="<%=ClienteSoftreNoteHttps.getMaxLength()%>" name="<%=ClienteSoftreNoteHttps.getName()%>" rows="5" size="<%=ClienteSoftreNoteHttps.getSize()%>"></textarea><% 
  ClienteSoftreNoteHttps.write(out); 
%>
</td>
																	</tr>
																</table>
															</fieldset>
													</details>
												</td>
											</tr>
											<!-- 72447 inizio -->
											<tr>
												<td valign="top">
													<details class="custom-details wifi-fixed">
															<summary>WI-FI</summary>
															<fieldset>
																<table>
																	<tr>
																		<td valign="top">
																		<!--<span class="editgrid" id="WifiCliente">--><% 
  WebEditGrid ClienteSoftreWifiCliente =  
     new com.thera.thermfw.web.WebEditGrid("ClienteSoftre", "WifiCliente", 8, new String[]{"IdProgressivo", "IdAnagrafico", "IdAzienda", "NomeRete", "Password", "Note", "Azienda.Descrizione"}, 3, null, null,false,"com.thera.thermfw.web.servlet.GridActionAdapterForIndependentRow"); 
 ClienteSoftreWifiCliente.setParent(ClienteSoftreForm); 
 ClienteSoftreWifiCliente.setNoControlRowKeys(false); 
 ClienteSoftreWifiCliente.addHideAsDefault("Azienda.Descrizione"); 
 ClienteSoftreWifiCliente.write(out); 
%>
<!--</span>-->
																		</td>
																	</tr>
																</table>
															</fieldset>
													</details>
												</td>
											</tr>
											<tr>
												<td valign="top">
													<details class="custom-details wifi-fixed">
															<summary>SERVER AGGIUNTIVI</summary>
															<fieldset>
																<table>
																	<tr>
																		<td valign="top">
																		<!--<span class="editgrid" id="ServerAggiuntivi">--><% 
  WebEditGrid ClienteSoftreServerAggiuntivi =  
     new com.thera.thermfw.web.WebEditGrid("ClienteSoftre", "ServerAggiuntivi", 8, new String[]{"IdProgressivo", "IdAnagrafico", "IdAzienda", "IndirizzoServer", "UsernameServer", "PasswordServer", "NoteServer", "Azienda.Descrizione"}, 3, null, null,false,"com.thera.thermfw.web.servlet.GridActionAdapterForIndependentRow"); 
 ClienteSoftreServerAggiuntivi.setParent(ClienteSoftreForm); 
 ClienteSoftreServerAggiuntivi.setNoControlRowKeys(false); 
 ClienteSoftreServerAggiuntivi.addHideAsDefault("Azienda.Descrizione"); 
 ClienteSoftreServerAggiuntivi.write(out); 
%>
<!--</span>-->
																		</td>
																	</tr>
																</table>
															</fieldset>
													</details>
												</td>
											</tr>
											<!-- 72447 fine -->
										</table>
									</td>
								</tr>
							</table>
					<% mytabbed.endTab(); %> 
</div> <div class="tabbed_page" id="<%=mytabbed.getTabPageId("tab4")%>" style="width:100%;height:100%;overflow:auto;"><% mytabbed.startTab("tab4"); %>

							<table>
								<!-- 72424 inizio -->
								<tr>
									<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "DataScadenzaCertificati", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="DataScadenzaCertificati"><%label.write(out);%></label><%}%></td>
									<td valign="top"><% 
  WebTextInput ClienteSoftreDataScadenzaCertificati =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "DataScadenzaCertificati"); 
  ClienteSoftreDataScadenzaCertificati.setShowCalendarBtn(true); 
  ClienteSoftreDataScadenzaCertificati.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreDataScadenzaCertificati.getClassType()%>" id="<%=ClienteSoftreDataScadenzaCertificati.getId()%>" maxlength="<%=ClienteSoftreDataScadenzaCertificati.getMaxLength()%>" name="<%=ClienteSoftreDataScadenzaCertificati.getName()%>" size="<%=ClienteSoftreDataScadenzaCertificati.getSize()%>"><% 
  ClienteSoftreDataScadenzaCertificati.write(out); 
%>
</td>
								</tr>
								<tr>
									<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "EndpointTrasmissione", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="EndpointTrasmissione"><%label.write(out);%></label><%}%></td>
									<td valign="top"><% 
  WebTextInput ClienteSoftreEndpointTrasmissione =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "EndpointTrasmissione"); 
  ClienteSoftreEndpointTrasmissione.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreEndpointTrasmissione.getClassType()%>" id="<%=ClienteSoftreEndpointTrasmissione.getId()%>" maxlength="<%=ClienteSoftreEndpointTrasmissione.getMaxLength()%>" name="<%=ClienteSoftreEndpointTrasmissione.getName()%>" size="<%=ClienteSoftreEndpointTrasmissione.getSize()%>"><% 
  ClienteSoftreEndpointTrasmissione.write(out); 
%>
</td>
								</tr>
								<tr>
									<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "EndpointRicezione", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="EndpointRicezione"><%label.write(out);%></label><%}%></td>
									<td valign="top"><% 
  WebTextInput ClienteSoftreEndpointRicezione =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "EndpointRicezione"); 
  ClienteSoftreEndpointRicezione.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreEndpointRicezione.getClassType()%>" id="<%=ClienteSoftreEndpointRicezione.getId()%>" maxlength="<%=ClienteSoftreEndpointRicezione.getMaxLength()%>" name="<%=ClienteSoftreEndpointRicezione.getName()%>" size="<%=ClienteSoftreEndpointRicezione.getSize()%>"><% 
  ClienteSoftreEndpointRicezione.write(out); 
%>
</td>
								</tr>
								<tr>
									<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "TipoConservazSostitutiva", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="TipoConservazSostitutiva"><%label.write(out);%></label><%}%>
									</td>
									<td valign="top"><% 
  WebComboBox ClienteSoftreTipoConservazSostitutiva =  
     new com.thera.thermfw.web.WebComboBox("ClienteSoftre", "TipoConservazSostitutiva", null); 
  ClienteSoftreTipoConservazSostitutiva.setParent(ClienteSoftreForm); 
%>
<select id="<%=ClienteSoftreTipoConservazSostitutiva.getId()%>" name="<%=ClienteSoftreTipoConservazSostitutiva.getName()%>"><% 
  ClienteSoftreTipoConservazSostitutiva.write(out); 
%> 
</select></td>
								</tr>
								<!-- 72424 fine -->
								<tr>
									<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "NoteContabilita", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="NoteContabilita"><%label.write(out);%></label><%}%></td>
									<td valign="top"><% 
  WebTextInput ClienteSoftreNoteContabilita =  
     new com.thera.thermfw.web.WebTextArea("ClienteSoftre", "NoteContabilita"); 
  ClienteSoftreNoteContabilita.setParent(ClienteSoftreForm); 
%>
<textarea class="<%=ClienteSoftreNoteContabilita.getClassType()%>" cols="60" id="<%=ClienteSoftreNoteContabilita.getId()%>" maxlength="<%=ClienteSoftreNoteContabilita.getMaxLength()%>" name="<%=ClienteSoftreNoteContabilita.getName()%>" rows="5" size="<%=ClienteSoftreNoteContabilita.getSize()%>"></textarea><% 
  ClienteSoftreNoteContabilita.write(out); 
%>
</td>
								</tr>
							</table>
							<table style="width: 100%;">
								<tr>
									<td>
										<fieldset>
											<legend>MONITOR FATTURAZIONE ELETTRONICA</legend>
											<table>
												<tr>
													<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "UtenteMonitorFttElett", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="UtenteMonitorFttElett"><%label.write(out);%></label><%}%></td>
													<td valign="top"><% 
  WebTextInput ClienteSoftreUtenteMonitorFttElett =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "UtenteMonitorFttElett"); 
  ClienteSoftreUtenteMonitorFttElett.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreUtenteMonitorFttElett.getClassType()%>" id="<%=ClienteSoftreUtenteMonitorFttElett.getId()%>" maxlength="<%=ClienteSoftreUtenteMonitorFttElett.getMaxLength()%>" name="<%=ClienteSoftreUtenteMonitorFttElett.getName()%>" size="<%=ClienteSoftreUtenteMonitorFttElett.getSize()%>"><% 
  ClienteSoftreUtenteMonitorFttElett.write(out); 
%>
</td>
												</tr>
												<tr>
													<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "PasswordMonitorFttElett", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="PasswordMonitorFttElett"><%label.write(out);%></label><%}%></td>
													<td valign="top"><% 
  WebTextInput ClienteSoftrePasswordMonitorFttElett =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "PasswordMonitorFttElett"); 
  ClienteSoftrePasswordMonitorFttElett.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftrePasswordMonitorFttElett.getClassType()%>" id="<%=ClienteSoftrePasswordMonitorFttElett.getId()%>" maxlength="<%=ClienteSoftrePasswordMonitorFttElett.getMaxLength()%>" name="<%=ClienteSoftrePasswordMonitorFttElett.getName()%>" size="<%=ClienteSoftrePasswordMonitorFttElett.getSize()%>"><% 
  ClienteSoftrePasswordMonitorFttElett.write(out); 
%>
</td>
												</tr>
											</table>
										</fieldset>
									</td>
								</tr>
							</table>
					<% mytabbed.endTab(); %> 
</div> <div class="tabbed_page" id="<%=mytabbed.getTabPageId("tab5")%>" style="width:100%;height:100%;overflow:auto;"><% mytabbed.startTab("tab5"); %>
							<table style="width: 100%;">
								<tr>
									<!-- COLONNA SINISTRA -->
									<td style="width: 30%;" valign="top">
										<table style="width: 100%;">
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "AmbienteSviluppo", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="AmbienteSviluppo"><%label.write(out);%></label><%}%></td>
												<td valign="top"><% 
  WebComboBox ClienteSoftreAmbienteSviluppo =  
     new com.thera.thermfw.web.WebComboBox("ClienteSoftre", "AmbienteSviluppo", null); 
  ClienteSoftreAmbienteSviluppo.setParent(ClienteSoftreForm); 
%>
<select id="<%=ClienteSoftreAmbienteSviluppo.getId()%>" name="<%=ClienteSoftreAmbienteSviluppo.getName()%>"><% 
  ClienteSoftreAmbienteSviluppo.write(out); 
%> 
</select></td>
											</tr>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "ManagerProject", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="ManagerProject"><%label.write(out);%></label><%}%></td>
												<td valign="top"><% 
  WebComboBox ClienteSoftreManagerProject =  
     new com.thera.thermfw.web.WebComboBox("ClienteSoftre", "ManagerProject", null); 
  ClienteSoftreManagerProject.setParent(ClienteSoftreForm); 
%>
<select id="<%=ClienteSoftreManagerProject.getId()%>" name="<%=ClienteSoftreManagerProject.getName()%>"><% 
  ClienteSoftreManagerProject.write(out); 
%> 
</select></td>
											</tr>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "NoteServerSvil", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="NoteServerSvil"><%label.write(out);%></label><%}%></td>
												<td valign="top"><% 
  WebTextInput ClienteSoftreNoteServerSvil =  
     new com.thera.thermfw.web.WebTextArea("ClienteSoftre", "NoteServerSvil"); 
  ClienteSoftreNoteServerSvil.setParent(ClienteSoftreForm); 
%>
<textarea class="<%=ClienteSoftreNoteServerSvil.getClassType()%>" cols="60" id="<%=ClienteSoftreNoteServerSvil.getId()%>" maxlength="<%=ClienteSoftreNoteServerSvil.getMaxLength()%>" name="<%=ClienteSoftreNoteServerSvil.getName()%>" rows="5" size="<%=ClienteSoftreNoteServerSvil.getSize()%>"></textarea><% 
  ClienteSoftreNoteServerSvil.write(out); 
%>
</td>
											</tr>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "GitProject", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="GitProject"><%label.write(out);%></label><%}%></td>
												<td valign="top"><% 
  WebTextInput ClienteSoftreGitProject =  
     new com.thera.thermfw.web.WebTextInput("ClienteSoftre", "GitProject"); 
  ClienteSoftreGitProject.setParent(ClienteSoftreForm); 
%>
<input class="<%=ClienteSoftreGitProject.getClassType()%>" id="<%=ClienteSoftreGitProject.getId()%>" maxlength="<%=ClienteSoftreGitProject.getMaxLength()%>" name="<%=ClienteSoftreGitProject.getName()%>" size="<%=ClienteSoftreGitProject.getSize()%>"><% 
  ClienteSoftreGitProject.write(out); 
%>
</td>
											</tr>
											<tr>
												<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "ClienteSoftre", "ProjectNote", null); 
   label.setParent(ClienteSoftreForm); 
%><label class="<%=label.getClassType()%>" for="ProjectNote"><%label.write(out);%></label><%}%></td>
												<td valign="top"><% 
  WebTextInput ClienteSoftreProjectNote =  
     new com.thera.thermfw.web.WebTextArea("ClienteSoftre", "ProjectNote"); 
  ClienteSoftreProjectNote.setParent(ClienteSoftreForm); 
%>
<textarea class="<%=ClienteSoftreProjectNote.getClassType()%>" cols="60" id="<%=ClienteSoftreProjectNote.getId()%>" maxlength="<%=ClienteSoftreProjectNote.getMaxLength()%>" name="<%=ClienteSoftreProjectNote.getName()%>" rows="5" size="<%=ClienteSoftreProjectNote.getSize()%>"></textarea><% 
  ClienteSoftreProjectNote.write(out); 
%>
</td>
											</tr>
										</table>
									</td>

									<!-- COLONNA DESTRA -->
									<td valign="top"><details class="custom-details">
											<summary>Fix Add-On</summary>
											<fieldset>
												<!--<span class="editgrid" id="FixAddOn">--><% 
  WebEditGrid ClienteSoftreFixAddOn =  
     new com.thera.thermfw.web.WebEditGrid("ClienteSoftre", "FixAddOn", 3, new String[]{"IdFix", "FixAddOn.Descrizione"}, 0, null, null,false,"com.thera.thermfw.web.servlet.GridActionAdapterForIndependentRow"); 
 ClienteSoftreFixAddOn.setParent(ClienteSoftreForm); 
 ClienteSoftreFixAddOn.setNoControlRowKeys(false); 
 ClienteSoftreFixAddOn.write(out); 
%>
<!--</span>-->
											</fieldset>
										</details> <details class="custom-details" style="width: 100% !important;">
											<summary>Fix personalizzate</summary>
											<fieldset style="width: 100%; height: 100%;">
												<iframe id="elencoFix" style="width: 99%; height: 50vh;"></iframe>
											</fieldset>
										</details></td>
								</tr>
								<tr>
									<td valign="top"><% 
  WebCheckBox ClienteSoftreKasko =  
     new com.thera.thermfw.web.WebCheckBox("ClienteSoftre", "Kasko"); 
  ClienteSoftreKasko.setParent(ClienteSoftreForm); 
%>
<input id="<%=ClienteSoftreKasko.getId()%>" name="<%=ClienteSoftreKasko.getName()%>" type="checkbox" value="Y"><%
  ClienteSoftreKasko.write(out); 
%>
</td>
								</tr>
							</table>
					<% mytabbed.endTab(); %> 
</div> <div class="tabbed_page" id="<%=mytabbed.getTabPageId("tab3")%>" style="width:100%;height:100%;overflow:auto;"><% mytabbed.startTab("tab3"); %>
							<table style="width: 100%;">
								<tr>
									<td><!--<span class="editgrid" id="VPNCliente">--><% 
  WebEditGrid ClienteSoftreVPNCliente =  
     new com.thera.thermfw.web.WebEditGrid("ClienteSoftre", "VPNCliente", 8, new String[]{"IdProgressivo", "TipoVpn", "Indirizzo", "Porta", "Username", "Password", "NoteVpn", "PreSharedKey"}, 1, null, null,false,"com.thera.thermfw.web.servlet.GridActionAdapterForIndependentRow"); 
 ClienteSoftreVPNCliente.setParent(ClienteSoftreForm); 
 ClienteSoftreVPNCliente.setNoControlRowKeys(false); 
 ClienteSoftreVPNCliente.write(out); 
%>
<BR><% 
   request.setAttribute("parentForm", ClienteSoftreForm); 
   String CDForVPNCliente = "VPNCliente"; 
%>
<jsp:include page="/it/softre/thip/base/cliente/YYvpnCliente.jsp" flush="true"> 
<jsp:param name="EditGridCDName" value="<%=CDForVPNCliente%>"/> 
<jsp:param name="Mode" value="NEW"/> 
</jsp:include> 
<!--</span>--></td>
								</tr>
							</table>
					<% mytabbed.endTab(); %> 
</div> <div class="tabbed_page" id="<%=mytabbed.getTabPageId("tab6")%>" style="width:100%;height:100%;overflow:auto;"><% mytabbed.startTab("tab6"); %>
							<table style="width: 100%;">
								<tr>
									<td><!--<span class="editgrid" id="InterventiSpot">--><% 
  WebEditGrid ClienteSoftreInterventiSpot =  
     new com.thera.thermfw.web.WebEditGrid("ClienteSoftre", "InterventiSpot", 5, new String[]{"IdRiga", "IdAnagrafico", "IdAzienda", "Comando", "Descrizione", "Tipologia", "LinkDrive", "Azienda.Descrizione"}, 3, null, null,false,"com.thera.thermfw.web.servlet.GridActionAdapterForIndependentRow"); 
 ClienteSoftreInterventiSpot.setParent(ClienteSoftreForm); 
 ClienteSoftreInterventiSpot.setNoControlRowKeys(false); 
 ClienteSoftreInterventiSpot.addHideAsDefault("Azienda.Descrizione"); 
 ClienteSoftreInterventiSpot.write(out); 
%>
<!--</span>--></td>
								</tr>
							</table>
					<% mytabbed.endTab(); %> 
</div> <div class="tabbed_page" id="<%=mytabbed.getTabPageId("tab7")%>" style="width:100%;height:100%;overflow:auto;"><% mytabbed.startTab("tab7"); %>
							<table style="width: 100%;">
								<tr>
									<td><!--<span class="editgrid" id="DocumentazioneCliente">--><% 
  WebEditGrid ClienteSoftreDocumentazioneCliente =  
     new com.thera.thermfw.web.WebEditGrid("ClienteSoftre", "DocumentazioneCliente", 5, new String[]{"IdRiga", "IdAnagrafico", "IdAzienda", "Titolo", "Descrizione", "LinkDrive", "Azienda.Descrizione"}, 3, null, null,false,"com.thera.thermfw.web.servlet.GridActionAdapterForIndependentRow"); 
 ClienteSoftreDocumentazioneCliente.setParent(ClienteSoftreForm); 
 ClienteSoftreDocumentazioneCliente.setNoControlRowKeys(false); 
 ClienteSoftreDocumentazioneCliente.addHideAsDefault("Azienda.Descrizione"); 
 ClienteSoftreDocumentazioneCliente.write(out); 
%>
<!--</span>-->
									</td>
								</tr>
							</table>
					<% mytabbed.endTab(); %> 
</div>
				</div><% mytabbed.endTabbed();%> 

     </td>
   </tr>
</table><!--</span>--></td>
			</tr>
			<tr>
				<td style="height: 0"><% 
  WebErrorList errorList = new com.thera.thermfw.web.WebErrorList(); 
  errorList.setParent(ClienteSoftreForm); 
  errorList.write(out); 
%>
<!--<span class="errorlist"></span>--></td>
			</tr>
		</table>
	<%
  ClienteSoftreForm.writeFormEndElements(out); 
%>
</form></td>
</tr>

<tr>
<td style="height:0">
<% String ftr = ClienteSoftreForm.getCompleteFooter();
 if (ftr != null) { 
   request.setAttribute("dataCollector", ClienteSoftreBODC); 
   request.setAttribute("servletEnvironment", se); %>
  <jsp:include page="<%= ftr %>" flush="true"/> 
<% } %> 
</td>
</tr>
</table>


<%
           // blocco YYY  
           // a completamento blocco di codice XXX in head 
              ClienteSoftreForm.writeBodyEndElements(out); 
           } 
           else 
              errors.addAll(0, ClienteSoftreBODC.getErrorList().getErrors()); 
        } 
        else 
           errors.addAll(0, ClienteSoftreBODC.getErrorList().getErrors()); 
           if(ClienteSoftreBODC.getConflict() != null) 
                conflitPresent = true; 
     } 
     else 
        errors.add(new ErrorMessage("BAS0000010")); 
  } 
  catch(NamingException e) { 
     errorMessage = e.getMessage(); 
     errors.add(new ErrorMessage("CBS000025", errorMessage));  } 
  catch(SQLException e) {
     errorMessage = e.getMessage(); 
     errors.add(new ErrorMessage("BAS0000071", errorMessage));  } 
  catch(Throwable e) {
     e.printStackTrace(Trace.excStream);
  }
  finally 
  {
     if(ClienteSoftreBODC != null && !ClienteSoftreBODC.close(false)) 
        errors.addAll(0, ClienteSoftreBODC.getErrorList().getErrors()); 
     try 
     { 
        se.end(); 
     }
     catch(IllegalArgumentException e) { 
        e.printStackTrace(Trace.excStream); 
     } 
     catch(SQLException e) { 
        e.printStackTrace(Trace.excStream); 
     } 
  } 
  if(!errors.isEmpty())
  { 
      if(!conflitPresent)
  { 
     request.setAttribute("ErrorMessages", errors); 
     String errorPage = ClienteSoftreForm.getErrorPage(); 
%> 
     <jsp:include page="<%=errorPage%>" flush="true"/> 
<% 
  } 
  else 
  { 
     request.setAttribute("ConflictMessages", ClienteSoftreBODC.getConflict()); 
     request.setAttribute("ErrorMessages", errors); 
     String conflictPage = ClienteSoftreForm.getConflictPage(); 
%> 
     <jsp:include page="<%=conflictPage%>" flush="true"/> 
<% 
   } 
   } 
%> 
</body>

</html>
