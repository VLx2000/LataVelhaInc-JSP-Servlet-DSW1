<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<title>Lista de Lojas</title>
	<link rel="stylesheet" type="text/css" href="../css/veiculos.css">
	<link rel="stylesheet" type="text/css" href="../css/global.css">
	</head>

	<body>
		<div align="center">
			<h1>Gerenciamento de Veiculos</h1>
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

		<%String contextPath = request.getContextPath().replace("/", "");%>
		
		<div>File Upload</div>
		<form method="post" action="cadastro/upload" enctype="multipart/form-data">
			Choose a file: 
			<input type="file" name="uploadFile"/>
			<input type="submit" value="Upload"/>
		</form>
		
		<br/>
		
		${requestScope.message}
		
		<br/>
		
		<h1>Files</h1>


	</body>
</html>