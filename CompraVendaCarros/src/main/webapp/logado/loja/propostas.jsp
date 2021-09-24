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
                    <a href="${pageContext.request.contextPath}/lojas">
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
                    <a href="proposta/listarPropostasLoja">Propostas</a>
                </li>
            </ul>
        </div>
        <div align="center">
			<h1 class="label">Lista de Propostas</h1>
		</div>
        <div align="center">
            <table>
				<thead>
					<tr>
						<th>valor</th>
					</tr>
				</thead>
                <thead>
					<tr>
                        <th>Carro</th>
                        <th>Valor</th>
                        <th>Status</th>
						<th>Proposta</th>
                        <th>Ação</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="proposta" items="${requestScope.listaPropostas}">
						<tr>
                            <td>${proposta.veiculo.modelo}</td>
                            <td>${proposta.veiculo.valor}</td>
                            <td class="estado">${proposta.estado}</td>
							<td>${proposta.valor}</td>
                            <td><a href="proposta/aceitarProposta?id=${proposta.cliente.id}">ACEITAR</a>
                                &nbsp;&nbsp;&nbsp;&nbsp; 
                                <a href="proposta/negarProposta?id=${proposta.cliente.id}">NEGAR </a>
                            </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
        </section>
        <script src="../js/cor.js"></script>
    </body>
</html>