package br.ufscar.dc.dsw.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ufscar.dc.dsw.domain.Veiculo;
import br.ufscar.dc.dsw.dao.VeiculoDAO;
//import br.ufscar.dc.dsw.util.Erro;

@WebServlet(urlPatterns = "/veiculos/*")
public class VeiculoController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
	private VeiculoDAO dao;

    @Override
    public void init() {
        dao = new VeiculoDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException {
                
        String action = request.getPathInfo();
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
            	case "/cadastro":
            		apresentaFormCadastroVeiculos(request, response);
            		break;
                case "/insercao":
                	insere(request, response);
                    break;
                case "/remocao":
                	remove(request, response);
                	break;
                default:
                    lista(request, response);
                    break;
            }
        } catch (RuntimeException | IOException | ServletException e) {
            throw new ServletException(e);
        }
    }
    
    private void lista(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Veiculo> listaVeiculos = dao.getAll();
        request.setAttribute("listaVeiculos", listaVeiculos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/veiculo/listaVeiculos.jsp");
        dispatcher.forward(request, response);
    }
    private void insere(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	
    	String placa = request.getParameter("placa");
    	String modelo = request.getParameter("modelo");
    	String chassi = request.getParameter("chassi");
    	String ano_s = request.getParameter("ano");
    	String quilometragem_s = request.getParameter("quilometragem");
    	String descricao = request.getParameter("descricao");
    	String valor_s = request.getParameter("valor");
    	String id_loja_s = request.getParameter("id_loja");
    	
    	Integer ano = Integer.parseInt(ano_s);
    	Integer quilometragem = Integer.parseInt(quilometragem_s);
    	Float valor =  Float.parseFloat(valor_s);
    	Long id_loja = Long.parseLong( id_loja_s );
    	
    	Veiculo veiculo = new Veiculo(placa, modelo,chassi,ano,quilometragem, descricao,valor,id_loja);
    	dao.insert(veiculo);
    	
    	// Retorna para a página do CRUD:
    	response.sendRedirect("listaVeiculos");
    }
    
    private void apresentaFormCadastroVeiculos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {	
        RequestDispatcher dispatcher = request.getRequestDispatcher("/veiculo/formularioVeiculos.jsp");
        dispatcher.forward(request, response);
    }
    
    private void remove(HttpServletRequest request, HttpServletResponse response)
    		throws IOException {
    	String id_s = request.getParameter("id");
    	Long id = Long.parseLong( id_s );
    	Veiculo veiculo = new Veiculo(id);
    	dao.delete(veiculo);
   
    	// Retorna para a página do CRUD:
    	response.sendRedirect("listaLojas");
    }
}
