


// RECEBER OS DADOS DO SCRIPT-CARRINHO-COMPRAS NA PÁGINA PAGAMENTO
// QUE ESTÃO ARMAZENADOS NA SESSÃO ATRAVÉS DO SESSION STORAGE

window.onload = function dadosCompra() {

	/// TOTAL COMPRA ///

	let totalCompra = sessionStorage.getItem("totalIng");
	document.getElementById("total").innerHTML = totalCompra;
	document.querySelector(".total").value = totalCompra;

	/// PRECO INGRESSO MEIO ///

	let ingMeio = sessionStorage.getItem("ingMeio");

	document.getElementById("meio").innerHTML = ingMeio;
   document.querySelector(".pricemeio").value = ingMeio;

	/// PRECO INGRESSO INTEIRO ///

	let ingInt = sessionStorage.getItem("ingInt");
	document.getElementById("int").innerHTML = ingInt;
	 document.querySelector(".priceint").value = ingInt;

	/// QUANTIDADE INGRESSO MEIO ///

	let qtdMeio = sessionStorage.getItem("qtdMeio");
	document.getElementById("qtdmeio").innerHTML = qtdMeio; 
	 document.querySelector(".qtdmeio").value = qtdMeio;

	///  QUANTIDADE INGRESSO INTEIRO ///

	let qtdInt = sessionStorage.getItem("qtdInt");
	document.getElementById("qtdint").innerHTML = qtdInt; 
    document.querySelector(".qtdint").value = qtdInt;

}



//JQUERY USADO PARA VALIDAÇÃO DE DADOS NO PAGAMENTO 
$(document).ready(function() {

	$("#form_pagamento").validate({

		rules: {

			cardname: {
				required: true,
				minWords: 2,
				maxlength: 45,
				minlength: 16

			},
			cardnumber: {
				required: true,
				maxlength: 16,
				minlength: 16
			},
			expmonth: {
				required: true
			},
			cvv: {
				required: true
			}

		},
		submitHandler: function(form) {
			var total_ing = $('#total_ing').val();
			var id = $('#id').val();
			var ing_int = $('#ing_int').val();
			var ing_meio = $('#ing_meio').val();
			var qtd_int = $('#qtd_int').val();
			var qtd_meio = $('#qtd_meio').val();
			var soma_qtd = (+qtd_int) + (+qtd_meio);		
			var data_pedido = $('#data_pedido').val();
            
			debugger;
          //ENVIANDO DADOS  PARA A SERVLET ATRAVÉS DO AJAX
			$.ajax({
				type: "POST",
				url: "../ComprarIngresso",
				data: {
					total_ing: total_ing,
					id :id,
					ing_int: ing_int,
					ing_meio: ing_meio,
					qtd_int: qtd_int,
					qtd_meio: qtd_meio,
					soma_qtd: soma_qtd,
					data_pedido: data_pedido
				}
			})
				.done(function() {
					$(location).attr('href', 'diversion-comprovante.jsp')

				});
		}

	})

})










