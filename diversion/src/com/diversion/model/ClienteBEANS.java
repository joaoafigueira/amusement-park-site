package com.diversion.model;

public class ClienteBEANS {

	private String clienteUser;

	private int clienteIdade;

	private String clienteEmail;

	private String clienteSenha;

	private int clientePhone;
	
	private String clienteNome;
	
    private Long id;
    
    
    
	


	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getClienteNome() {
		return clienteNome;
	}

	public void setClienteNome(String clienteNome) {
		this.clienteNome = clienteNome;
	}

	public String getClienteUser() {
		return clienteUser;
	}

	public void setClienteUser(String clienteUser) {
		this.clienteUser = clienteUser;
	}

	public int getClienteIdade() {
		return clienteIdade;
	}

	public void setClienteIdade(int clienteIdade) {
		this.clienteIdade = clienteIdade;
	}

	public String getClienteEmail() {
		return clienteEmail;
	}

	public void setClienteEmail(String clienteEmail) {
		this.clienteEmail = clienteEmail;
	}

	public String getClienteSenha() {
		return clienteSenha;
	}

	public void setClienteSenha(String clienteSenha) {
		this.clienteSenha = clienteSenha;
	}

	public int getClientePhone() {
		return clientePhone;
	}

	public void setClientePhone(int clientePhone) {
		this.clientePhone = clientePhone;
	}

}
