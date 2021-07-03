<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.diversion.model.AdministradorBEANS"%>
<%@ page import="java.util.ArrayList"%>

<%
      AdministradorBEANS admin = (AdministradorBEANS) session.getAttribute("adminDados");
%>

<%
     ArrayList<AdministradorBEANS> dadosCliente = (ArrayList<AdministradorBEANS>) request.getAttribute("listarCliente");
%>


<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Gerenciar usuário</title>

<link rel="stylesheet" href="CSS/style-gerenciar-usuario.css">


<!-- ICONE DA PÁGINA-->
<link rel="shortcut icon" href="IMG/profile.png" type="imagem/png">

<!-- FONTE OPEN SANS -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap"
	rel="stylesheet">

<!-- FRAMEWORK SWEET ALERT 2 QUE DISPONIBILIZA ALERTS COSTUMIZADOS -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>



</head>

<body>

	<!-- TOP BAR -->
	<div class="main">
		<div class="topbar">
			<a href="LogoutAdmin">Sair</a> <a
				href="JSP/diversion-admin-logado.jsp">Info Admin</a> <a>Nome de
				usuário:<%=admin.getAdminUser() %>
			</a>

		</div>
	</div>

	<!-- TABELA GERENCIAR USUÁRIOS -->
	<div>
		<div>
			<table id="table">
				<thead>
					<tr>
						<th>Id</th>
						<th>Nome do Cliente</th>
						<th>Idade</th>
						<th>Nome de usuário</th>
						<th>Email do cliente</th>
						<th>Telefone</th>
						<th>Senha</th>
						<th>Opção 1</th>
						<th>Opção 2</th>
					</tr>
				</thead>
				<tbody>
					<%
				        for (int i = 0; i < dadosCliente.size(); i++) {
		            	%>
					<tr>
						<td><%=dadosCliente.get(i).getIdClienteAdmin()%></td>
						<td><%=dadosCliente.get(i).getClienteNomeAdmin() %></td>
						<td><%=dadosCliente.get(i).getClienteIdadeAdmin() %></td>
						<td><%=dadosCliente.get(i).getClienteNomeUsuarioAdmin()  %></td>
						<td><%=dadosCliente.get(i).getClienteEmailAdmin() %></td>
						<td><%=dadosCliente.get(i).getClienteTelefoneAdmin() %></td>
						<td><%=dadosCliente.get(i).getClienteSenhaAdmin() %></td>
						<td><a href="EditarCliente?id=<%=dadosCliente.get(i).getIdClienteAdmin()%>"
						class="botao">Editar</a></td>
						<td><a href="javascript: confirmar(<%=dadosCliente.get(i).getIdClienteAdmin()%>)" 
						class="botao1">Excluir</a></td>
					</tr>
					<%
				        }
					%>
				</tbody>
			</table>
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
					<h5>Quem eu devo gerenciar?</h5>
				</div>
				<div class="panel">
					<p>Os usuários que deverão ser gerenciados são os que
						permitiram isso através de um telefonema para mudar alguma coisa.
					</p>
				</div>
				<div class="accordion">
					<div class="icon"></div>
					<h5>Posso excluir quem eu quiser?</h5>
				</div>
				<div class="panel">
					<p>Não, somente com permissão do cliente, uma vez excluído não
						sera possivel voltar atrás.</p>
				</div>
				<div class="accordion">
					<div class="icon"></div>
					<h5>Como editar dados do cliente?</h5>
				</div>
				<div class="panel">
					<p>Basta clicar em editar, localizado abaixo de opção.</p>
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
							<img src="IMG/call.png">
						</div>
						<div class="content">
							<div class="icon">
								<img src="IMG/call.png">
								<h3>Numero Contato</h3>
								<h4>+55 41984394153</h4>
								<h4>+55 4198894787</h4>
							</div>
						</div>
					</div>
					<div class="box">
						<div class="imgBx">
							<img src="IMG/email.png">
						</div>
						<div class="content">
							<div class="icon">
								<img src="IMG/email.png">
								<h3>Email</h3>
								<h4>gabriel@diversion.com</h4>
								<h4>joao@diversion.com</h4>
							</div>
						</div>
					</div>

					<div class="box">
						<div class="imgBx">
							<img src="IMG/mapa.png">
						</div>
						<div class="content">
							<div class="icon">
								<img src="IMG/mapa.png">
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

	<!-- CONFIRMADOR PARA A EXCLUSÃO DE CLIENTE -->
	<script src="JS/script-alerts.js"></script>

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
<script src="JS/script-popups.js"></script>

</body>
</html>

