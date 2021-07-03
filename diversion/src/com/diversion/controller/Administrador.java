package com.diversion.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diversion.dao.AdministradorDAO;
import com.diversion.model.AdministradorBEANS;

/**
 * Mapaeamento das urls da servlet para que possa ser possivel direcionar para os seus respectivos métodos.
 * @author João victor alves figueira
 *
 */
@WebServlet(urlPatterns = { "/AdministratorLogin", "/LoginAdmin", "/LogoutAdmin", "/ListarCliente", "/EditarCliente",
		"/AtualizarCliente", "/DeletarCliente" })
public class Administrador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AdministradorBEANS admin = new AdministradorBEANS();
	AdministradorDAO daoAdmin = new AdministradorDAO();

	public Administrador() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getServletPath();

		if (action.equals("/LoginAdmin")) {
			loginAdmin(request, response);
		} else if (action.equals("/LogoutAdmin")) {
			logoutAdmin(request, response);
		} else if (action.equals("/ListarCliente")) {
			listarCliente(request, response);
		} else if (action.equals("/EditarCliente")) {
			editarCliente(request, response);
		} else if (action.equals("/AtualizarCliente")) {
			try {
				atualizarCliente(request, response);
			} catch (ServletException | IOException | InterruptedException e) {
				e.printStackTrace();
			}
		} else if (action.equals("/DeletarCliente")) {
			try {
				deletarCliente(request, response);
			} catch (ServletException | IOException | InterruptedException e) {
				e.printStackTrace();
			}
		}

	}

	
	
	
	/**
	 *  Estou capturando os valores do form admin login e enviando para o método loginAdmin que se encontra 
	 * na classe  AdministradorDAO, assim se os valores forem diferentes de nulo ele envia para página admin logado
	 * e abre uma sessão, para que seja possivel capturar os dados do administrador nas páginas jsp,  e se for nulo
	 *  envia para a página erro.
	 * 
	 */
	protected void loginAdmin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		admin.setAdminEmail(request.getParameter("email_admin"));
		admin.setAdminSenha(request.getParameter("senha_admin"));

		AdministradorBEANS administrador = daoAdmin.loginAdmin(admin);

		if (administrador != null) {
			HttpSession session = request.getSession();
			session.setAttribute("adminDados", administrador);
			response.sendRedirect("JSP/diversion-admin-logado.jsp");
		} else {
			response.sendRedirect("HTML/diversion-erro-login-ou-senha-invalido.html");
		}

	}
	
	
	/**
	 * Quando for clicado em sair localizado na top bar do jsp, ele envia para a 
	 * página diversion-index e encerra a sessão do administrador.
	 */

	protected void logoutAdmin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("adminDados");
		response.sendRedirect("diversion-index.html");
	}

	
	
	
	protected void listarCliente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<AdministradorBEANS> listarCliente = daoAdmin.listarClientes();
		
       
		request.setAttribute("listarCliente", listarCliente);
		RequestDispatcher rd = request.getRequestDispatcher("JSP/diversion-gerenciar-usuario.jsp");
		rd.forward(request, response);

	}

	protected void editarCliente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/**
		 * aqui é recebido o id que está sendo passado como parâmetro no botão editar,
		 * localizado na página gerenciar-usuário
		 */
		Long id = Long.parseLong(request.getParameter("id"));

		admin.setIdClienteAdmin(id);
        daoAdmin.selecionarCliente(admin);
        
        /**
         * Após o método selecionarCliente trazer os dados do cliente,
         * setamos eles nos campos da página editar-cliente,
         * através do request.setAttribute
         */
		request.setAttribute("IdClienteAdmin", admin.getIdClienteAdmin());
		request.setAttribute("ClienteNomeUsuarioAdmin", admin.getClienteNomeUsuarioAdmin());
		request.setAttribute("clienteIdadeAdmin", admin.getClienteIdadeAdmin());
        request.setAttribute("clienteNomeAdmin", admin.getClienteNomeAdmin());
		request.setAttribute("ClienteEmailAdmin", admin.getClienteEmailAdmin());
		request.setAttribute("ClienteSenhaAdmin", admin.getClienteSenhaAdmin());
		request.setAttribute("ClienteTelefoneAdmin", admin.getClienteTelefoneAdmin());

		RequestDispatcher rd = request.getRequestDispatcher("JSP/diversion-editar-cliente.jsp");
		rd.forward(request, response);

	}

	protected void atualizarCliente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, InterruptedException {

		
		
		
		admin.setClienteIdadeAdmin(Integer.parseInt(request.getParameter("idade_editar")));
		admin.setClienteNomeUsuarioAdmin(request.getParameter("nome_usuario_editar"));
		admin.setClienteNomeAdmin(request.getParameter("nome_editar"));
		admin.setClienteEmailAdmin(request.getParameter("email_editar"));
		admin.setClienteSenhaAdmin(request.getParameter("senha_editar"));
		admin.setClienteTelefoneAdmin(Integer.parseInt(request.getParameter("phone_editar")));
		admin.setIdClienteAdmin(Long.parseLong(request.getParameter("id_editar")));

		daoAdmin.atualizarCliente(admin);
		
		/**
		 * É usado o time unit para que após  o form ser editado seja possivel exibir o sweetalert, 
		 * o time unit deixa o sendRedirect  dormindo por 2 segundos e após  isso  
		 * realiza  a sua função
		 */
		TimeUnit.SECONDS.sleep(2);
		response.sendRedirect("ListarCliente");

	}

	protected void deletarCliente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, InterruptedException {
        
		/**
		 * Estamos recebendo o id do script-alerts
		 */
	    String id = request.getParameter("IdClienteAdmin");        		
		Long idCliente = Long.parseLong(id);
		 	
		 admin.setIdClienteAdmin(idCliente);	 
		 daoAdmin.DeletarCliente(admin);
		
		 TimeUnit.SECONDS.sleep(2);
		 response.sendRedirect("ListarCliente");
		 
	}

}
