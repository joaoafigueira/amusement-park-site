<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.diversion.model.ClienteBEANS" %>	

<%@ page import="com.diversion.model.IngressoBEANS" %>	
<%@ page import="java.util.ArrayList"%>
<%
    ClienteBEANS cliente = (ClienteBEANS) session.getAttribute("clienteDados");
%>

<%
	ArrayList<IngressoBEANS> historico = (ArrayList<IngressoBEANS>) request.getAttribute("historicoCompra");
%>



	
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">

<title>Histórico de compras</title>


<link rel="stylesheet" href="CSS/style-historico-compras.css">

<!-- ICONE DA PÁGINA-->
<link rel="shortcut icon" href="IMG/bag.png" type="imagem/png">

<!-- FONTE OPEN SANS -->
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet">



</head>
<body>

  <!-- TOP BAR -->
	<div class="main">
		<div class="topbar">
			<a href="Logout">Sair</a> 
			<a href="JSP/diversion-usuario-logado.jsp">Info Usuário</a> 
			<a href="JSP/diversion-comprar-ingressos.jsp">Comprar Ingressos</a> 
			<a>Nome de usuário:
			 <%=cliente.getClienteUser() %>
			 </a>

		</div>
	</div>
	
	<!-- TABELA MINHAS COMPRAS -->
	<table id="table">
		<thead>
			<tr>
			    <th>Data de compra</th>
				<th>Nome do Cliente</th>
				<th>Quantidade total</th>
				<th>Ingressos inteiros </th>
				<th>Ingressos meios </th>
				<th>Total da compra</th>


			</tr>
		</thead>
		<tbody>
			<%
				for (int i = 0; i < historico.size(); i++) {
			%>
			<tr>
			    <td><%=historico.get(i).getDataPedido() %></td>	    
				<td><%=historico.get(i).getClienteNome() %></td>
	            <td><%=historico.get(i).getQuantidadeSoma() %></td>
				<td>R$<%=historico.get(i).getPrecoTotalIngressointeiro() %></td>
				<td>R$<%=historico.get(i).getPrecoTotalIngressomeio()  %></td>
				<td>R$<%=historico.get(i).getPedidoTotal() %></td>
			</tr>
	      	<%
				}
			%>
		</tbody>

	</table>
    

      
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
                        <h5>Qual horario de funcionamento para a compra de ingresso?</h5>
                    </div>
                        <div class="panel">
                            <p>O parque fica aberto de Terça-feira a Sábado, das 9 da manhã até 18 da tarde.     
                            </p>
                        </div>
                    <div class="accordion">
                        <div class="icon"></div>
                        <h5>O parque permanece aberto em feriados?</h5>
                    </div>
                        <div class="panel">
                            <p>Sim, o parque permanece aberto em dias de feriado     
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
                                <img src="IMG/call.png">
                            </div>
                            <div class="content">
                            <div class="icon">
                            <img src="IMG/call.png"> 
                            <h3>Numero Contato</h3>   
                            <h4>+55 41984394153</h4> 
                            <h4>+55 4198894787</h4></div>
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
                                    <h4>joao@diversion.com</h4> </div>
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
				 <li> <button onclick="togglePopup()" class="btn-hover color-3">Perguntas Frequentes</button></li>
                <li> <button onclick="ativar2()" class="btn-hover color-3">Contato</button>
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
<script src="JS/script-popups.js"></script>


</body>
</html>

