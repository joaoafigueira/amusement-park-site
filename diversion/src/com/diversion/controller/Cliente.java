package com.diversion.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diversion.dao.ClienteDAO;
import com.diversion.model.ClienteBEANS;


/**
 * Mapaeamento das urls da servlet para que possa ser possivel direcionar para os seus respectivos métodos.
 * @author João victor alves figueira
 *
 */
@WebServlet(urlPatterns= {"/UserLogin", "/Cadastrar","/Login","/Logout"})
public class Cliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ClienteDAO dao = new ClienteDAO();
	ClienteBEANS usuario = new 	ClienteBEANS();

	public Cliente() {
		super();

	}
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       
		String action = request.getServletPath();
		
		if(action.equals("/Cadastrar")) {
			novoCadastro(request,response);
		}else if(action.equals("/Login")) {
			loginCliente(request,response);
		}else if(action.equals("/Logout")) {
			logout(request,response);
		}

	}
	
	/**
	 * Estou capturando os valores do form cadastro e enviando para o método cadastrarUsuario
	 * que encontra na classe ClientDAO, assim será somente  possivel inserir esses dados no banco 
	 * se  o cliente possuir idade igual ou maior que 18 anos.
	 * 
	 */
	protected void novoCadastro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		String clienteUser = request.getParameter("nome_usuario_cadastrar");
		int clienteIdade = Integer.parseInt(request.getParameter("idade_cadastrar"));
		String clienteNome = request.getParameter("nome_cadastrar");
		String clienteEmail = request.getParameter("email_cadastrar");
		String clienteSenha = request.getParameter("senha_cadastrar");
		int clientePhone = Integer.parseInt(request.getParameter("phone_cadastrar"));
		
		if(clienteIdade>=18) {			
			usuario.setClienteUser(clienteUser);
			usuario.setClienteIdade(clienteIdade);
			usuario.setClienteNome(clienteNome);
			usuario.setClienteEmail(clienteEmail);
			usuario.setClienteSenha(clienteSenha);
			usuario.setClientePhone(clientePhone);
			
			dao.cadastrarUsuario(usuario);
			response.sendRedirect("HTML/diversion-login.html");
		}else {
			response.sendRedirect("HTML/diversion-erro-usuario-nao-cadastrado.html");
		}
		
		
	}
	
	/**
	 * Estou capturando os valores do form login e enviando para o método loginCliente que se encontra 
	 * na classe  ClientDAO, assim se os valores forem diferentes de nulo ele envia para página usuario logado
	 * e abre uma sessão , para que seja possivel capturar os dados do cliente no jsp,  e se for nulo
	 *  envia para a página erro.
	 *
	 */
	protected void loginCliente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		 
		String clienteEmail = request.getParameter("email_login");	
		String clienteSenha = request.getParameter("senha_login");
		
		usuario.setClienteEmail(clienteEmail);
		usuario.setClienteSenha(clienteSenha);
		
		
		ClienteBEANS cliente = dao.loginCliente(usuario);
		
		
		if(cliente !=null) {		
			HttpSession session = request.getSession();
			session.setAttribute("clienteDados", cliente);
			response.sendRedirect("JSP/diversion-usuario-logado.jsp");
		}else {
			response.sendRedirect("HTML/diversion-erro-login-ou-senha-invalido.html");
		}
	}
	
	/**
	 * Quando for clicado em sair localizado na top bar do jsp, ele envia para a página diversion-index e encerra a sessão
	 * do cliente.
	 */
	protected void logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		HttpSession session = request.getSession();
		session.removeAttribute("clienteDados");
		response.sendRedirect("diversion-index.html");
	}
		 
	

}
