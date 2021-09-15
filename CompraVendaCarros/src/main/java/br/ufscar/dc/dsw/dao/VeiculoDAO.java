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
        String sql = "INSERT INTO Veiculo (placa, modelo, chassi, ano, quilometragem, descricao, valor, cnpj_loja) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
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
            statement.setString(8, veiculo.getLojaCNPJ());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public List<Veiculo> getAll() {   
        List<Veiculo> listaClientes = new ArrayList<>();
        String sql = "SELECT * from Veiculo u";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                String placa = resultSet.getString("placa");
                String modelo = resultSet.getString("modelo");
                String chassi = resultSet.getString("chassi");
                Integer ano = resultSet.getInt("ano");
                Integer quilometragem = resultSet.getInt("quilometragem");
                String descricao = resultSet.getString("descricao");
                float valor = resultSet.getFloat("valor");
                String cnpj_loja = resultSet.getString("cnpj_loja");
                byte[] imagens = resultSet.getBytes("imagens");
                //Boolean admin = resultSet.getBoolean("admin");
                Veiculo veiculo = new Veiculo(placa,modelo,chassi,ano,quilometragem,descricao,valor,imagens,cnpj_loja);
                listaClientes.add(veiculo);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaClientes;
    }
    
    public void delete(Veiculo veiculo) {
        String sql = "DELETE FROM Veiculo where placa = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, veiculo.getPlaca());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
        }
    }
    
    public void update(Veiculo veiculo) {
        String sql = "UPDATE Veiculo SET placa = ?, modelo = ?, chassi = ?, ano = ?, quilometragem = ?, descricao = ?, valor = ?, cnpj_loja = ? WHERE placa = ?";
    
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, veiculo.getPlaca());
            statement.setString(2, veiculo.getModelo());
            statement.setString(3, veiculo.getChassi());
            statement.setInt(4, veiculo.getAno());
            statement.setInt(5, veiculo.getQuilometragem());
            statement.setFloat(6, veiculo.getValor());
            statement.setString(7, veiculo.getLojaCNPJ());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public Veiculo getbyPlaca(String placa) {
        Veiculo veiculo = null;
        String sql = "SELECT * from Veiculo WHERE placa = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, placa);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String modelo = resultSet.getString("modelo");
                String chassi = resultSet.getString("chassi");
                Integer ano = resultSet.getInt("ano");
                Integer quilometragem = resultSet.getInt("quilometragem");
                String descricao = resultSet.getString("descricao");
                Float valor = resultSet.getFloat("valor");
                byte[] imagens = resultSet.getBytes("imagens");
                String cnpj_loja = resultSet.getString("cnpj_loja");
                veiculo = new Veiculo(placa, modelo, chassi, ano, quilometragem, descricao, valor,imagens,cnpj_loja);
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
