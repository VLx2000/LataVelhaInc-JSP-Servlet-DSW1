<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
	<fmt:bundle basename="message">
		<head>
		<title><fmt:message key="vehicle.welcome"/></title>
		<link rel="stylesheet" type="text/css" href="../css/veiculos.css">
		<link rel="stylesheet" type="text/css" href="../css/global.css">
		</head>
		
		<body>
			<div align="center">
				<h1><fmt:message key="vehicle.welcome"/></h1>
			</div>
			<div align="center">
				<c:choose>
					<c:when test="${veiculo != null}">
						<form action="atualizacao" method="post">
							<%@include file="camposVeiculo.jsp"%>
						</form>
					</c:when>
					<c:otherwise>
						<form action="insercao" method="post">
							<%@include file="camposVeiculo.jsp"%>
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