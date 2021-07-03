package com.diversion.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.diversion.dao.ClienteDAO;
import com.diversion.dao.IngressoDAO;
import com.diversion.model.ClienteBEANS;
import com.diversion.model.IngressoBEANS;

/**
 * Mapaeamento das urls da servlet para que possa ser possivel direcionar para os seus respectivos métodos.
 * @author João victor alves figueira 
 *
 */
@WebServlet(urlPatterns = { "/Ingresso", "/ComprarIngresso","/Historico" })
public class Ingresso extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ClienteBEANS usuario = new ClienteBEANS();

	IngressoDAO daoIngresso = new IngressoDAO();
	IngressoBEANS compra = new IngressoBEANS();

	public Ingresso() {
		super();

	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getServletPath();

		if (action.equals("/ComprarIngresso")) {
			doPost(request, response);
		}else if(action.equals("/Historico")) {
			historicoCompras(request,response);
		}

	}

	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        
		/**
		 * É utilizado o session para fazer um get do  id do cliente,
		 * este session foi inicializado em loginCliente
		 * localizado em Cliente.java
		 */
		HttpSession session = request.getSession();
		ClienteBEANS cliente = (ClienteBEANS) session.getAttribute("clienteDados");
        
				
		Long id = cliente.getId();
		int total_ing = Integer.parseInt(request.getParameter("total_ing"));
		int ing_int = Integer.parseInt(request.getParameter("ing_int"));
		int ing_meio = Integer.parseInt(request.getParameter("ing_meio"));
		String data_pedido = request.getParameter("data_pedido");
		int qtd_int = Integer.parseInt(request.getParameter("qtd_int"));
		int qtd_meio = Integer.parseInt(request.getParameter("qtd_meio"));
		int soma_qtd = Integer.parseInt(request.getParameter("soma_qtd"));

		
		/**
		 * É importante primeiro realizar a inserção na tabela pedido,
		 * para que possa ser gerado um idPedido
		 */
		compra.setDataPedido(data_pedido);
		compra.setPedidoTotal(total_ing);
		compra.setPrecoTotalIngressointeiro(ing_int);
		compra.setPrecoTotalIngressomeio(ing_meio);
		compra.setFkCliente(id);
		daoIngresso.inserirValoresIngressoPrimeiro(compra);
        
		
		/**
		 * Com o idPedido gerado resgatamos ele através do método 
		 * selecionarIdPedido, para poder inserir este id na tabela 
		 * pedidoIngresso onde contém um fk de pedido
		 */
		IngressoBEANS pedido = daoIngresso.selecionarIdPedido(compra);

		Long idPedido = pedido.getFkPedido();
        
		/**
		 * Agora com todos os dados resgatados podemos inseri-los na tabela
		 * pedidoIngresso
		 */
		compra.setQuantidadeIngressoInteiro(qtd_int);
		compra.setQuantidadeSoma(soma_qtd);
		compra.setQuantidadeIngressoMeio(qtd_meio);
		compra.setFkPedido(idPedido);
		daoIngresso.inserirValoresIngressoSegundo(compra);

	}
    
	
	protected void historicoCompras(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        
		/**
		 * É chamado novamente o id do Cliente para podermos passar como parâmetro 
		 *  na select realizada no método listarCompras, referente a página de histórico
		 *  de compras.
		 */
		HttpSession session = request.getSession();
		ClienteBEANS cliente = (ClienteBEANS) session.getAttribute("clienteDados");
        
		Long id = cliente.getId();
        
	
		compra.setFkCliente(id); 
		ArrayList<IngressoBEANS> historico = daoIngresso.listarCompras(compra);
		
		 request.setAttribute("historicoCompra",historico);
		 RequestDispatcher rd = request.getRequestDispatcher("JSP/diversion-historico-compras.jsp");
		  rd.forward(request, response);
		 
		
	}

}
