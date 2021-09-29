<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
	<fmt:bundle basename="message">
	<head>	
		<title><fmt:message key="store.title"/></title>
		<link rel="stylesheet" href="../css/lojas.css">
		<link rel="stylesheet" type="text/css" href="../css/global.css">
	</head>
	
	<body>
		
		<%String contextPath = request.getContextPath().replace("/", ""); %>
		<div class="topbar">
            <ul>
                <li class="linkTopoEsquerda">
					<a href="${pageContext.request.contextPath}/admin">
                        <span id="titulo"><fmt:message key="topbar.title"/> </span><span id="admin">admin</span>
                    </a>
                </li>
                <li class="linkTopoDireita">
                    <a href="${pageContext.request.contextPath}/logout"><fmt:message key="user.logout"/></a>
                </li>
            </ul>
        </div>
		<div class="" align="center">
			<h1 class="label"><fmt:message key="store.welcome"/></h1>
		</div>
		
		<div align="center">
			<h3><fmt:message key="store.title"/></h3>
			
			<table>
				<thead>
					<tr>
						<th><fmt:message key="store.id"/></th>
						<th><fmt:message key="store.name"/></th>
						<th><fmt:message key="store.email"/></th>
						<th><fmt:message key="store.password"/></th>
						<th><fmt:message key="store.cnpj"/></th>
						<th><fmt:message key="store.description"/></th>
						<th><fmt:message key="object.actions"/></th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="loja" items="${requestScope.listaLojas}">
						<tr>
							<td>${loja.id}</td>
							<td>${loja.nome}</td>
							<td>${loja.email}</td>
							<td>${loja.senha}</td>
							<td>${loja.CNPJ}</td>
							<td>${loja.descricao}</td>
							<td><a href="/<%= contextPath%>/admin/edicaoLoja?id=${loja.id}"><fmt:message key="object.update"/></a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="/<%= contextPath%>/admin/remocaoLoja?id=${loja.id}"
								onclick="return confirm('<fmt:message key="confirm.message"/>');">
									<fmt:message key="object.delete"/> </a>
							</td>
						</tr>
					</c:forEach> 
				</tbody>
			</table>
			<div class="adiciona">
				<a href="/<%=contextPath%>/admin/cadastroLoja"><fmt:message key="store.add"/></a>
			</div>
		</div>
	</body>
	</fmt:bundle>
</html>