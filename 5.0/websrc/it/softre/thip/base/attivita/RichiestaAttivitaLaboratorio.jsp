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
  BODataCollector RichiestaAttivitaLaboratoBODC = null; 
  List errors = new ArrayList(); 
  WebJSTypeList jsList = new WebJSTypeList(); 
  WebForm RichiestaAttivitaLaboratoForm =  
     new com.thera.thermfw.web.WebForm(request, response, "RichiestaAttivitaLaboratoForm", "RichiestaAttivitaLaborato", null, "com.thera.thermfw.web.servlet.FormActionAdapter", false, false, true, true, true, true, null, 0, true, "it/softre/thip/base/attivita/RichiestaAttivitaLaboratorio.js"); 
  RichiestaAttivitaLaboratoForm.setServletEnvironment(se); 
  RichiestaAttivitaLaboratoForm.setJSTypeList(jsList); 
  RichiestaAttivitaLaboratoForm.setHeader(null); 
  RichiestaAttivitaLaboratoForm.setFooter("com.thera.thermfw.common.Footer.jsp"); 
  RichiestaAttivitaLaboratoForm.setWebFormModifierClass("it.softre.thip.base.attivita.web.RichiestaAttivitaLaboratorioFormModifier"); 
  RichiestaAttivitaLaboratoForm.setDeniedAttributeModeStr("hideNone"); 
  int mode = RichiestaAttivitaLaboratoForm.getMode(); 
  String key = RichiestaAttivitaLaboratoForm.getKey(); 
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
        RichiestaAttivitaLaboratoForm.outTraceInfo(getClass().getName()); 
        String collectorName = RichiestaAttivitaLaboratoForm.findBODataCollectorName(); 
                RichiestaAttivitaLaboratoBODC = (BODataCollector)Factory.createObject(collectorName); 
        if (RichiestaAttivitaLaboratoBODC instanceof WebDataCollector) 
            ((WebDataCollector)RichiestaAttivitaLaboratoBODC).setServletEnvironment(se); 
        RichiestaAttivitaLaboratoBODC.initialize("RichiestaAttivitaLaborato", true, 0); 
        RichiestaAttivitaLaboratoForm.setBODataCollector(RichiestaAttivitaLaboratoBODC); 
        int rcBODC = RichiestaAttivitaLaboratoForm.initSecurityServices(); 
        mode = RichiestaAttivitaLaboratoForm.getMode(); 
        if (rcBODC == BODataCollector.OK) 
        { 
           requestIsValid = true; 
           RichiestaAttivitaLaboratoForm.write(out); 
           if(mode != WebForm.NEW) 
              rcBODC = RichiestaAttivitaLaboratoBODC.retrieve(key); 
           if(rcBODC == BODataCollector.OK) 
           { 
              RichiestaAttivitaLaboratoForm.writeHeadElements(out); 
           // fine blocco XXX  
           // a completamento blocco di codice YYY a fine body con catch e gestione errori 
%> 

</head>

<body onbeforeunload="<%=RichiestaAttivitaLaboratoForm.getBodyOnBeforeUnload()%>" onload="<%=RichiestaAttivitaLaboratoForm.getBodyOnLoad()%>" onunload="<%=RichiestaAttivitaLaboratoForm.getBodyOnUnload()%>" style="margin: 0px; overflow: hidden;"><%
   RichiestaAttivitaLaboratoForm.writeBodyStartElements(out); 
%> 

	<table width="100%" height="100%" cellspacing="0" cellpadding="0">
<tr>
<td style="height:0" valign="top">
<% String hdr = RichiestaAttivitaLaboratoForm.getCompleteHeader();
 if (hdr != null) { 
   request.setAttribute("dataCollector", RichiestaAttivitaLaboratoBODC); 
   request.setAttribute("servletEnvironment", se); %>
  <jsp:include page="<%= hdr %>" flush="true"/> 
<% } %> 
</td>
</tr>

<tr>
<td valign="top" height="100%">
<form action="<%=RichiestaAttivitaLaboratoForm.getServlet()%>" method="post" name="myForm" style="height:100%"><%
  RichiestaAttivitaLaboratoForm.writeFormStartElements(out); 
%>

		<table cellpadding="0" cellspacing="0" id="emptyborder" width="100%">
			<tr>
				<table style="width: 100%;">
					<tr>
						<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "RichiestaAttivitaLaborato", "NomeAttivita", null); 
   label.setParent(RichiestaAttivitaLaboratoForm); 
%><label class="<%=label.getClassType()%>" for="NomeAttivita"><%label.write(out);%></label><%}%></td>
						<td valign="top"><% 
  WebTextInput RichiestaAttivitaLaboratoNomeAttivita =  
     new com.thera.thermfw.web.WebTextArea("RichiestaAttivitaLaborato", "NomeAttivita"); 
  RichiestaAttivitaLaboratoNomeAttivita.setParent(RichiestaAttivitaLaboratoForm); 
%>
<textarea class="<%=RichiestaAttivitaLaboratoNomeAttivita.getClassType()%>" cols="100" id="<%=RichiestaAttivitaLaboratoNomeAttivita.getId()%>" maxlength="<%=RichiestaAttivitaLaboratoNomeAttivita.getMaxLength()%>" name="<%=RichiestaAttivitaLaboratoNomeAttivita.getName()%>" rows="1" size="<%=RichiestaAttivitaLaboratoNomeAttivita.getSize()%>"></textarea><% 
  RichiestaAttivitaLaboratoNomeAttivita.write(out); 
%>
</td>
					</tr>
					<tr>
						<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "RichiestaAttivitaLaborato", "IdClienteSoftre", null); 
   label.setParent(RichiestaAttivitaLaboratoForm); 
%><label class="<%=label.getClassType()%>" for="ClienteSoftre"><%label.write(out);%></label><%}%></td>
						<td valign="top"><% 
  WebMultiSearchForm RichiestaAttivitaLaboratoClienteSoftre =  
     new com.thera.thermfw.web.WebMultiSearchForm("RichiestaAttivitaLaborato", "ClienteSoftre", false, false, true, 1, null, null); 
  RichiestaAttivitaLaboratoClienteSoftre.setParent(RichiestaAttivitaLaboratoForm); 
  RichiestaAttivitaLaboratoClienteSoftre.write(out); 
%>
<!--<span class="multisearchform" id="ClienteSoftre"></span>--></td>
					</tr>
					<tr>
						<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "RichiestaAttivitaLaborato", "DescrizioneAttivita", null); 
   label.setParent(RichiestaAttivitaLaboratoForm); 
%><label class="<%=label.getClassType()%>" for="DescrizioneAttivita"><%label.write(out);%></label><%}%></td>
						<td valign="top"><% 
  WebTextInput RichiestaAttivitaLaboratoDescrizioneAttivita =  
     new com.thera.thermfw.web.WebTextArea("RichiestaAttivitaLaborato", "DescrizioneAttivita"); 
  RichiestaAttivitaLaboratoDescrizioneAttivita.setParent(RichiestaAttivitaLaboratoForm); 
%>
<textarea class="<%=RichiestaAttivitaLaboratoDescrizioneAttivita.getClassType()%>" cols="100" id="<%=RichiestaAttivitaLaboratoDescrizioneAttivita.getId()%>" maxlength="<%=RichiestaAttivitaLaboratoDescrizioneAttivita.getMaxLength()%>" name="<%=RichiestaAttivitaLaboratoDescrizioneAttivita.getName()%>" rows="5" size="<%=RichiestaAttivitaLaboratoDescrizioneAttivita.getSize()%>"></textarea><% 
  RichiestaAttivitaLaboratoDescrizioneAttivita.write(out); 
%>
</td>
					</tr>
					<tr>
						<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "RichiestaAttivitaLaborato", "RichiedenteSoftre", null); 
   label.setParent(RichiestaAttivitaLaboratoForm); 
%><label class="<%=label.getClassType()%>" for="RichiedenteSoftre"><%label.write(out);%></label><%}%></td>
						<td valign="top"><% 
  WebMultiSearchForm RichiestaAttivitaLaboratoRichiedenteSoftre =  
     new com.thera.thermfw.web.WebMultiSearchForm("RichiestaAttivitaLaborato", "RichiedenteSoftre", false, false, true, 1, null, null); 
  RichiestaAttivitaLaboratoRichiedenteSoftre.setParent(RichiestaAttivitaLaboratoForm); 
  RichiestaAttivitaLaboratoRichiedenteSoftre.write(out); 
%>
<!--<span class="multisearchform" id="RichiedenteSoftre"></span>--></td>
					</tr>
					<tr>
						<td valign="top"><%{  WebLabelCompound label = new com.thera.thermfw.web.WebLabelCompound(null, null, "RichiestaAttivitaLaborato", "StatoAttivita", null); 
   label.setParent(RichiestaAttivitaLaboratoForm); 
%><label class="<%=label.getClassType()%>" for="StatoAttivita"><%label.write(out);%></label><%}%></td>
						<td valign="top"><% 
  WebComboBox RichiestaAttivitaLaboratoStatoAttivita =  
     new com.thera.thermfw.web.WebComboBox("RichiestaAttivitaLaborato", "StatoAttivita", null); 
  RichiestaAttivitaLaboratoStatoAttivita.setParent(RichiestaAttivitaLaboratoForm); 
%>
<select id="<%=RichiestaAttivitaLaboratoStatoAttivita.getId()%>" name="<%=RichiestaAttivitaLaboratoStatoAttivita.getName()%>"><% 
  RichiestaAttivitaLaboratoStatoAttivita.write(out); 
%> 
</select></td>
					</tr>
					<tr>
						<td>
							
<% 
  WebButton cnfButWebButton = new WebButton(); 
  cnfButWebButton.setImage(null); 
  cnfButWebButton.setResourceFile("it.softre.thip.base.attivita.resources.RichiestaAttivitaLaboratorio"); 
  cnfButWebButton.setResourceId("cnfBut"); 
  cnfButWebButton.setResourceTooltipId(null); 
%>
<button class=" <%=cnfButWebButton.getButtonCSSClass()%>" id="cnfBut" name="cnfBut" onclick="conferma();" style="width: 100px" title="<%=cnfButWebButton.getTitle()%>" type="button"><%cnfButWebButton.getBtnContent(out);%></button>
						</td>
					</tr>
					<tr>
						<td style="height: 0"><% 
  WebErrorList errorList = new com.thera.thermfw.web.WebErrorList(); 
  errorList.setParent(RichiestaAttivitaLaboratoForm); 
  errorList.write(out); 
%>
<!--<span class="errorlist"></span>--></td>
					</tr>
				</table>
			</tr>
		</table>
	<%
  RichiestaAttivitaLaboratoForm.writeFormEndElements(out); 
%>
</form></td>
</tr>

<tr>
<td style="height:0">
<% String ftr = RichiestaAttivitaLaboratoForm.getCompleteFooter();
 if (ftr != null) { 
   request.setAttribute("dataCollector", RichiestaAttivitaLaboratoBODC); 
   request.setAttribute("servletEnvironment", se); %>
  <jsp:include page="<%= ftr %>" flush="true"/> 
<% } %> 
</td>
</tr>
</table>


<%
           // blocco YYY  
           // a completamento blocco di codice XXX in head 
              RichiestaAttivitaLaboratoForm.writeBodyEndElements(out); 
           } 
           else 
              errors.addAll(0, RichiestaAttivitaLaboratoBODC.getErrorList().getErrors()); 
        } 
        else 
           errors.addAll(0, RichiestaAttivitaLaboratoBODC.getErrorList().getErrors()); 
           if(RichiestaAttivitaLaboratoBODC.getConflict() != null) 
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
     if(RichiestaAttivitaLaboratoBODC != null && !RichiestaAttivitaLaboratoBODC.close(false)) 
        errors.addAll(0, RichiestaAttivitaLaboratoBODC.getErrorList().getErrors()); 
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
     String errorPage = RichiestaAttivitaLaboratoForm.getErrorPage(); 
%> 
     <jsp:include page="<%=errorPage%>" flush="true"/> 
<% 
  } 
  else 
  { 
     request.setAttribute("ConflictMessages", RichiestaAttivitaLaboratoBODC.getConflict()); 
     request.setAttribute("ErrorMessages", errors); 
     String conflictPage = RichiestaAttivitaLaboratoForm.getConflictPage(); 
%> 
     <jsp:include page="<%=conflictPage%>" flush="true"/> 
<% 
   } 
   } 
%> 
</body>
</html>
