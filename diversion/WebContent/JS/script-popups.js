

//ATIVAR PRIMEIRA POPUP FAQS
function togglePopup() {
	document.getElementById("popup-1").classList.toggle('active')
}
//ATIVAR SEGUNDA POPUP CONTATO
function ativar2() {
	document.getElementById("popup-2").classList.toggle('active')
}
//ATIVAR TERCEIRA POPUP LOGIN
function ativar3() {
	document.getElementById("popup-3").classList.toggle('active')
}

//FAQS

var acc = document.getElementsByClassName('accordion');
var i;
var len = acc.length;
for (i = 0; i < len; i++) {
	acc[i].addEventListener('click', function() {
		this.classList.toggle('active');
		var panel = this.nextElementSibling;
		if (panel.style.maxHeight) {
			panel.style.maxHeight = null;
		}
		else {
			panel.style.maxHeight = panel.scrollHeight + 'px'
		}
	})
}





