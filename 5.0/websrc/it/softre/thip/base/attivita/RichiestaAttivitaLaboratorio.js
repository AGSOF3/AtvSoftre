function RichiestaAttivitaLaboratoOL() {

}

function conferma() {
	var className = document.forms[0].thClassName;
	runActionDirect('SAVE', 'action_submit', className, '', 'errorsFrame', 'no');
}