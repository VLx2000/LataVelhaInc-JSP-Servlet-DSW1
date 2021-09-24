package br.ufscar.dc.dsw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.dsw.domain.Proposta;
import br.ufscar.dc.dsw.domain.Veiculo;
import br.ufscar.dc.dsw.domain.Cliente;
import br.ufscar.dc.dsw.domain.Loja;
/*
import br.ufscar.dc.dsw.dao.LojaDAO;
import br.ufscar.dc.dsw.dao.ClienteDAO;
import br.ufscar.dc.dsw.dao.VeiculoDAO;
*/
public class PropostaDAO extends GenericDAO {

    public void insert(Proposta proposta) {

        String sql = "INSERT INTO Proposta (id_cliente, id_loja, id_veiculo, valor, data_p, estado) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);;

            statement = conn.prepareStatement(sql);
            statement.setLong(1, proposta.getCliente().getId());
            statement.setLong(2, proposta.getLoja().getId());
            statement.setLong(3, proposta.getVeiculo().getId());
            statement.setFloat(4, proposta.getValor());
            statement.setString(5, proposta.getData());
            statement.setString(6, proposta.getEstado());

            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Proposta> getAll() {   
        List<Proposta> listaPropostas = new ArrayList<>();
        String sql = "SELECT * from Proposta p, Cliente c,Veiculo v, Loja l where p.id_loja = l.id "
        		+ "and p.id_veiculo = v.id and p.id_cliente = c. id order by v.id";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                String estado = resultSet.getString("estado");
                String data_p = resultSet.getString("data_p");
                Float valor = resultSet.getFloat("p.valor");
               
            	Long id_veiculo =  resultSet.getLong("id_veiculo");
                String placa = resultSet.getString("placa");
                String modelo = resultSet.getString("modelo");
                String chassi = resultSet.getString("chassi");
                Integer ano = resultSet.getInt("ano");
                Integer quilometragem = resultSet.getInt("quilometragem");
                String veiculo_descricao = resultSet.getString("v.descricao");
                float veiculo_valor = resultSet.getFloat("v.valor");
                
                Long lojaId = resultSet.getLong("id_loja");
    			String loja_email = resultSet.getString("l.email");
				String loja_senha = resultSet.getString("l.senha");
				String loja_nome = resultSet.getString("l.nome");
				String cnpj = resultSet.getString("CNPJ");
				String descricao_loja = resultSet.getString("l.descricao");
				
				Long id_cliente = resultSet.getLong("id_cliente");
    			String cliente_email = resultSet.getString("c.email");
				String cliente_senha = resultSet.getString("c.senha");
				String cliente_nome = resultSet.getString("l.nome");
				String cpf = resultSet.getString("cpf");
				String telefone = resultSet.getString("telefone");
				String sexo = resultSet.getString("sexo");
				String nascimento = resultSet.getString("nascimento");
				String papel = resultSet.getString("papel");

				Loja loja = new Loja(lojaId,loja_email,loja_senha,cnpj,loja_nome,descricao_loja);
                Cliente cliente = new Cliente(id_cliente,cliente_email,cliente_senha,cpf,cliente_nome,telefone,sexo,nascimento,papel);   
                Veiculo veiculo = new Veiculo(id_veiculo,placa,modelo,chassi,ano,quilometragem,veiculo_descricao,veiculo_valor,loja);
                Proposta proposta = new Proposta(estado, data_p, valor, veiculo, cliente, loja);
                listaPropostas.add(proposta);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaPropostas;
    }
    
    public List<Proposta> getAllbyCliente(Long id_cliente) {

        List<Proposta> listaPropostas = new ArrayList<>();

        String sql = "SELECT * from Proposta p,Loja l, Cliente c,Veiculo v where p.id_cliente = ? "
        		+ "and p.id_cliente = c.id order by p.id_loja";

        try {
        	Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setLong(1, id_cliente);
            ResultSet resultSet = statement.executeQuery(); 
            
            while (resultSet.next()) {
                
                String estado = resultSet.getString("estado");
                String data_p = resultSet.getString("data_p");
                Float valor = resultSet.getFloat("p.valor");
               
            	Long id_veiculo =  resultSet.getLong("id_veiculo");
                String placa = resultSet.getString("placa");
                String modelo = resultSet.getString("modelo");
                String chassi = resultSet.getString("chassi");
                Integer ano = resultSet.getInt("ano");
                Integer quilometragem = resultSet.getInt("quilometragem");
                String veiculo_descricao = resultSet.getString("v.descricao");
                float veiculo_valor = resultSet.getFloat("v.valor");
                
                Long lojaId = resultSet.getLong("id_loja");
    			String loja_email = resultSet.getString("l.email");
				String loja_senha = resultSet.getString("l.senha");
				String loja_nome = resultSet.getString("l.nome");
				String cnpj = resultSet.getString("CNPJ");
				String descricao_loja = resultSet.getString("l.descricao");
				
    			String cliente_email = resultSet.getString("c.email");
				String cliente_senha = resultSet.getString("c.senha");
				String cliente_nome = resultSet.getString("l.nome");
				String cpf = resultSet.getString("cpf");
				String telefone = resultSet.getString("telefone");
				String sexo = resultSet.getString("sexo");
				String nascimento = resultSet.getString("nascimento");
				String papel = resultSet.getString("papel");

				Loja loja = new Loja(lojaId,loja_email,loja_senha,cnpj,loja_nome,descricao_loja);
                Cliente cliente = new Cliente(id_cliente,cliente_email,cliente_senha,cpf,cliente_nome,telefone,sexo,nascimento,papel);   
                Veiculo veiculo = new Veiculo(id_veiculo,placa,modelo,chassi,ano,quilometragem,veiculo_descricao,veiculo_valor,loja);
                Proposta proposta = new Proposta(estado, data_p, valor, veiculo, cliente, loja);
                listaPropostas.add(proposta);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaPropostas;
    }

    
    public List<Proposta> getAllbyLoja(Long id_loja) {

        List<Proposta> listaPropostas = new ArrayList<>();

        String sql = "SELECT * from Proposta p,Loja l, Cliente c, Veiculo v where p.id_loja = ? "
        		+ "and p.id_loja = l.id order by p.id_veiculo";

        try {
        	Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setLong(1, id_loja);
            ResultSet resultSet = statement.executeQuery(); 
            
            while (resultSet.next()) {

                String estado = resultSet.getString("estado");
                String data_p = resultSet.getString("data_p");
                Float valor = resultSet.getFloat("valor");
               
            	Long id_veiculo =  resultSet.getLong("id_veiculo");
                String placa = resultSet.getString("placa");
                String modelo = resultSet.getString("modelo");
                String chassi = resultSet.getString("chassi");
                Integer ano = resultSet.getInt("ano");
                Integer quilometragem = resultSet.getInt("quilometragem");
                String veiculo_descricao = resultSet.getString("v.descricao");
                float veiculo_valor = resultSet.getFloat("v.valor");
                
                Long lojaId = resultSet.getLong("id_loja");
    			String loja_email = resultSet.getString("l.email");
				String loja_senha = resultSet.getString("l.senha");
				String loja_nome = resultSet.getString("l.nome");
				String cnpj = resultSet.getString("CNPJ");
				String descricao_loja = resultSet.getString("descricao");
				
				Long id_cliente = resultSet.getLong("id_cliente");
    			String cliente_email = resultSet.getString("c.email");
				String cliente_senha = resultSet.getString("c.senha");
				String cliente_nome = resultSet.getString("l.nome");
				String cpf = resultSet.getString("cpf");
				String telefone = resultSet.getString("telefone");
				String sexo = resultSet.getString("sexo");
				String nascimento = resultSet.getString("nascimento");
				String papel = resultSet.getString("papel");

				Loja loja = new Loja(lojaId,loja_email,loja_senha,cnpj,loja_nome,descricao_loja);
                Cliente cliente = new Cliente(id_cliente,cliente_email,cliente_senha,cpf,cliente_nome,telefone,sexo,nascimento,papel);   
                Veiculo veiculo = new Veiculo(id_veiculo,placa,modelo,chassi,ano,quilometragem,veiculo_descricao,veiculo_valor,loja);
                Proposta proposta = new Proposta(estado, data_p, valor, veiculo, cliente, loja);
                listaPropostas.add(proposta);
            }

            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaPropostas;
    }
	public void delete(Proposta proposta) {
        String sql = "DELETE FROM proposta where (id_cliente,id_loja,id_veiculo) = (?,?,?)";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);

            statement.setLong(1, proposta.getCliente().getId());
            statement.setLong(2, proposta.getLoja().getId());
            statement.setLong(3, proposta.getVeiculo().getId());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
	
	  public void update(Proposta proposta) {
	        String sql = "UPDATE Veiculo SET valor = ?, data_p = ? WHERE (id_cliente,id_loja,id_veiculo) = (?,?,?)";
	    
	        try {
	            Connection conn = this.getConnection();
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setFloat(1, proposta.getValor());
	            statement.setString(2, proposta.getData());
	            statement.setLong(3,proposta.getCliente().getId());
	            statement.setLong(4,proposta.getLoja().getId());
	            statement.setLong(5, proposta.getVeiculo().getId());
                statement.setString(6, proposta.getEstado());
	            statement.executeUpdate();
	            statement.close();
	            conn.close();
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        }
	    }
	  public Proposta getByIds(Long id_cliente, Long id_loja,Long id_veiculo) {
		  	Proposta proposta = null;
	        String sql = "SELECT * from Proposta p WHERE p.id_clinete = ? and p.id_loja =? and p.id_veiculo = ?"; 
	        try {
	            Connection conn = this.getConnection();
	            PreparedStatement statement = conn.prepareStatement(sql);
	            statement.setLong(1, id_cliente);
	            statement.setLong(2,id_loja);
	            statement.setLong(3,id_veiculo);
	            ResultSet resultSet = statement.executeQuery();
	            if (resultSet.next()) {
	            	Float valor = resultSet.getFloat("valor");
	            	String data_p = resultSet.getString("data_p");
                    String estado = resultSet.getString("estado");
	            		
	            	Cliente cliente = new ClienteDAO().getbyId(id_cliente);
	                Loja loja = new LojaDAO().getById(id_loja);
	                Veiculo veiculo = new VeiculoDAO().getById(id_veiculo);
	                proposta = new Proposta(estado, data_p, valor, veiculo,cliente,loja);
	            }
	            resultSet.close();
	            statement.close();
	            conn.close();
	        } catch (SQLException e) {
	            throw new RuntimeException(e);
	        }
	        return proposta;
	    }
}

