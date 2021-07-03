package com.diversion.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.diversion.model.ClienteBEANS;


public class ClienteDAO {

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
			return null;
		}

	}

	public void cadastrarUsuario(ClienteBEANS usuario) {

		String cadastrar = "insert into cliente (clienteUser,clienteIdade,clienteNome,clienteEmail,clienteSenha,clientePhone)"
				+ "values(?,?,?,?,?,?)";

		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(cadastrar);

			pst.setString(1, usuario.getClienteUser());
			pst.setInt(2, usuario.getClienteIdade());
			pst.setString(3, usuario.getClienteNome());
			pst.setString(4, usuario.getClienteEmail());
			pst.setString(5, usuario.getClienteSenha());
			pst.setInt(6, usuario.getClientePhone());

			pst.executeUpdate();

			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

	}


	public ClienteBEANS loginCliente(ClienteBEANS usuario ) {

		String selecionar = "select * from cliente where clienteEmail=? and clienteSenha=?";
		ClienteBEANS cliente = null;

		try {

			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(selecionar);

			pst.setString(1, usuario.getClienteEmail());
			pst.setString(2, usuario.getClienteSenha());

			ResultSet rs = pst.executeQuery();
           
			while(rs.next()) {

				cliente = new ClienteBEANS();
				cliente.setId(rs.getLong("id"));				
				cliente.setClienteUser(rs.getString("clienteUser"));
				cliente.setClienteIdade(rs.getInt("clienteIdade"));
				cliente.setClienteNome(rs.getString("clienteNome"));
				cliente.setClienteEmail(rs.getString("clienteEmail"));
				cliente.setClienteSenha(rs.getString("clienteSenha"));
				cliente.setClientePhone(rs.getInt("clientePhone"));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
        
		return cliente;
	}
	
	
	
	
	
	
	

}
