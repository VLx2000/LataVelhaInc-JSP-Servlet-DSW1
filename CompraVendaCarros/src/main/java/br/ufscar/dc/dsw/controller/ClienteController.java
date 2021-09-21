package br.ufscar.dc.dsw.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.ufscar.dc.dsw.domain.Cliente;
import br.ufscar.dc.dsw.util.Erro;
import br.ufscar.dc.dsw.dao.ClienteDAO;
//import java.sql.Date;

//import br.ufscar.dc.dsw.util.Erro;

@WebServlet(urlPatterns = "/clientes/*")
public class ClienteController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ClienteDAO dao;

    @Override
    public void init() {
        dao = new ClienteDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

    	Cliente usuario = (Cliente) request.getSession().getAttribute("usuarioLogado");
		Erro erros = new Erro();

		if (usuario == null) {
			response.sendRedirect(request.getContextPath());
			return;
		} else if (!usuario.getPapel().equals("ADMIN")) {
			erros.add("Acesso não autorizado!");
			erros.add("Apenas Papel [ADMIN] tem acesso a essa página");
			request.setAttribute("mensagens", erros);
			RequestDispatcher rd = request.getRequestDispatcher("/noAuth.jsp");
			rd.forward(request, response);
			return;
		}
    	
        String action = request.getPathInfo();
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "/cadastro":
            		apresentaFormCadastroClientes(request, response);
            		break;
                case "/insercao":
                    insere(request, response);
                    break;
                case "/edicao":
                	apresentaFormEdicaoClientes(request,response);
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

    private void lista(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Cliente> listaClientes = dao.getAll();
        request.setAttribute("listaClientes", listaClientes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/cliente/listaClientes.jsp");
        dispatcher.forward(request, response);
    }

    private void apresentaFormCadastroClientes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {	
        RequestDispatcher dispatcher = request.getRequestDispatcher("/cliente/formularioClientes.jsp");
        dispatcher.forward(request, response);
    }
    private void apresentaFormEdicaoClientes(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Cliente cliente = dao.getbyId(id);
        request.setAttribute("cliente", cliente);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/cliente/formularioClientes.jsp");
        dispatcher.forward(request, response);
    }
    private void insere(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String CPF = request.getParameter("CPF");
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String sexo = request.getParameter("sexo");
        String nascimento = request.getParameter("nascimento");
        //Date nascimento = request.getParameter("nascimento");
        String papel = request.getParameter("papel");
        Cliente cliente = new Cliente(email, senha, CPF, nome, telefone, sexo, nascimento, papel);

        dao.insert(cliente);
        response.sendRedirect("listaClientes");
    }
    
    private void atualiza(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
    	String email = request.getParameter("email");
    	String senha = request.getParameter("senha");
    	String CPF = request.getParameter("CPF");
    	String nome = request.getParameter("nome");
    	String telefone = request.getParameter("telefone");
    	String sexo = request.getParameter("sexo");
    	String nascimento = request.getParameter("nascimento");
    	String papel = request.getParameter("papel");
    	
    	Cliente cliente = new Cliente(id,email,senha,CPF,nome,telefone,sexo, nascimento,papel);
    	
        dao.update(cliente);
        
        response.sendRedirect("listaClientes");
    }
    

    private void remove(HttpServletRequest request, HttpServletResponse response)
    		throws IOException {
    	String id_s = request.getParameter("id");
    	Long id = Long.parseLong( id_s );  
    	
    	Cliente cliente = new Cliente(id);
    	dao.delete(cliente);
    	
    	// Retorna para a página do CRUD:
    	response.sendRedirect("listaClientes");
    }
}
