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

<title>Usuário Logado</title>

<link rel="stylesheet" href="../CSS/style-usuario-logado.css">


<!-- ICONE DA PÁGINA-->
<link rel="shortcut icon" href="../IMG/user.png" type="imagem/png">


<!-- FONTE OPEN SANS -->
<link href ="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet">

</head>
<body>
	<div class="container">
		<div class="main">
			<div class="topbar">
				<a href="../Logout">Sair</a> 
				<a href="diversion-comprar-ingressos.jsp">Comprar Ingressos</a>
				 <a href="../Historico">Histórico de compras</a>

			</div>
			
			<!-- INFO USUÁRIO -->
			<div class="row">

				<div class="col-md-4 mt-1">

					<div class="card text-center sidebar">

						<div class="card-body">
							<img src="../IMG/usernot.png" class="rounded-circle" width="150">
							<div class="mt-3">
								<h2>Nome do usuário:</h2>
                                  <%=cliente.getClienteUser() %>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8 mt-1">
					<div class="card mb-3 content">
						<h1 class="m-3 pt-3">Sobre</h1>
						<div class="card-body">
							<div class="row">
								<div class="col-md-3">
									<h5>Nome Completo</h5>
								</div>
								<div class="col-md-9 text-secondary">
								    <%=cliente.getClienteNome() %>
								</div>
							</div>
							<hr>

							<div class="row">
								<div class="col-md-3">
									<h5>E-mail</h5>
								</div>
								<div class="col-md-9 text-secondary">
								    <%=cliente.getClienteEmail() %>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-md-3">
									<h5>Telefone</h5>
								</div>
								<div class="col-md-9 text-secondary">
								     <%=cliente.getClientePhone() %>
								
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-md-3">
									<h5>Idade</h5>
								</div>
								<div class="col-md-9 text-secondary">
                                  <%=cliente.getClienteIdade() %>															
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!--POP UP FAQS-->
	<section>
		<div class="popup" id="popup-1">
			<div class="overlay"></div>
			<div class="content">
				<div class="close-btn" onclick="togglePopup()">&times;</div>
				<h2 id="pop">Perguntas Frequentes(FAQs)</h2>
				<p>
				<div class="accordion">
					<div class="icon"></div>
					<h5>Qual horario de funcionamento para a compra de ingresso
						presencialmente?</h5>
				</div>
				<div class="panel">
					<p>O parque fica aberto de Terça-feira a Sábado, das 9 da manhã
						até 18 da tarde.</p>
				</div>
				<div class="accordion">
					<div class="icon"></div>
					<h5>O parque permanece aberto em feriados?</h5>
				</div>
				<div class="panel">
					<p>Sim, o parque permanece aberto em dias de feriado</p>
				</div>
				<div class="accordion">
					<div class="icon"></div>
					<h5>Existe idade minima para o cadastro?</h5>
				</div>
				<div class="panel">
					<p>Sim, é obrigatório ter idade superior ou igual a 18 anos</p>
				</div>
				<div class="accordion">
					<div class="icon"></div>
					<h5>O ingresso pode ser utilizado em qualquer dia para entrada
						no parque?</h5>
				</div>
				<div class="panel">
					<p>Sim, porém apenas uma vez, sendo obrigatório apresentar o
						comprovante disponibilizado no final da compra, para validar o
						ingresso.</p>
				</div>
			</div>
		</div>
	</section>

	<!--POP UP CONTATO-->
	<section>
		<div class="popup" id="popup-2">
			<div class="overlay"></div>
			<div class="content">
				<div class="close-btn" onclick="ativar2()">&times;</div>
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
								<h4>+55 4198894787</h4>
							</div>
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
								<h4>joao@diversion.com</h4>
							</div>
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
				<li>
					<button onclick="togglePopup()" class="btn-hover color-3">Perguntas
						Frequentes</button>
				</li>
				<li>
					<button onclick="ativar2()" class="btn-hover color-3">Contato</button>
			</ul>
			<p>&copy; Copyright diversiON 2021.</p>
		</footer>
	</div>
	
	
<!-- ESTA TAG SCRIPT FOI CRIADA PARA QUE QUANDO CLICAR EM "SAIR" NÃO SEJA POSSIVEL RETORNAR PARA A PÁGINA -->
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
