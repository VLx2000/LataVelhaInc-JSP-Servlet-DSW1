package br.ufscar.dc.dsw.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ufscar.dc.dsw.domain.Veiculo;
import br.ufscar.dc.dsw.dao.VeiculoDAO;

//import br.ufscar.dc.dsw.util.Erro;

import java.util.List;

@WebServlet(name = "Index", urlPatterns = "/index.jsp")
public class IndexController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*

		String URL = "/login.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(URL);
		rd.forward(request, response);*/
	}

    private void catalogo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		VeiculoDAO dao = new VeiculoDAO();
        List<Veiculo> catalogo = dao.getAll();
        request.setAttribute("catalogo", catalogo);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/inicio.jsp");
        dispatcher.forward(request, response);
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        catalogo(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}