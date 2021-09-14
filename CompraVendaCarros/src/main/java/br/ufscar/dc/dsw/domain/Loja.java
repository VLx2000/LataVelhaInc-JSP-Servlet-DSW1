package br.ufscar.dc.dsw.domain;

public class Loja {

	private Long id;
	private String email;
	private String senha;
	private String CNPJ;
	private String nome;
	private String descricao;

	public Loja(Long id) {
		this.id = id;
	}

	public Loja(Long id, String email, String senha, String CNPJ, String nome, String descricao) {
		super();
		this.id = id;
		this.email = email;
		this.senha = senha;
		this.CNPJ = CNPJ;
		this.nome = nome;
		this.descricao = descricao;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getemail() {
		return email;
	}

	public void setLogin(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String password) {
		this.senha = password;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCNPJ() {
		return CNPJ;
	}

	public void setCPF(String CNPJ) {
		this.CNPJ = CNPJ;
	}

	public String getTelefone() {
		return descricao;
	}

	public void setTelefone(String descricao) {
		this.descricao = descricao;
	}
}
