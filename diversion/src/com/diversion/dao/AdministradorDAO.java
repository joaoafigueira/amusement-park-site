package com.diversion.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.diversion.model.AdministradorBEANS;

public class AdministradorDAO {

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

	public AdministradorBEANS loginAdmin(AdministradorBEANS admin) {

		String selecionar = "select * from administrador where adminEmail = ? and adminSenha = ?";

		AdministradorBEANS administrador = null;

		try {

			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(selecionar);

			pst.setString(1, admin.getAdminEmail());
			pst.setString(2, admin.getAdminSenha());

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {

				administrador = new AdministradorBEANS();
				administrador.setAdminUser(rs.getString("adminUser"));
				administrador.setAdminNome(rs.getString("adminNome"));
				administrador.setAdminEmail(rs.getString("adminEmail"));
				administrador.setAdminPhone(rs.getInt("adminSenha"));

			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return administrador;
	}

	public ArrayList<AdministradorBEANS> listarClientes() {

		ArrayList<AdministradorBEANS> cliente = new ArrayList<>();

		String selecionar = "select * from cliente order by id";

		try {

			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(selecionar);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {

				Long idClienteAdmin = rs.getLong("id");
				int clienteIdadeAdmin = rs.getInt("clienteIdade");
				String clienteNomeUsuarioAdmin = rs.getString("clienteUser");
				String clienteNomeAdmin = rs.getString("clienteNome");
				String clienteEmailAdmin = rs.getString("clienteEmail");
				String clienteSenhaAdmin = rs.getString("clienteSenha");
				int clienteTelefoneAdmin = rs.getInt("clientePhone");

				cliente.add(new AdministradorBEANS(idClienteAdmin, clienteIdadeAdmin, clienteNomeUsuarioAdmin,
						clienteNomeAdmin, clienteEmailAdmin, clienteSenhaAdmin, clienteTelefoneAdmin));

			}
			con.close();
			return cliente;

		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

	public void selecionarCliente(AdministradorBEANS admin) {

		String selecionar = "select * from cliente where id = ? ";

		try {

			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(selecionar);
			pst.setLong(1, admin.getIdClienteAdmin());

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {

				admin.setIdClienteAdmin(rs.getLong("id"));
				admin.setClienteNomeUsuarioAdmin(rs.getString("clienteUser"));
				admin.setClienteIdadeAdmin(rs.getInt("clienteIdade"));
				admin.setClienteNomeAdmin(rs.getString("clienteNome"));
				admin.setClienteEmailAdmin(rs.getString("clienteEmail"));
				admin.setClienteSenhaAdmin(rs.getString("clienteSenha"));
				admin.setClienteTelefoneAdmin(rs.getInt("clientePhone"));

			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public void atualizarCliente(AdministradorBEANS admin) {

		String atualizarCliente = "update cliente set clienteIdade=?, clienteUser=?, clienteNome=?, clienteEmail=?, clienteSenha=?, clientePhone=? where id=?";

		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(atualizarCliente);
			pst.setInt(1, admin.getClienteIdadeAdmin());
			pst.setString(2, admin.getClienteNomeUsuarioAdmin());
			pst.setString(3, admin.getClienteNomeAdmin());
			pst.setString(4, admin.getClienteEmailAdmin());
			pst.setString(5, admin.getClienteSenhaAdmin());
			pst.setInt(6, admin.getClienteTelefoneAdmin());
			pst.setLong(7, admin.getIdClienteAdmin());

			pst.executeUpdate();
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}

	public void DeletarCliente(AdministradorBEANS admin) {

		String deletar = "delete from cliente where id = ?";

		try {

			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(deletar);

			pst.setLong(1, admin.getIdClienteAdmin());

			pst.executeUpdate();

			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
