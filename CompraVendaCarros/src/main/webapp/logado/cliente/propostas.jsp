<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<fmt:bundle basename="message">
	    <head>
	        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	        <meta name="viewport" content="width=device-width, initial-scale=1.0">
	        <title><fmt:message key="customer.bids.title"/></title>
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
	                    <span><fmt:message key="user.welcome"/>: ${sessionScope.usuarioLogado.nome}</span>
	                    <ul class="dropdown">
	                        <li><a href="../logout"><fmt:message key="user.logout"/></a></li>
	                    </ul>
	                </li>
	                <li class="linkTopoDireita">
	                    <a href="listarPropostasCliente"><fmt:message key="customer.bids"/></a>
	                </li>
	            </ul>
	        </div>
	        <div align="center">
				<h1 class="label"><fmt:message key="bids.list"/></h1>
			</div>
	        <div align="center">
		        <section>
		            <table class="propostas">
						<thead>
							<tr>
	                            <th><fmt:message key="bids.date"/></th>
		                        <th><fmt:message key="bids.photo"/></th>
		                        <th><fmt:message key="bids.vehicle"/></th>
		                        <th><fmt:message key="bids.vehicle.value"/></th>
	                            <th><fmt:message key="bids.installment.plan"/></th>
		                        <th><fmt:message key="store.entity"/></th>
								<th><fmt:message key="bids.value"/></th>
		                        <th><fmt:message key="bids.status"/></th>
	                            <th class="acao"></th>
							</tr>
						</thead>
		
						<tbody>
							<c:forEach var="proposta" items="${requestScope.listaPropostas}">
								<tr class="proposta">
	                                <td>${proposta.data}</td>
		                            <td><img src="../imagens/${proposta.veiculo.id}/1.jpg" alt="Carro" height="80px" width="120px"></td>
		                            <td>${proposta.veiculo.modelo}</td>
		                            <td>R$${proposta.veiculo.valor}</td>
	                                <td>${proposta.parcelamento} <fmt:message key="bids.installments"/></td>
		                            <td>${proposta.loja.nome}</td>
									<td>R$${proposta.valor}</td>
		                            <td class="estado">
		                            	<c:choose>
		                            		<c:when test="${proposta.estado == 'ACEITO'}">
		                            			<fmt:message key="bids.accepted"/>
		                            		</c:when>
		                            		<c:when test="${proposta.estado == 'RECUSADO'}">
		                            			<fmt:message key="bids.rejected"/>
		                            		</c:when>
		                            		<c:otherwise>
		                            			<fmt:message key="bids.open"/>
		                            		</c:otherwise>
		                            	</c:choose>
		                            </td>
	                                <td class="acao">
	                                    <c:if test="${proposta.estado == 'ABERTO' }">
	                                	    <a id="negar" href="../proposta/removerProposta?id=${proposta.id}"><fmt:message key="bids.cancel"/></a>
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
    </fmt:bundle>
</html>