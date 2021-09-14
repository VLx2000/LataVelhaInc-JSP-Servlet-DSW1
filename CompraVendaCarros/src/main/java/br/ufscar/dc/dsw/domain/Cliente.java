package br.ufscar.dc.dsw.domain;

import java.sql.Date;

public class Cliente {

	private Long id;
	private String email;
	private String senha;
	private String CPF;
	private String nome;
	private String telefone;
	private String sexo;
	private Date nascimento;

	public Cliente(Long id) {
		this.id = id;
	}

	public Cliente(Long id, String email, String senha, String CPF, String nome, String telefone, String sexo, Date nascimento) {
		super();
		this.id = id;
		this.email = email;
		this.senha = senha;
		this.CPF = CPF;
		this.nome = nome;
		this.telefone = telefone;
		this.sexo = sexo;
		this.nascimento = nascimento;
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

	public String getCPF() {
		return CPF;
	}

	public void setCPF(String CPF) {
		this.CPF = CPF;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo= sexo;
	}

	public Date getNascimento() {
		return nascimento;
	}

	public void setNascimento(Date nascimento) {
		this.nascimento = nascimento;
	}
}
