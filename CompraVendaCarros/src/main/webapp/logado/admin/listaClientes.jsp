<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
	<fmt:bundle basename="message">
		<head>	
			<title><fmt:message key="customer.title"/></title>
			<link rel="stylesheet" href="../css/clientes.css">
			<link rel="stylesheet" href="../css/global.css">
		</head>
	
		<body>
	
			<%String contextPath = request.getContextPath().replace("/", ""); %>
			<div class="topbar">
	            <ul>
	                <li class="linkTopoEsquerda">
	                    <a href="${pageContext.request.contextPath}/admin">
	                        <span id="titulo"><fmt:message key="topbar.title"/></span><span id="admin">admin</span>
	                    </a>
	                </li>
	                <li class="linkTopoDireita">
	                    <a href="${pageContext.request.contextPath}/logout"><fmt:message key="user.logout"/></a>
	                </li>
	            </ul>
	        </div>
			<div align="center">
				<h1 class="label"><fmt:message key="customer.welcome"/></h1>
			</div>
			<div align="center">
				<h2><fmt:message key="customer.title"/></h2>
				<table>
					<thead>
						<tr>
							<th><fmt:message key="customer.id"/></th>
							<th><fmt:message key="customer.email"/></th>
							<th><fmt:message key="customer.password"/></th>
							<th><fmt:message key="customer.ssn"/></th>
							<th><fmt:message key="customer.name"/></th>
							<th><fmt:message key="customer.phone"/></th>
	                        <th><fmt:message key="customer.gender"/></th>
							<th><fmt:message key="customer.birth"/></th>
							<th><fmt:message key="customer.paper"/></th>
							<th><fmt:message key="object.actions"/></th>
						</tr>
					</thead>
	
					<tbody>
						<c:forEach var="cliente" items="${requestScope.listaClientes}">
							<tr>
								<td>${cliente.id}</td>
								<td>${cliente.email}</td>
	                            <td>${cliente.senha}</td>
	                            <td>${cliente.CPF}</td>
	                            <td>${cliente.nome}</td>
	                            <td>${cliente.telefone}</td>
	                            <td>${cliente.sexo}</td>
	                            <td>${cliente.nascimento}</td>
	                            <td>${cliente.papel}</td>
								<td><a href="/<%= contextPath%>/admin/edicaoCliente?id=${cliente.id}"><fmt:message key="object.update"/></a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="/<%= contextPath%>/admin/remocaoCliente?id=${cliente.id}"
								onclick="return confirm('<fmt:message key="confirm.message"/>');">
									<fmt:message key="object.delete"/> </a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="adiciona">
					<a href="/<%=contextPath%>/admin/cadastroCliente"><fmt:message key="customer.add"/></a>
				</div>
			</div>
		</body>
	</fmt:bundle>
</html> 