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

<title>Comprar Ingressos</title>

<link rel="stylesheet" href="../CSS/style-comprar-ingressos.css">
 
 <!-- ICONE DA PÁGINA--> 
<link rel="shortcut icon" href="../IMG/comp.png" type="imagem/png">
    
    
<!-- FONTE OPEN SANS --> 
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700&display=swap" rel="stylesheet">
 
<!-- FRAMEWORK JQUERY UTILIZADO NO SCRIPT CARRINHO DE COMPRAS-->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<!-- REALIZA AS OPERAÇÕES MATEMÁTICAS NO CARRINHO DE COMPRAS-->
<script src="../JS/script-carrinho-compras.js"></script>
  
</head>
<body>
 
    <div class="main">
        <div class="topbar">
            <a href="../Logout">Sair</a>  
            <a href="diversion-usuario-logado.jsp">Info Usuário</a>
            <a href="../Historico">Histórico de Compras</a> 
            <a>Nome do usuário: 
             <%=cliente.getClienteUser() %>
            </a> 
         </div>
    </div>

<!-- CARRINHO DE COMPRAS -->
<header id="site-header">
        <div class="container">
            <h1>Carrinho de Compras</h1>
        </div>
    </header>
    <div class="container">
        <section id="cart">   
            <article class="product">
                <header>
                    <a class="remove">
                     <img src="../IMG/ticket1.jpg">
           
                    </a>
                </header>
                <div class="content">
                    <h1>Ingresso Inteiro</h1>
                    Este ingresso individualmente custa R$ 100 reais.
                    <div style="top: 0" class="color yellow">
                     
                    </div>
                    <div style="top: 43px" class="type small">
                    </div>

                </div>
                <footer class="content">
                    <span class="qt-minus">-</span>
                    <span class="qt1">0</span>
                    <span class="qt-plus">+</span>
                    <h2 class="full-price1">0</h2>
                    <h2 class="price1">100.00</h2>
                </footer>
            </article>
            <article class="product">
                <header>
                    <a class="remove">
                        <img src="../IMG/ticket1.jpg" alt="">
                     
                    </a>
                </header>
                <div class="content">
                    <h1>Ingresso Meia</h1>
                    Este ingresso individualmente custa R$ 50 reais.
                    <div style="top: 0" class="color red">
                     
                    </div>
                    <div style="top: 43px" class="type small">
                    </div>
                </div>
                <footer class="content">
                    <span class="qt-minus">-</span>
                    <span class="qt">0</span>
                    <span class="qt-plus">+</span>
                    <h2 class="full-price">0</h2>
                    <h2 class="price"> 50.00</h2>
                </footer>
            </article>

        </section>
    </div>
    
    <footer id="site-footer">
        <div class="container clearfix">
            <div class="left">
                <h2 class="subtotal">Subtotal: R$ <span>0.00</span></h2>
                
                
            </div>
            <div class="right">
                <h1 class="total">Total: R$ <span>0.00</span></h1>
                <a href="diversion-pagamento.jsp"   type="button" class="btn">Finalizar compra</a>
            </div>
        </div>
    </footer>
      
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
                        <h5>É possivel comprar quantos ingressos quiser?</h5>
                    </div>
                        <div class="panel">
                            <p>Sim, varia de acordo a necessidade   
                            </p>
                        </div>
                    <div class="accordion">
                        <div class="icon"></div>
                        <h5>Qual a forma de pagamento aceitada?</h5>
                    </div>
                        <div class="panel">
                            <p>Somente pagamento online, aceitamos todos os tipos de cartões.
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
<script src="../JS/script-popups.js"></script>



</body>
</html>

