package br.ufscar.dc.dsw.domain;

public class Proposta {

	//private Long id;
	private String data;
	private Float valor;
	private Veiculo veiculo;
	private Cliente cliente;
	private Loja loja;

	public Proposta (String data, Float valor, Veiculo veiculo, Cliente cliente, Loja loja) {
		//this.id = id;
		this.data = data;
		this.valor = valor;
		this.veiculo = veiculo;
		this.cliente = cliente;
		this.loja = loja;
	}

	//public Long getId() {
		//return id;
	//}

	//public void setId(Long id) {
		//this.id = id;
	//}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public Float getValor() {
		return valor;
	}

	public void setValor(Float valor) {
		this.valor = valor;
	}

	public Veiculo getVeiculo() {
		return veiculo;
	}

	public void setVeiculo(Veiculo veiculo) {
		this.veiculo = veiculo;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Loja getLoja() {
		return loja;
	}

	public void setLoja(Loja loja) {
		this.loja = loja;
	}	
}