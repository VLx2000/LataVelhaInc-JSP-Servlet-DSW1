package br.ufscar.dc.dsw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.dsw.domain.Veiculo;

public class VeiculoDAO extends GenericDAO {

    public void insert(Veiculo veiculo) {    
        String sql = "INSERT INTO Veiculo (placa, modelo, chassi, ano, quilometragem, descricao, valor, id_loja) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);;    
            statement = conn.prepareStatement(sql);
            statement.setString(1, veiculo.getPlaca());
            statement.setString(2, veiculo.getModelo());
            statement.setString(3, veiculo.getChassi());
            statement.setInt(4, veiculo.getAno());
            statement.setInt(5, veiculo.getQuilometragem());
            statement.setString(6, veiculo.getDescricao());
            statement.setFloat(7, veiculo.getValor());
            statement.setLong(8, veiculo.getId_loja());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public List<Veiculo> getAll() {   
        List<Veiculo> listaVeiculos = new ArrayList<>();
        String sql = "SELECT * from Veiculo";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
            	Long id =  resultSet.getLong("id");
                String placa = resultSet.getString("placa");
                String modelo = resultSet.getString("modelo");
                String chassi = resultSet.getString("chassi");
                Integer ano = resultSet.getInt("ano");
                Integer quilometragem = resultSet.getInt("quilometragem");
                String descricao = resultSet.getString("descricao");
                float valor = resultSet.getFloat("valor");
                Long id_loja = resultSet.getLong("id_loja");

                //Boolean admin = resultSet.getBoolean("admin");
                Veiculo veiculo = new Veiculo(id,placa,modelo,chassi,ano,quilometragem,descricao,valor,id_loja);
                listaVeiculos.add(veiculo);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaVeiculos;
    }
    
    public void delete(Veiculo veiculo) {
        String sql = "DELETE FROM Veiculo where id = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(1, veiculo.getId());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
        }
    }
    
    public void update(Veiculo veiculo) {
        String sql = "UPDATE Veiculo SET placa = ?, modelo = ?, chassi = ?, ano = ?, quilometragem = ?, descricao = ?, valor = ?, id_loja = ? WHERE id = ?";
    
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, veiculo.getPlaca());
            statement.setString(2, veiculo.getModelo());
            statement.setString(3, veiculo.getChassi());
            statement.setInt(4, veiculo.getAno());
            statement.setInt(5, veiculo.getQuilometragem());
            statement.setFloat(6, veiculo.getValor());
            statement.setLong(7, veiculo.getId_loja());
            statement.setLong(8,veiculo.getId());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public Veiculo getbyId(Long id) {
        Veiculo veiculo = null;
        String sql = "SELECT * from Veiculo WHERE id = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
            	String placa = resultSet.getString("placa");
                String modelo = resultSet.getString("modelo");
                String chassi = resultSet.getString("chassi");
                Integer ano = resultSet.getInt("ano");
                Integer quilometragem = resultSet.getInt("quilometragem");
                String descricao = resultSet.getString("descricao");
                Float valor = resultSet.getFloat("valor");
                Long id_loja = resultSet.getLong("id_loja");
                veiculo = new Veiculo(id,placa, modelo, chassi, ano, quilometragem, descricao, valor,id_loja);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return veiculo;
    }
}
