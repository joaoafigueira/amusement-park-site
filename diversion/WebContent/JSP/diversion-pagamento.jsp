<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.diversion.model.ClienteBEANS" %>	

<%
		ClienteBEANS cliente = (ClienteBEANS) session.getAttribute("clienteDados");
	%>
	

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Pagamento</title>

<link rel="stylesheet" href="../CSS/style-pagamento.css">

 <!-- ICONE DA PÁGINA-->
<link rel="shortcut icon" href="../IMG/pay.png" type="imagem/png">


<!-- FONTE OPEN SANS --> 
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet">

<!--JQUERY FRAMEWORK UTILIZADO NA VALIDAÇÃO E ENVIO DE DADOS PARA A SERVLET ATRAVÉS DO AJAX-->
<script src="../JS/jquery-3.3.1.min.js"></script>

<script src="../JS/jquery.validate.min.js"></script>

<script src="../JS/additional-methods.min.js"></script>

<script src="../JS/messages_pt_BR.js"></script>

<!--RECEBIMENTO DE DADOS E ENVIO PARA A SERVLET-->
<script src="../JS/script-pagamento.js"></script>

</head>
<body>

    <!--DADOS DE PAGAMENTO-->
  
	<h2>Tela de pagamento</h2>
	<div class="row">
		<div class="col-75">
			<div class="container">
				<form name="form_pagamento" id="form_pagamento">
					<div class="row">
						<div class="col-50">
							<h3>Pagamento somente via cartão (Aceitamos todos os tipos)</h3>
							<h3>Nome de Completo:
							   <%=cliente.getClienteNome() %>
							</h3>                    
							<h3>Email:
							    <%=cliente.getClienteEmail() %> 
							    
							</h3>
							<h3>Dados do cartão (Simulação):</h3>        
							<label for="cname">Nome que está no cartão:</label>		
							 <input type="text" name="cardname" placeholder="PEDRO HENRIQUE" pattern="^([a-zA-Za-uA-U]|\s)+$" autocomplete="off" > 

							<label for="cname">Número do cartão:</label> 
							<input type="text" id="cname" name="cardnumber" placeholder="0000 0000 0000 0000" pattern="^[0-9]+$" autocomplete="off"> 
							
							<label for="cname">Mês e o ano que o cartão expira:</label> 
							<input type="text" name="expmonth" placeholder="00/0000" pattern="^\d{2}/\d{4}"  autocomplete="off"> 
							
							<label for="cname">CVV:</label>
							<input type="text" name="cvv" maxlength="3" placeholder="000" pattern="^[0-9]+$" autocomplete="off">

						</div>
					</div>
					<input type="submit" class="btn"  value="Confirmar Compra"/>
				</form>
			</div>
		</div>
		
		    <input type="hidden" value=<%=cliente.getId() %>  id="id" />
		

		
	  <!--VALORES DA COMPRA -->
	  
		<div class="col-25">''
			<div class="container">
				<h4>Carrinho de Compras<span class="price" style="color: black">
				<i class="fa fa-shopping-cart"></i></span>
				</h4>
				<p class="price">
		         <a>Ingresso Inteiro</a>R$<span id="int"></span>
		         <input type="hidden" value="0" class="priceint" name="ingint" id="ing_int" />
			     <br>
			     <br> 
			     Qtd <span id="qtdint"> 0 </span> 
			     <input type="hidden" value="0" class="qtdint" name="qtd_int" id="qtd_int" />
				</p>
				<p class="price1">
				<a>Ingresso Meia </a>R$<span id="meio"></span>
				<input type="hidden" value="0" class="pricemeio" name="ing_meio" id="ing_meio" />
			    <br> 
			    <br> 
			    Qtd <span id="qtdmeio"> 0</span> 
			    <input type="hidden" value="0" class="qtdmeio" name="qtd_meio" id="qtd_meio" />
			   	<br>
				<br>	
				 <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>         
                 <a>Data da compra:  </a> <%= df.format(new java.util.Date()) %>
                 <input type="hidden" id="data_pedido" value=<%= df.format(new java.util.Date()) %>/>            
				</p>
				<hr>
				<h1 class="total1">
					Total: R$ <span id="total">0</span>
					 <input type="hidden" class="total" name="total_ing" id="total_ing" />
				</h1>
				<hr>
              </div>
		</div>
	</div>
	

</body>
</html>

