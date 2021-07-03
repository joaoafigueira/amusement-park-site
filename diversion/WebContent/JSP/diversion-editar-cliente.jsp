<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.diversion.model.AdministradorBEANS" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">

<title>Editar Cliente</title>

<link rel="stylesheet" href="CSS/style-editar-cliente.css">

 <!-- ICONE DA PÁGINA-->
<link rel="shortcut icon" href="IMG/edit.png" type="imagem/png">

  <!-- FONTE OPEN SANS -->
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet">

<!-- FRAMEWORK SWEET ALERT 2 QUE DISPONIBILIZA ALERTS COSTUMIZADOS -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>



</head>
<body>
	<div class="main">
		<div class="topbar">
			<a href="LogoutAdmin">Sair</a> 
			<a href="JSP/diversion-admin-logado.jsp">Info Admin</a>
			<a href="ListarCliente">Gerenciar usuários</a>

		</div>
	</div>
        <!--FORM EDITAR-->
	<div class="login-page">
		<div class="form">
			<form name="form_editar" class="register-form" id="form_editar" >
				<h2>Editar Cliente</h2>
				
				<input name="id_editar" type="text" id="id_usuario" readonly value="<%out.print(request.getAttribute("IdClienteAdmin"));  %>">
				
				<input name="nome_usuario_editar" id="nome_usuario" type="text" autocomplete="off"  placeholder="Nome de usuário" pattern="^[a-zA-Z_0-9]+$" title="Nome de usuário não pode conter caracteres especiais" value="<%out.print(request.getAttribute("ClienteNomeUsuarioAdmin"));  %>" autofocus>
						 
			    <input name="idade_editar" type="text" id="idade_usuario" placeholder="Idade" maxlength="2" autocomplete="off"  pattern="^[0-9]+$" title="Idade só pode conter números"  value="<%out.print(request.getAttribute("clienteIdadeAdmin"));%>"> 
								
				<input name="nome_editar" type="text" id="nome_cliente"  autocomplete="off"  placeholder="Nome completo" pattern="^([a-zA-Zà-úÀ-Ú]|\s)+$" title="Nome do cliente não pode conter números e ou caracteres especiais"   value="<%out.print(request.getAttribute("clienteNomeAdmin"));  %>" >
					
				<input name="email_editar" type="email" id="email"  autocomplete="off" placeholder="Email"  pattern="^\w*(\.\w*)?@\w*\.[a-z]+(\.[a-z]+)?$"  title="Email deve conter @ e o .com" value="<%out.print(request.getAttribute("ClienteEmailAdmin"));  %>">
			
				 <input name="senha_editar" type="password" id="senha"  autocomplete="off"  placeholder="Senha" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{9,}$"  title="Senha deve conter até 9 caracteres e deve ter como obrigatório letra minusculas ou letras maiúsculas e números"   value="<%out.print(request.getAttribute("ClienteSenhaAdmin"));  %>"> 
				 	 
				 <input name="phone_editar" type="tel" id="phone_usuario" autocomplete="off" placeholder="Telefone"  pattern="^[0-9]+$" title="Telefone só pode conter números"   value="<%out.print(request.getAttribute("ClienteTelefoneAdmin"));  %>">
					 
				<button type="submit" onclick="return validarCadastroEditar()" formaction="AtualizarCliente">Atualizar</button>
			</form>
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
                        <h5>Porque não estou conseguindo concluir a edição?</h5>
                    </div>
                        <div class="panel">
                            <p>Provalmente você está deixando algum campo em branco.  
                            </p>
                        </div>
                    <div class="accordion">
                        <div class="icon"></div>
                        <h5>Preenchi todos os dados mas não estou ainda conseguindo concluir a edição.</h5>
                    </div>
                        <div class="panel">
                            <p>Verifique se eles estão de acordo com as regras, ex: Não é possivel colocar letra em campo que deve receber somente números.   
                            </p>
                        </div>
                    <div class="accordion">
                        <div class="icon"></div>
                        <h5>É possivel gerenciar os clientes quantas vezes quiser?</h5>
                    </div>
                        <div class="panel">
                            <p>Sim, será determinado a quantidade conforme a necessidade.
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
	
	
	<!-- VALIDA OS CAMPOS DE EDITAR-->
<script src="JS/script-validar.js"></script> 


<!-- POPUPS -->
<script src="JS/script-popups.js"></script> 



</body>
</html>