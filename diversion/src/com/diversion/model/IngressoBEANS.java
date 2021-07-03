package com.diversion.model;

public class IngressoBEANS {

	private int pedidoTotal;

	private int quantidadeIngressoInteiro;

	private int quantidadeIngressoMeio;

	private int quantidadeSoma;

	private Long fkPedido;

	private Long fkCliente;

	private int precoTotalIngressointeiro;

	private int precoTotalIngressomeio;

	private String dataPedido;
	
	private String clienteNome;
	
		
	 


	public IngressoBEANS() {
		super();
		
	}

      
	public IngressoBEANS(int pedidoTotal, int quantidadeSoma, int precoTotalIngressointeiro, int precoTotalIngressomeio,
			String dataPedido, String clienteNome) {
		super();
		this.pedidoTotal = pedidoTotal;
		this.quantidadeSoma = quantidadeSoma;
		this.precoTotalIngressointeiro = precoTotalIngressointeiro;
		this.precoTotalIngressomeio = precoTotalIngressomeio;
		this.dataPedido = dataPedido;
		this.clienteNome = clienteNome;
	}


	public String getClienteNome() {
		return clienteNome;
	}

	public void setClienteNome(String clienteNome) {
		this.clienteNome = clienteNome;
	}

	public int getPedidoTotal() {
		return pedidoTotal;
	}

	public void setPedidoTotal(int pedidoTotal) {
		this.pedidoTotal = pedidoTotal;
	}

	public int getQuantidadeIngressoInteiro() {
		return quantidadeIngressoInteiro;
	}

	public void setQuantidadeIngressoInteiro(int quantidadeIngressoInteiro) {
		this.quantidadeIngressoInteiro = quantidadeIngressoInteiro;
	}

	public int getQuantidadeIngressoMeio() {
		return quantidadeIngressoMeio;
	}

	public void setQuantidadeIngressoMeio(int quantidadeIngressoMeio) {
		this.quantidadeIngressoMeio = quantidadeIngressoMeio;
	}

	public int getQuantidadeSoma() {
		return quantidadeSoma;
	}

	public void setQuantidadeSoma(int quantidadeSoma) {
		this.quantidadeSoma = quantidadeSoma;
	}

	 

	public Long getFkPedido() {
		return fkPedido;
	}


	public void setFkPedido(Long fkPedido) {
		this.fkPedido = fkPedido;
	}


	public Long getFkCliente() {
		return fkCliente;
	}


	public void setFkCliente(Long fkCliente) {
		this.fkCliente = fkCliente;
	}


	public int getPrecoTotalIngressointeiro() {
		return precoTotalIngressointeiro;
	}

	public void setPrecoTotalIngressointeiro(int precoTotalIngressointeiro) {
		this.precoTotalIngressointeiro = precoTotalIngressointeiro;
	}

	public int getPrecoTotalIngressomeio() {
		return precoTotalIngressomeio;
	}

	public void setPrecoTotalIngressomeio(int precoTotalIngressomeio) {
		this.precoTotalIngressomeio = precoTotalIngressomeio;
	}

	public String getDataPedido() {
		return dataPedido;
	}

	public void setDataPedido(String dataPedido) {
		this.dataPedido = dataPedido;
	}

}
