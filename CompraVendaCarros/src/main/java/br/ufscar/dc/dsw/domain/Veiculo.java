package br.ufscar.dc.dsw.domain;

public class Veiculo {

    private Loja loja;
    private String placa;
    private String modelo;
    private String chassi;
    private Integer ano;
    private Float quilometragem;
    private String descricao;
    private Float valor;
    private byte[] imagens;

    public Veiculo(String placa, String modelo, String chassi, Integer ano, Float quilometragem, String descricao, Float valor, byte[] imagens, Loja loja) {
        this.placa = placa;
        this.modelo = modelo;
        this.chassi = chassi;
        this.ano = ano;
        this.quilometragem = quilometragem;
        this.descricao = descricao;
        this.valor = valor;
        this.imagens = imagens;
        this.loja = loja;
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

    public Float getQuilometragem() {
        return quilometragem;
    }

    public void setQuilometragem(Float quilometragem) {
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

    public Loja getLojaCNPJ() {
        return loja;
    }

    public void setLoja(Loja loja) {
        this.loja = loja;
    }

    public byte[] getImagens() {
        return imagens;
    }

    public void setImagens(byte[] imagens) {
        this.imagens = imagens;
    }
    
    @Override
    public String toString() {
    	return modelo + ", " + chassi + "(" + quilometragem + ")"; 
    }
}
