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
                        <li><a href="logout">Sair</a></li>
                    </ul>
                </li>
                <li class="linkTopoDireita">
                    <a href="listarPropostasCliente">Propostas</a>
                </li>
            </ul>
        </div>
        <div align="center">
			<h2>Lista de propostas</h2>
            <table>
				<thead>
					<tr>
                        <th>Carro</th>
                        <th>Valor</th>
                        <th>Status</th>
						<th>Proposta</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="proposta" items="${requestScope.listaPropostas}">
						<tr>
                            <td>${proposta.veiculo.modelo}</td>
                            <td>${proposta.veiculo.valor}</td>
                            <td>${proposta.estado}</td>
							<td>${proposta.valor}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
        </section>
    </body>
</html>