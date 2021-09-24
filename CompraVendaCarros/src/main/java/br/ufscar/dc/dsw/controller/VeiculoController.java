package br.ufscar.dc.dsw.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import br.ufscar.dc.dsw.domain.Veiculo;
import br.ufscar.dc.dsw.dao.VeiculoDAO;
import br.ufscar.dc.dsw.domain.Loja;
import br.ufscar.dc.dsw.dao.LojaDAO;
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
                case "/edicao":
                	apresentaFormEdicaoVeiculos(request,response);
                	break;
                case "/atualizacao":
                	atualiza(request,response);
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
    private Map<Long, String> getLojas() {
        Map <Long,String> lojas = new HashMap<>();
        for (Loja loja: new LojaDAO().getAll()) {
            lojas.put(loja.getId(), loja.getNome());
        }
        return lojas;
    }
    
    private void lista(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Veiculo> listaVeiculos = dao.getAll();
        request.setAttribute("listaVeiculos", listaVeiculos);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/admin/listaVeiculos.jsp");
        dispatcher.forward(request, response);
    }
    private void insere(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	
    	String placa = request.getParameter("placa");
    	String modelo = request.getParameter("modelo");
    	String chassi = request.getParameter("chassi");
    	Integer ano = Integer.parseInt(request.getParameter("ano"));
    	Integer quilometragem = Integer.parseInt(request.getParameter("quilometragem"));
    	String descricao = request.getParameter("descricao");
    	Float valor = Float.parseFloat(request.getParameter("valor"));
    	Long id_loja = Long.parseLong(request.getParameter("id_loja"));
    	
        Loja loja = new LojaDAO().getById(id_loja);
    	Veiculo veiculo = new Veiculo(placa, modelo,chassi,ano,quilometragem, descricao,valor,loja);
    	dao.insert(veiculo);
    	
    	// Retorna para a página do CRUD:
    	response.sendRedirect("listaVeiculos");
    }
    private void atualiza(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
    	String placa = request.getParameter("placa");
    	String modelo = request.getParameter("modelo");
    	String chassi = request.getParameter("chassi");
    	Integer ano = Integer.parseInt(request.getParameter("ano"));
    	Integer quilometragem = Integer.parseInt(request.getParameter("quilometragem"));
    	String descricao = request.getParameter("descricao");
    	Float valor = Float.parseFloat(request.getParameter("valor"));
    	Long id_loja = Long.parseLong(request.getParameter("id_loja"));
    	
    	Loja loja =  new LojaDAO().getById(id_loja);
    	Veiculo veiculo = new Veiculo(id,placa, modelo,chassi,ano,quilometragem, descricao,valor,loja);
        dao.update(veiculo);
        
        response.sendRedirect("listaVeiculos");
    }
    
    private void apresentaFormCadastroVeiculos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {	
    	request.setAttribute("lojas", getLojas());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/admin/formularioVeiculos.jsp");
        dispatcher.forward(request, response);
    }
    private void apresentaFormEdicaoVeiculos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Veiculo veiculo = dao.getById(id);
        request.setAttribute("veiculo", veiculo);
        request.setAttribute("lojas", getLojas());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/admin/formularioVeiculos.jsp");
        dispatcher.forward(request, response);
    }
    
    private void remove(HttpServletRequest request, HttpServletResponse response)
    		throws IOException {
    	String id_s = request.getParameter("id");
    	Long id = Long.parseLong( id_s );
    	Veiculo veiculo = new Veiculo(id);
    	dao.delete(veiculo);
   
    	// Retorna para a página do CRUD:
    	response.sendRedirect("/CompraVendaCarros/veiculos");
    }
}
