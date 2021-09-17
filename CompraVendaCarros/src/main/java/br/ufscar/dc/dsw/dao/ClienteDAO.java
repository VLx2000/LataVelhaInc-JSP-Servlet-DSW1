package br.ufscar.dc.dsw.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import br.ufscar.dc.dsw.domain.Cliente;

public class ClienteDAO extends GenericDAO {

    public void insert(Cliente cliente) {    
        String sql = "INSERT INTO Cliente (email, senha, CPF, nome, telefone, sexo, nascimento, papel) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);;    
            statement = conn.prepareStatement(sql);
            statement.setString(1, cliente.getEmail());
            statement.setString(2, cliente.getSenha());
            statement.setString(3, cliente.getCPF());
            statement.setString(4, cliente.getNome());
            statement.setString(5, cliente.getTelefone());
            statement.setString(6, cliente.getSexo());
            statement.setString(7, cliente.getNascimento());
            statement.setString(8, cliente.getPapel());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public List<Cliente> getAll() {   
        List<Cliente> listaClientes = new ArrayList<>();
        String sql = "SELECT * from Cliente";
        try {
            Connection conn = this.getConnection();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                //long id = resultSet.getLong("id");
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                String CPF = resultSet.getString("CPF");
                String nome = resultSet.getString("nome");
                String telefone = resultSet.getString("telefone");
                String sexo = resultSet.getString("sexo");
                String nascimento = resultSet.getString("nascimento");
                //Date nascimento = new Date(30,8,2000)/*resultSet.getDate("nascimento")*/;
                String papel = resultSet.getString("papel");
                Cliente cliente = new Cliente(email, senha, CPF, nome, telefone, sexo, nascimento, papel);
                listaClientes.add(cliente);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaClientes;
    }
    
    public void delete(Cliente cliente) {
        String sql = "DELETE FROM Cliente where id = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, cliente.getCPF());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
        }
    }
    
    public void update(Cliente cliente) {
        String sql = "UPDATE Cliente SET email = ?, senha = ?, CPF = ?, nome = ?, telefone = ?, sexo = ?, nascimento = ?, papel = ? WHERE CPF = ?";
    
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, cliente.getEmail());
            statement.setString(2, cliente.getSenha());
            statement.setString(3, cliente.getCPF());
            statement.setString(4, cliente.getNome());
            statement.setString(5, cliente.getTelefone());
            statement.setString(6, cliente.getSexo());
            statement.setString(7, cliente.getNascimento());
            statement.setString(8, cliente.getPapel());
            statement.executeUpdate();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    public Cliente getbyCPF(String CPF) {
        Cliente cliente = null;
        String sql = "SELECT * from Cliente WHERE CPF = ?";
        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, CPF);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");
                //String CPF = resultSet.getString("CPF");
                String nome = resultSet.getString("nome");
                String telefone = resultSet.getString("telefone");
                String sexo = resultSet.getString("sexo");
                String nascimento = resultSet.getString("nascimento");
                String papel = resultSet.getString("papel");
                cliente = new Cliente(email, senha, CPF, nome, telefone, sexo, nascimento, papel);
            }
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return cliente;
    }
}
