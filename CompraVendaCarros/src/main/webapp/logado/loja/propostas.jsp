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
			<h2>Lista de propostas</h2>
            <table>
				<thead>
					<tr>
						<th>valor</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="proposta" items="${requestScope.listaPropostas}">
						<tr>
							<td>${proposta.valor}</td>
							<td><a href="/<%= contextPath%>/admin/edicaoCliente?id=${cliente.id}">Edição</a>
							&nbsp;&nbsp;&nbsp;&nbsp; <a
							href="/<%= contextPath%>/admin/remocaoCliente?id=${cliente.id}"
							onclick="return confirm('Tem certeza de que deseja excluir este item?');">
								Remoção </a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="adiciona">
				<a href="/<%=contextPath%>/admin/cadastroCliente">Adicionar Novo Cliente</a>
			</div>
        </section>
    </body>
</html>