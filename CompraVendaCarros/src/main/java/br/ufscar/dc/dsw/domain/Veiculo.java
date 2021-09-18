package br.ufscar.dc.dsw.domain;

public class Veiculo {

    private Long id;
    private String placa;
    private String modelo;
    private String chassi;
    private Integer ano;
    private Integer quilometragem;
    private String descricao;
    private Float valor;
    private Long id_loja;
    
    public Veiculo(Long id) {
    	this.id = id;
    }
    public Veiculo(String placa, String modelo, String chassi, Integer ano, Integer quilometragem, String descricao, Float valor, Long id_loja) {
    	this.placa = placa;
        this.modelo = modelo;
        this.chassi = chassi;
        this.ano = ano;
        this.quilometragem = quilometragem;
        this.descricao = descricao;
        this.valor = valor;
        this.id_loja = id_loja;
    }

    public Veiculo(Long id, String placa, String modelo, String chassi, Integer ano, Integer quilometragem, String descricao, Float valor, Long id_loja) {
        this.id = id;
    	this.placa = placa;
        this.modelo = modelo;
        this.chassi = chassi;
        this.ano = ano;
        this.quilometragem = quilometragem;
        this.descricao = descricao;
        this.valor = valor;
        this.id_loja = id_loja;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getChassi() {
        return chassi;
    }

    public void setChassi(String chassi) {
        this.chassi = chassi;
    }

    public Integer getAno() {
        return ano;
    }

    public void setAno(Integer ano) {
        this.ano = ano;
    }

    public Integer getQuilometragem() {
        return quilometragem;
    }

    public void setQuilometragem(Integer quilometragem) {
        this.quilometragem = quilometragem;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Float getValor() {
        return valor;
    }

    public void setValor(Float valor) {
        this.valor = valor;
    }

    public Long getId_loja() {
        return id_loja;
    }

    public void setId_loja(Long id_loja) {
        this.id_loja = id_loja;
    }


    @Override
    public String toString() {
    	return modelo + ", " + chassi + "(" + quilometragem + ")"; 
    }
}
