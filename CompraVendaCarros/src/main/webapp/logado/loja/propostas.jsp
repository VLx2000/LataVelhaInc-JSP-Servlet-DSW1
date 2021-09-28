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
                    <a href="${pageContext.request.contextPath}/lojas">
                        <span id="titulo">LataVelhaInc.</span>
                    </a>
                </li>
                <li class="nomeTopoDireita">
                    <span>Loja: ${sessionScope.lojaLogada.nome}</span>
                    <ul class="dropdown">
                        <li><a href="../logout">Sair</a></li>
                    </ul>
                </li>
                <li class="linkTopoDireita">
                    <a href="listarPropostasLoja">Propostas</a>
                </li>
                <li class="linkTopoDireita">
                    <a href="cadastro">Adicionar Veículo</a>
                </li>
            </ul>
        </div>
        <div align="center">
			<h1 class="label">Lista de Propostas</h1>
		</div>
        <div align="center">
            <table class="propostas">
                <thead>
					<tr>
                        <th>Status</th>
                        <th>Foto</th>
                        <th>Carro</th>
                        <th>Valor</th>
						<th>Proposta</th>
                        <th>Ação</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="proposta" items="${requestScope.listaPropostas}">
						<tr class="proposta">
                            <td class="estado">${proposta.estado}</td>
                            <td><img src="../imagens/${proposta.veiculo.modelo}.jpg" alt="Carro" height="80px" width="80px"></td>
                            <td>${proposta.veiculo.modelo}</td>
                            <td>${proposta.veiculo.valor}</td>
							<td>${proposta.valor}</td>
                            <td><a id="aceitar" href="aceitarProposta?id=${proposta.cliente.id}&id_veiculo=${proposta.veiculo.id}&valor=${proposta.valor}">ACEITAR</a>
                                &nbsp; 
                                <a id="negar" href="negarProposta?id=${proposta.cliente.id}&id_veiculo=${proposta.veiculo.id}&valor=${proposta.valor}">NEGAR</a>
                            </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
        </section>
        <script src="../js/cor.js"></script>
    </body>
</html>