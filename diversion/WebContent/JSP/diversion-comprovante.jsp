<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.* "%>
<%@ page import="com.diversion.model.ClienteBEANS" %>	

<%
		ClienteBEANS cliente = (ClienteBEANS) session.getAttribute("clienteDados");
	%>
	

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Comprovante de compra</title>

<link rel="stylesheet" href="../CSS/style-comprovante.css">

<!-- ICONE DA PÁGINA-->
<link rel="shortcut icon" href="../IMG/box.png">

<!-- FONTE OPEN SANS -->
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet">





<style type="text/css">

/* UTILIZANDO O MEDIA TYPE LIMITAMOS O ESCOPO DAS FOLHAS DE ESTILO*/  

@media print {
	* {
		margin: 0;
		padding: 0;
		font-family: 'Open Sans', sans-serif;
	}
	.print {
		display: none;
	}
	.greeting {
		display: none;
	}
	.name {
		display: none;
	}
	.receipt {
		box-shadow: none;
		width: 500px;
		margin-bottom: 20px;
		position: none;
		margin-left: -300px;
		margin-bottom: 200px;
		margin-top: -350px;
	}
	.footer .sticky-footer {
		display: none;
	}
	.not {
		margin-left: -8px;
	}
	.details {
		font-size: 20px !important;
	}
	.details p {
		font-size: 20px !important;
	}
	.totalprice p {
		font-size: 20px !important;
	}
	.order p{
	  font-size: 20px !important;
	}
}
</style>

<!--RECEBIMENTO DE DADOS DO PAGAMENTO-->
<script src="../JS/script-dados-comprovante.js"></script>


</head>
<body>
	<div class="receipt">
		<h2 class="name">diversiON</h2>
		<p class="greeting">Obrigado por comprar conosco!</p>
		
		<!--PEDIDO INFO-->
		<div class="order">
			<p>Nome:
			   <%=cliente.getClienteNome() %>
			</p>
		    <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
			<p>Data :  <%= df.format(new java.util.Date()) %>	 
				
            			
			</p>
		</div>
		<hr>
		<!-- DETALHES -->
		<div class="details">
			<h3>Detalhes</h3>
			<div class="product">
				<div class="info">
					<h4>Ingresso Inteiro<p>Qtd:	<span id="qtdint">0</span></p></h4>
					<h4>Ingresso Meio</h4><p>Qtd:<span id="qtdmeio">0</span></p>
				</div>
			</div>
			<p>
				R$<span id="int">0.00</span>
			</p>
			<p>
				R$<span id="meio">0.00</span>
			</p>
		</div>

		<!-- SUB TOTAL E TOTAL -->
		<div class="totalprice">
			<p class="sub">
				Subtotal<span id="subtotal"></span> <span> R$ </span>
			</p>
			<hr>
			<p class="tot">
				Total<span id="total"></span> <span> R$ </span>
			</p>
			<!-- UTILIZANDO PRINT() CHAMAMOS O ESCOPO LIMITADO COM O @MEDIA -->
			<button id="botao"  onclick="print()" class="print">Imprimir comprovante</button> 
			<img src="../IMG/code.png" class="not">
			
		</div>
	</div>
   

   	<!--POP UP FAQS-->	
	<section>
       <div class="popup" id="popup-1">
                <div class="overlay"></div>
                <div class="content">
                    <div class="close-btn" onclick="togglePopup()">&times;
                    </div>
                <h2 id="pop">Perguntas Frequentes(FAQs)</h2>
                <p>
                    
                    <div class="accordion">
                        <div class="icon"></div>
                        <h5>Qual horario de funcionamento para a compra de ingresso presencialmente?</h5>
                    </div>
                        <div class="panel">
                            <p>O parque fica aberto de Terça-feira a Sábado, das 9 da manhã até 18 da tarde.     
                            </p>
                        </div>
                    <div class="accordion">
                        <div class="icon"></div>
                        <h5>Qual tipo de documento eu devo apresentar caso eu possua ingresso meio?</h5>
                    </div>
                        <div class="panel">
                            <p>Apenas o rg da criança já é o suficiente.   
                            </p>
                        </div>
                    <div class="accordion">
                        <div class="icon"></div>
                        <h5>Existe idade minima para o cadastro?</h5>
                    </div>
                        <div class="panel">
                            <p>Sim, é obrigatório ter idade superior ou igual a 18 anos 
                            </p>
                        </div>   
                    <div class="accordion">
                        <div class="icon"></div>
                        <h5>O ingresso pode ser utilizado em qualquer dia para entrada no parque?</h5>
                    </div>
                        <div class="panel">
                            <p>Sim, porém apenas uma vez, sendo obrigatório apresentar o comprovante disponibilizado no final da compra, para validar o ingresso.   
                            </p>
                        </div>   
                   </div>  
            </div> 
        </section>
        
          <!--POP UP CONTATO-->
         <section>
            <div class="popup" id="popup-2">
                <div class="overlay"></div>
                <div class="content">
                    <div class="close-btn" onclick="ativar2()">&times;
                    </div>
                <h2 id="pop2">Entre em contato conosco!</h2>
                <p>
                    <div id="container">
                        <div class="box">
                            <div class="imgBx">
                                <img src="../IMG/call.png">
                            </div>
                            <div class="content">
                            <div class="icon">
                            <img src="../IMG/call.png"> 
                            <h3>Numero Contato</h3>   
                            <h4>+55 41984394153</h4> 
                            <h4>+55 4198894787</h4></div>
                        </div>  
                        </div>
                        <div class="box">
                            <div class="imgBx">
                                <img src="../IMG/email.png">
                            </div>
                            <div class="content">
                                <div class="icon">
                                    <img src="../IMG/email.png">
                                    <h3>Email</h3>   
                                       <h4>gabriel@diversion.com</h4> 
                                    <h4>joao@diversion.com</h4>  </div>
                                </div> 
                        </div>
                
                        <div class="box">
                            <div class="imgBx">
                                <img src="../IMG/mapa.png">
                            </div>
                            <div class="content">
                                <div class="icon">
                                    <img src="../IMG/mapa.png">
                                    <h3>Endereço</h3>   
                                    <h4>Curitiba, Rua XV de março, 1451</h4> 
                                </div>
                            </div> 
                        </div>                      
                     </div>
                    </div>
            </div>
	 </section>
	 
	<!-- FOOTER -->
	<div class="footer">
		<footer class="sticky-footer">
			<ul>
				 <li> <button  onclick="togglePopup()" class="btn-hover color-3">Perguntas Frequentes</button></li>
                <li> <button  onclick="ativar2()" class="btn-hover color-3">Contato</button>
				<li> <a href="../Logout"><button  class="btn-hover color-3">Sair</button ></a> </li>
			</ul>
			<p>&copy; Copyright diversiON 2021.</p>
		</footer>

	</div>
    
    <!-- ESTA TAG SCRIPT FOI CRIADA PARA QUE QUANDO CLICAR EM "HOME" NÃO SEJA POSSIVEL RETORNAR PARA A PÁGINA -->
<script>
	function preback() {
		window.history.forward();
	}
	setTimeout("preback()", 0);
	window.onunload = function() {
		null
	};
</script>


<!-- POPUPS -->
<script src="../JS/script-popups.js"></script>


</body>
</html>


