<%@page import="com.thera.thermfw.web.WebJSTypeList"%>
<%@page import="it.thera.thip.base.profilo.UtenteAzienda"%>
<%@page import="java.util.List"%>
<%@page import="it.softre.thip.base.attivita.AttivitaSoftre"%>
<%
UtenteAzienda utenteAzienda = UtenteAzienda.getUtenteAziendaConnesso();
String image = null;
if (utenteAzienda.getDipendente() != null) {
	if (utenteAzienda.getDipendente().getURLImmagineDipendente() != null) {
		image = utenteAzienda.getDipendente().getURLImmagineDipendente();
	}
}
if (image == null)
	image = "https://tacm.com/wp-content/uploads/2018/01/no-image-available.jpeg";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Chat</title>
<%
out.print(WebJSTypeList.getImportForCSS("it/softre/thip/base/attivita/css/bootstrap.min.css", request));
out.print(WebJSTypeList.getImportForCSS("it/softre/thip/base/font-awesome/css/font-awesome.min.css", request));
out.print(WebJSTypeList.getImportForCSS("it/softre/thip/base/attivita/css/chat.css", request));
out.print(WebJSTypeList.getImportForJSLibrary("it/softre/thip/base/attivita/js/bootstrap.min.js", request));
out.print(WebJSTypeList.getImportForJSLibrary("it/softre/thip/base/attivita/js/jquery.js", request));
out.print(WebJSTypeList.getImportForJSLibrary("it/softre/thip/base/attivita/js/chat.js", request));
%>
</head>
<body>
    <div id="chat-page">
        <div id="chat-container"></div>

        <div id="footer-container">

		    <div id="attachment-preview-container"></div>
		
		    <div id="file-status-container"></div>
		    
		    <div id="attachment-preview-container"></div>
		
		    <div class="footer-row">
		
		        <div class="user-image-container">
		            <img class="chat-user-img" src="<%=image%>" alt="avatar">
		        </div>
		
		        <div class="upload-file-message">
		            <i id="file-upload-icon" class="fa fa-plus"></i>
		        </div>
		
		        <div class="input-container">
		            <textarea
		                id="message-input"
		                rows="1"
		                placeholder="Type a message..."></textarea>
		        </div>
		
		        <div class="btn-send-message" id="send-message-icon">
		            <i class="fa fa-paper-plane"></i>
		        </div>
		
		    </div>
		
		    <input type="file" id="file-input" style="display:none;">
		
		</div>
    </div>

    <script>
        var idAttivita = document.forms[0].Id.value;
    </script>
</body>
</html>