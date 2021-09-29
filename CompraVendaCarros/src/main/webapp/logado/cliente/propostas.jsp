<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Compra e Venda de Veículos</title>
        <link rel="stylesheet" href="../css/global.css">
        <link rel="stylesheet" href="../css/propostas.css">
    </head>
    <body>
        <%String contextPath = request.getContextPath().replace("/", ""); %>
        <div class="topbar">
            <ul id="links">
                <li class="linkTopoEsquerda">
                    <a href="${pageContext.request.contextPath}/clientes">
                        <span id="titulo">LataVelhaInc.</span>
                    </a>
                </li>
                <li class="nomeTopoDireita">
                    <span>Bem vindo: ${sessionScope.usuarioLogado.nome}</span>
                    <ul class="dropdown">
                        <li><a href="../logout">Sair</a></li>
                    </ul>
                </li>
                <li class="linkTopoDireita">
                    <a href="listarPropostasCliente">Propostas</a>
                </li>
            </ul>
        </div>
        <div align="center">
			<h1 class="label">Lista de Propostas</h1>
		</div>
        <div align="center">
	        <section>
	            <table class="propostas">
					<thead>
						<tr>
	                        <th>Foto</th>
	                        <th>Carro</th>
	                        <th>Valor</th>
	                        <th>Loja</th>
							<th>Proposta</th>
	                        <th>Status</th>
                            <th class="acao"></th>
						</tr>
					</thead>
	
					<tbody>
						<c:forEach var="proposta" items="${requestScope.listaPropostas}">
							<tr class="proposta">
	                            <td><img src="../imagens/${proposta.veiculo.modelo}.jpg" alt="Carro" height="80px" width="80px"></td>
	                            <td>${proposta.veiculo.modelo}</td>
	                            <td>R$${proposta.veiculo.valor}</td>
	                            <td>${proposta.loja.nome}</td>
								<td>R$${proposta.valor}</td>
	                            <td class="estado">${proposta.estado}</td>
                                <td class="acao">
                                    <c:if test="${proposta.estado == 'ABERTO' }">
                                	    <a id="negar" href="../proposta/removerProposta?id=${proposta.id}">CANCELAR</a>
                                    </c:if>
                                </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
	        </section>
        </div>
        <script src="../js/cor.js"></script>
    </body>
</html>