

//RECEBER OS DADOS DO SCRIPT-CARRINHO-COMPRAS NA PÁGINA COMPROVANTE, 
//ATRAVÉS DO SESSION STORAGE


window.onload = function dadosCompra() {

	/// TOTAL COMPRA ///

	let totalCompra = sessionStorage.getItem("totalIng");
	document.getElementById("subtotal").innerHTML = totalCompra; 
    document.getElementById("total").innerHTML = totalCompra;
    
	/// PRECO INGRESSO MEIO ///

	let ingMeio = sessionStorage.getItem("ingMeio");

	document.getElementById("meio").innerHTML = ingMeio;
  

	/// PRECO INGRESSO INTEIRO ///

	let ingInt = sessionStorage.getItem("ingInt");
	document.getElementById("int").innerHTML = ingInt;


	/// QUANTIDADE INGRESSO MEIO ///

	let qtdMeio = sessionStorage.getItem("qtdMeio");
	document.getElementById("qtdmeio").innerHTML = qtdMeio; 


	///  QUANTIDADE INGRESSO INTEIRO ///

	let qtdInt = sessionStorage.getItem("qtdInt");
	document.getElementById("qtdint").innerHTML = qtdInt; 
   

}
