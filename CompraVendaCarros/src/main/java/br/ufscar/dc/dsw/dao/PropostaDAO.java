package br.ufscar.dc.dsw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.ufscar.dc.dsw.domain.Proposta;
import br.ufscar.dc.dsw.domain.Veiculo;
import br.ufscar.dc.dsw.domain.Cliente;
import br.ufscar.dc.dsw.domain.Loja;


public class PropostaDAO extends GenericDAO {

    public void insert(Proposta proposta) {

        String sql = "INSERT INTO Proposta (id_cliente, id_loja, id_veiculo, valor, data) VALUES (?, ?, ?, ?, ?)";

        try {
            Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);;

            statement = conn.prepareStatement(sql);
            statement.setString(1, proposta.getData());
            statement.setFloat(2, proposta.getValor());
            statement.setLong(3, proposta.getVeiculo().getId());
            statement.setLong(4, proposta.getCliente().getId());
            statement.setLong(5, proposta.getLoja().getId());
            statement.executeUpdate();

            statement.close();
            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Proposta> getAll(Cliente cliente) {

        List<Proposta> listaPropostas = new ArrayList<>();

        String sql = "SELECT * from Proposta c where c.USUARIO_ID = ? order by c.ID";

        try {
        	Connection conn = this.getConnection();
            PreparedStatement statement = conn.prepareStatement(sql);
            
            statement.setLong(1, cliente.getId());
            ResultSet resultSet = statement.executeQuery(); 
            
            while (resultSet.next()) {
                Long id = resultSet.getLong("id");
                String data = resultSet.getString("data");
                Float valor = resultSet.getFloat("valor");
                Long veiculoId = resultSet.getLong("veiculo_id");
                Veiculo veiculo = new VeiculoDAO().getById(veiculoId);
                Long lojaId = resultSet.getLong("loja_id");
                Loja loja = new LojaDAO().getById(lojaId);            
                Proposta proposta = new Proposta(id, data, valor, veiculo, cliente, loja);
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
}