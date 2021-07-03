package com.diversion.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.diversion.model.ClienteBEANS;
import com.diversion.model.IngressoBEANS;

public class IngressoDAO {

	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/dbdiversion?useTimezone=true&serverTimezone=UTC";
	private String user = "root";
	private String password = "admin";

	public Connection conectar() {
		Connection con = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public void inserirValoresIngressoPrimeiro(IngressoBEANS compra) {

		String comprar = "insert into pedido (dataPedido,pedidoTotal,precoTotalIngressointeiro,precoTotalIngressomeio,idCliente) values (?,?,?,?,?)";

		try {
			Connection con = conectar();

			PreparedStatement pst = con.prepareStatement(comprar);

			pst.setString(1, compra.getDataPedido());
			pst.setInt(2, compra.getPedidoTotal());
			pst.setInt(3, compra.getPrecoTotalIngressointeiro());
			pst.setInt(4, compra.getPrecoTotalIngressomeio());
			pst.setLong(5, compra.getFkCliente());

			pst.executeUpdate();

			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public IngressoBEANS selecionarIdPedido(IngressoBEANS compra) {

		IngressoBEANS pedido = null;

		String selecionarId = "select id from pedido where id = (select max(id) from pedido)";

		try {

			Connection con = conectar();

			PreparedStatement pst = con.prepareStatement(selecionarId);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {

				pedido = new IngressoBEANS();
				pedido.setFkPedido(rs.getLong("id"));
			}
			con.close();
		} catch (Exception e) {

			System.out.println(e);

		}
		return pedido;

	}

	public void inserirValoresIngressoSegundo(IngressoBEANS compra) {

		String comprar = "insert into pedidoIngresso(quantidadeIngressoInteiro,quantidadeSoma,quantidadeIngressoMeio,idPedido) values (?,?,?,?)";

		try {

			Connection con = conectar();

			PreparedStatement pst = con.prepareStatement(comprar);

			pst.setInt(1, compra.getQuantidadeIngressoInteiro());
			pst.setInt(2, compra.getQuantidadeSoma());
			pst.setInt(3, compra.getQuantidadeIngressoMeio());
			pst.setLong(4, compra.getFkPedido());

			pst.executeUpdate();

			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public ArrayList<IngressoBEANS> listarCompras(IngressoBEANS compra) {

		ArrayList<IngressoBEANS> historico = new ArrayList<>();

		String historicoCompra = "select  P.dataPedido, C.clienteNome,PI.quantidadeSoma, P.precoTotalIngressointeiro, P.precoTotalIngressomeio, P.pedidoTotal\r\n"
				+ "FROM cliente C\r\n" + "INNER JOIN pedido P\r\n" + "ON C.id = P.idCliente\r\n"
				+ "INNER JOIN pedidoIngresso PI\r\n" + "ON PI.idPedido = P.id\r\n" + "Where C.id = ?\r\n"
				+ "order by P.dataPedido;";

		try {

			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(historicoCompra);

			pst.setLong(1, compra.getFkCliente());

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {

				String dataPedido = rs.getString(1);
				String clienteNome = rs.getString(2);
				int quantidadeSoma = rs.getInt(3);
				int precoTotalIngressointeiro = rs.getInt(4);
				int precoTotalIngressomeio = rs.getInt(5);
				int pedidoTotal = rs.getInt(6);

				System.out.println(dataPedido);
				System.out.println(clienteNome);

				historico.add(new IngressoBEANS(pedidoTotal, quantidadeSoma, precoTotalIngressointeiro,
						precoTotalIngressomeio, dataPedido, clienteNome));
			}
			con.close();
			return historico;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

}
