package br.ufscar.dc.dsw.controller;

import java.io.IOException;
//import java.util.HashMap;
import java.util.List;
//import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import br.ufscar.dc.dsw.dao.LojaDAO;
import br.ufscar.dc.dsw.domain.Loja;
import br.ufscar.dc.dsw.dao.VeiculoDAO;
import br.ufscar.dc.dsw.domain.Veiculo;
//import br.ufscar.dc.dsw.util.Erro;


@WebServlet(urlPatterns = "/lojas/*")
public class LojaController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    /*
    private LojaDAO dao;

    @Override
    public void init() {
        dao = new LojaDAO();
    }
*/
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getPathInfo();
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "/listarVeiculos":
                	listaVeiculos(request, response);
                	break;
                case "/listarPropostas":
                	listaPropostas(request, response);
                	break;
                default:
                    opcoes(request, response);
                    break;
            }
        } catch (RuntimeException | IOException | ServletException e) {
            throw new ServletException(e);
        }
    }

    private void opcoes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/loja/opcoes.jsp");
        dispatcher.forward(request, response);
    }

    private void listaPropostas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/loja/propostas.jsp");
        dispatcher.forward(request, response);
    }

    private void listaVeiculos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Loja loja = (Loja) request.getSession().getAttribute("lojaLogada");
        VeiculoDAO dao = new VeiculoDAO();
        List<Veiculo> catalogo = dao.getAllByLoja(loja.getId());
        request.setAttribute("catalogo", catalogo);
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/loja/carros.jsp");
        dispatcher.forward(request, response);
    }
}