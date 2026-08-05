function ClienteSoftreOL() {
	
	let idCliente = document.getElementById('IdAnagrafico').value;
	let url = 'servlet/com.thera.thermfw.web.servlet.ShowGrid?thGridType=list&ClassName=YFixPersona&thRestrictConditions=IdCliente='+idCliente;
//	console.log(url);
	document.getElementById('elencoFix').src = url;
	

    var ids = [
        'UrlPanth01Interno',
        'UrlPanth02Interno',
        'UrlPanth01Esterno',
        'UrlPanth02Esterno',
        'GitProject'
    ];

    for (var i = 0; i < ids.length; i++) {
        var el = document.getElementById(ids[i]);
        if (el) {
            el.ondblclick = apriPantheraExt;
            el.style.cursor = 'pointer';
        }
    }
    
    //72424 inizio
	let dbVendor01 = document.getElementById('DbVendor01').value;
	let row01 = document.getElementById('rowSQLServerExpress01');

	if (dbVendor01 != "Microsoft SQL Server") {
    	row01.style.display = "none";
	} else {
    	row01.style.display = "";
	}
	
	let dbVendor02 = document.getElementById('DbVendor02').value;
	let row02 = document.getElementById('rowSQLServerExpress02');

	if (dbVendor02 != "Microsoft SQL Server") {
    	row02.style.display = "none";
	} else {
    	row02.style.display = "";
	}
	//72424 fine
}

function apriPantheraExt(e) {

    e = e || window.event;
    var target = e.target || e.srcElement;

    if (target && target.value) {
        parent.window.open(target.value);
    }
}