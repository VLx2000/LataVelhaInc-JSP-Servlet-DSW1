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
import br.ufscar.dc.dsw.domain.Cliente;
import br.ufscar.dc.dsw.util.Erro;

import java.util.List;

@WebServlet(urlPatterns = "/clientes/*")
public class ClienteController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cliente usuario = (Cliente) request.getSession().getAttribute("usuarioLogado");
    	Erro erros = new Erro();
    	
    	if (usuario == null) {
    		response.sendRedirect(request.getContextPath());
    	} else if (usuario.getPapel().equals("USER")) {
            VeiculoDAO dao = new VeiculoDAO();
            List<Veiculo> catalogo = dao.getAll();
            request.setAttribute("catalogo", catalogo);
    		RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/cliente/inicio.jsp");
            dispatcher.forward(request, response);
    	} else {
    		erros.add("Acesso não autorizado!");
    		erros.add("Apenas Papel [USER] tem acesso a essa página");
    		request.setAttribute("mensagens", erros);
    		RequestDispatcher rd = request.getRequestDispatcher("/noAuth.jsp");
    		rd.forward(request, response);
    	}    	
    }

	private void fazerProposta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

	}

    private void listarPropostas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

	}
}