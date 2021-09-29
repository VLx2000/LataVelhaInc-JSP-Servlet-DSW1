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
			<link rel="stylesheet" type="text/css" href="../css/lojas.css">
			<link rel="stylesheet" type="text/css" href="../css/global.css">
		</head>
		
		<body>
			<div align="center">
				<h1><fmt:message key="store.welcome"/></h1>
			</div>
			<div align="center">
				<c:choose>
					<c:when test="${loja != null}">
						<form action="atualizacaoLoja" method="post">
							<%@include file="camposLoja.jsp"%>
						</form>
					</c:when>
					<c:otherwise>
						<form action="insercaoLoja" method="post">
							<%@include file="camposLoja.jsp"%>
						</form>
					</c:otherwise>
				</c:choose>
			</div>
			<c:if test="${!empty requestScope.mensagens}">
				<ul class="erro">
					<c:forEach items="${requestScope.mensagens}" var="mensagem">
						<li>${mensagem}</li>
					</c:forEach>
				</ul>
			</c:if>
		</body>
	</fmt:bundle>
</html>