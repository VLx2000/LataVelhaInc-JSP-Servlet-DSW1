package br.ufscar.dc.dsw.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ufscar.dc.dsw.dao.PropostaDAO;
import br.ufscar.dc.dsw.dao.VeiculoDAO;
import br.ufscar.dc.dsw.dao.LojaDAO;

import br.ufscar.dc.dsw.domain.Proposta;
import br.ufscar.dc.dsw.domain.Veiculo;
import br.ufscar.dc.dsw.domain.Cliente;
import br.ufscar.dc.dsw.domain.Loja;

//import br.ufscar.dc.dsw.util.Erro;

@WebServlet(urlPatterns = "/proposta/*")
public class PropostaController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private PropostaDAO dao;

    @Override
    public void init() {
        dao = new PropostaDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Cliente cliente = (Cliente) request.getSession().getAttribute("clienteLogado");
		//Erro erros = new Erro();

		if (cliente == null) {
			response.sendRedirect(request.getContextPath());
			return;
		} /*else if (!cliente.getPapel().equals("USER")) {
			erros.add("Acesso não autorizado!");
			erros.add("Apenas Papel [USER] tem acesso a essa página");
			request.setAttribute("mensagens", erros);
			RequestDispatcher rd = request.getRequestDispatcher("/noAuth.jsp");
			rd.forward(request, response);
			return;
		}*/
		
        String action = request.getPathInfo();
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "/cadastro":
                    apresentaFormCadastro(request, response);
                    break;
                case "/insercao":
                    insere(request, response);
                    break;
                default:
                    lista(request, response);
                    break;
            }
        } catch (RuntimeException | IOException | ServletException e) {
            throw new ServletException(e);
        }
    }

    private void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Cliente cliente = (Cliente) request.getSession().getAttribute("clienteLogado");
        List<Proposta> listaPropostas = dao.getAll(cliente);
        request.setAttribute("listaPropostas", listaPropostas);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/proposta/lista.jsp");
        dispatcher.forward(request, response);
    }

    private Map<Long, Veiculo> getVeiculos() {
        Map<Long, Veiculo> veiculos = new HashMap<>();
        for (Veiculo veiculo: new VeiculoDAO().getAll()) {
            veiculos.put(veiculo.getId(), veiculo);
        }
        return veiculos;
    }

    private void apresentaFormCadastro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("veiculos", getVeiculos());
        RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/proposta/formulario.jsp");
        dispatcher.forward(request, response);
    }

    private void insere(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        Long id = Long.parseLong(request.getParameter("veiculo"));

        Veiculo veiculo = new VeiculoDAO().getById(id);
        Loja loja = new LojaDAO().getById(id);
        Cliente cliente = (Cliente) request.getSession().getAttribute("clienteLogado");
        
        String data = new SimpleDateFormat("dd/MM/yyyy").format(Calendar.getInstance().getTime());
        Proposta proposta = new Proposta(data, veiculo.getValor(), veiculo, cliente, loja);
        dao.insert(proposta);
        
        response.sendRedirect("lista");
    }
}