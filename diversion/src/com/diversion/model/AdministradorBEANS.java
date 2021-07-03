package com.diversion.model;

public class AdministradorBEANS {

	private String adminEmail;

	private String adminSenha;

	private String adminUser;

	private int adminPhone;

	private String adminNome;
    
	
	/**
	 * Aqui é atribuido as variaveis para cliente
	 * para que possa ser possivel editar e excluir
	 */
	private Long idClienteAdmin;

	private String clienteNomeUsuarioAdmin;
	
	private String clienteNomeAdmin;
	
	private String clienteEmailAdmin;
	
	private String clienteSenhaAdmin;
	
	private int clienteTelefoneAdmin;
	
	private int clienteIdadeAdmin;
	
	
	
	
	public AdministradorBEANS() {
		super();

	}
	
	
    

    
	
	public AdministradorBEANS(Long idClienteAdmin, int clienteIdadeAdmin, String clienteNomeUsuarioAdmin, String clienteNomeAdmin,
			String clienteEmailAdmin, String clienteSenhaAdmin, int clienteTelefoneAdmin) {
		super();
		this.idClienteAdmin = idClienteAdmin;
		this.clienteIdadeAdmin = clienteIdadeAdmin;
		this.clienteNomeUsuarioAdmin = clienteNomeUsuarioAdmin;
		this.clienteNomeAdmin = clienteNomeAdmin;
		this.clienteEmailAdmin = clienteEmailAdmin;
		this.clienteSenhaAdmin = clienteSenhaAdmin;
		this.clienteTelefoneAdmin = clienteTelefoneAdmin;
		
	}






	public int getClienteIdadeAdmin() {
		return clienteIdadeAdmin;
	}



	public void setClienteIdadeAdmin(int clienteIdadeAdmin) {
		this.clienteIdadeAdmin = clienteIdadeAdmin;
	}



	public Long getIdClienteAdmin() {
		return idClienteAdmin;
	}



	public void setIdClienteAdmin(Long idClienteAdmin) {
		this.idClienteAdmin = idClienteAdmin;
	}



	public String getClienteNomeUsuarioAdmin() {
		return clienteNomeUsuarioAdmin;
	}

	public void setClienteNomeUsuarioAdmin(String clienteNomeUsuarioAdmin) {
		this.clienteNomeUsuarioAdmin = clienteNomeUsuarioAdmin;
	}

	public String getClienteNomeAdmin() {
		return clienteNomeAdmin;
	}

	public void setClienteNomeAdmin(String clienteNomeAdmin) {
		this.clienteNomeAdmin = clienteNomeAdmin;
	}

	public String getClienteEmailAdmin() {
		return clienteEmailAdmin;
	}

	public void setClienteEmailAdmin(String clienteEmailAdmin) {
		this.clienteEmailAdmin = clienteEmailAdmin;
	}

	public String getClienteSenhaAdmin() {
		return clienteSenhaAdmin;
	}

	public void setClienteSenhaAdmin(String clienteSenhaAdmin) {
		this.clienteSenhaAdmin = clienteSenhaAdmin;
	}

	

	

	public int getClienteTelefoneAdmin() {
		return clienteTelefoneAdmin;
	}



	public void setClienteTelefoneAdmin(int clienteTelefoneAdmin) {
		this.clienteTelefoneAdmin = clienteTelefoneAdmin;
	}



	public String getAdminEmail() {
		return adminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}

	public String getAdminSenha() {
		return adminSenha;
	}

	public void setAdminSenha(String adminSenha) {
		this.adminSenha = adminSenha;
	}

	public String getAdminUser() {
		return adminUser;
	}

	public void setAdminUser(String adminUser) {
		this.adminUser = adminUser;
	}

	public int getAdminPhone() {
		return adminPhone;
	}

	public void setAdminPhone(int adminPhone) {
		this.adminPhone = adminPhone;
	}

	public String getAdminNome() {
		return adminNome;
	}

	public void setAdminNome(String adminNome) {
		this.adminNome = adminNome;
	}

}
