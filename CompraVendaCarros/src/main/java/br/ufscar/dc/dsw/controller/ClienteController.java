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
    	
    	if (usuario == null) {
    		erro(request, response);
    	} else if (usuario.getPapel().equals("USER")) {
            String action = request.getPathInfo();
			if (action == null) {
				action = "";
			}

			try {
				switch (action) {
					case "/comprar":
						comprar(request, response);
						break;
					default:
						catalogo(request, response);
						break;
				}
			} catch (RuntimeException | IOException | ServletException e) {
				throw new ServletException(e);
			}

    	} else {
    		erro(request, response);
    	}    	
    }

	private void erro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		Erro erros = new Erro();

        erros.add("Acesso não autorizado!");
    	erros.add("Apenas CLIENTES tem acesso a essa página");
    	request.setAttribute("mensagens", erros);
    	RequestDispatcher rd = request.getRequestDispatcher("/noAuth.jsp");
    	rd.forward(request, response);
    }

    private void catalogo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        VeiculoDAO dao = new VeiculoDAO();
        List<Veiculo> catalogo = dao.getAll();
        request.setAttribute("catalogo", catalogo);
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/cliente/inicio.jsp");
        dispatcher.forward(request, response);
	}

    private void comprar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
		Long id = Long.parseLong(request.getParameter("id"));
		VeiculoDAO dao = new VeiculoDAO();
		Veiculo veiculo = dao.getById(id);
        request.setAttribute("veiculo", veiculo);
		
        RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/cliente/comprar.jsp");
        dispatcher.forward(request, response);

	}
}