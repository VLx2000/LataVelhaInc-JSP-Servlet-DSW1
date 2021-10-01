package br.ufscar.dc.dsw.controller;

import static br.ufscar.dc.dsw.util.Constants.MAX_FILE_SIZE;
import static br.ufscar.dc.dsw.util.Constants.MAX_REQUEST_SIZE;
import static br.ufscar.dc.dsw.util.Constants.MEMORY_THRESHOLD;
import static br.ufscar.dc.dsw.util.Constants.UPLOAD_DIRECTORY;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher; 
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ufscar.dc.dsw.domain.Loja;
import br.ufscar.dc.dsw.dao.VeiculoDAO;
import br.ufscar.dc.dsw.domain.Veiculo;
import br.ufscar.dc.dsw.util.Erro;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(urlPatterns = "/lojas/*")
public class LojaController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    private VeiculoDAO dao;

    @Override
    public void init() {
        dao = new VeiculoDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Loja loja = (Loja) request.getSession().getAttribute("lojaLogada");
    	Erro erros = new Erro();

		if (loja == null) {
            erros.add("Acesso não autorizado!");
            erros.add("Apenas LOJAS tem acesso a essa página");
            request.setAttribute("mensagens", erros);
            RequestDispatcher rd = request.getRequestDispatcher("/noAuth.jsp");
            rd.forward(request, response);
    	} 
        else {
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
                    case "/listarPropostas":
                        listaPropostas(request, response);
                        break;
                    case "/upload":
                		apresentaFormUpload(request, response);
                		break;
                    case "/uploadFile":
                		upload(request, response);
                		break;
                    default:
                        listaVeiculos(request, response);
                        break;
                }
            } catch (RuntimeException | IOException | ServletException e) {
                throw new ServletException(e);
            }
        }
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
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/loja/inicio.jsp");
        dispatcher.forward(request, response);
    }

    private void insere(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	
        Loja loja = (Loja) request.getSession().getAttribute("lojaLogada");
        
    	String placa = request.getParameter("placa");
    	String modelo = request.getParameter("modelo");
    	String chassi = request.getParameter("chassi");
    	Integer ano = Integer.parseInt(request.getParameter("ano"));
    	Integer quilometragem = Integer.parseInt(request.getParameter("quilometragem"));
    	String descricao = request.getParameter("descricao");
    	Float valor = Float.parseFloat(request.getParameter("valor"));
    	
    	Veiculo veiculo = new Veiculo(placa, modelo,chassi,ano,quilometragem, descricao,valor,loja);
    	dao.insert(veiculo);
    	
    	// Retorna para a página do CRUD:
    	response.sendRedirect("../lojas");
    }
    private void atualiza(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Loja loja = (Loja) request.getSession().getAttribute("lojaLogada");

        Long id = Long.parseLong(request.getParameter("id"));
    	String placa = request.getParameter("placa");
    	String modelo = request.getParameter("modelo");
    	String chassi = request.getParameter("chassi");
    	Integer ano = Integer.parseInt(request.getParameter("ano"));
    	Integer quilometragem = Integer.parseInt(request.getParameter("quilometragem"));
    	String descricao = request.getParameter("descricao");
    	Float valor = Float.parseFloat(request.getParameter("valor"));
    	
    	Veiculo veiculo = new Veiculo(id,placa, modelo,chassi,ano,quilometragem, descricao,valor,loja);
        dao.update(veiculo);
        
        response.sendRedirect("../lojas");
    }
    
    private void apresentaFormCadastroVeiculos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Loja loja = (Loja) request.getSession().getAttribute("lojaLogada");
    	request.setAttribute("loja", loja);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/loja/formularioVeiculos.jsp");
        dispatcher.forward(request, response);
    }
    private void apresentaFormEdicaoVeiculos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Loja loja = (Loja) request.getSession().getAttribute("lojaLogada");
        Long id = Long.parseLong(request.getParameter("id"));
        Veiculo veiculo = dao.getById(id);
        request.setAttribute("veiculo", veiculo);
        request.setAttribute("loja", loja);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/loja/formularioVeiculos.jsp");
        dispatcher.forward(request, response);
    }
    
    private void remove(HttpServletRequest request, HttpServletResponse response)
    		throws IOException {
    	String id_s = request.getParameter("id");
    	Long id = Long.parseLong( id_s );
    	Veiculo veiculo = new Veiculo(id);
    	dao.delete(veiculo);
   
    	// Retorna para a página do CRUD:
    	response.sendRedirect("../lojas");
    }
    
    private void apresentaFormUpload(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_s = request.getParameter("id");
        Long id = Long.parseLong(id_s);
        Veiculo veiculo = dao.getById(id);
        request.setAttribute("veiculo", veiculo);
        request.setAttribute("id", id);
        
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY +  id_s;
		File dir = new File(uploadPath);
	    File[] directoryListing = dir.listFiles();
	    int num_files = directoryListing.length;
	    
	    request.setAttribute("num_files", num_files);

        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/logado/loja/upload.jsp");
        dispatcher.forward(request, response);
    }
    
    private void upload(HttpServletRequest request, HttpServletResponse response) 
    	throws ServletException, IOException{

        
    	
    	if (ServletFileUpload.isMultipartContent(request)) {

			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(MEMORY_THRESHOLD);
			factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setFileSizeMax(MAX_FILE_SIZE);
			upload.setSizeMax(MAX_REQUEST_SIZE);
			String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY + request.getParameter("id");
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}

			try {
				List<FileItem> formItems = upload.parseRequest(request);
				File dir = new File(uploadPath);
			    File[] directoryListing = dir.listFiles();
			    int cont;
				if (directoryListing != null) {
					cont = directoryListing.length +1;
				}else {
					System.out.println(uploadPath);
					cont = 1;
				}

				if (formItems != null && formItems.size() > 0 && formItems.size() <= 10) {
					for (FileItem item : formItems) {
						String cont_s = String.format("%d", cont);
						if (!item.isFormField()) {
                            String fileName = cont_s + ".jpg";
							String filePath = uploadPath + File.separator + fileName;
							File storeFile = new File(filePath);
							item.write(storeFile);
							request.setAttribute("mensagens", "File " + fileName + " has uploaded successfully!");
						}
						cont++;
					}
				}
			} catch (Exception ex) {
				request.setAttribute("mensagem", "There was an error: " + ex.getMessage());
			}
			response.sendRedirect("../lojas");
			
			
		}
	}
    
}