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

@WebServlet(urlPatterns = "/veiculos/")
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
                case "/insere":
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("/veiculos/listaVeiculos.jsp");
        dispatcher.forward(request, response);
    }
}
