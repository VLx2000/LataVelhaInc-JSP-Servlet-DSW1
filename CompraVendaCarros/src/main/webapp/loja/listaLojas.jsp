<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>	
		<title>Lista de Lojas</title>
		<link rel="stylesheet" href="loja/listaLojas.css">
	</head>
	
	<body>
		
		<%String contextPath = request.getContextPath().replace("/", ""); %>
		
		<div align="center">
			<h1>Gerenciamento de Lojas</h1>
		</div>
		
		<div align="center">
			<h2>Lista de Lojas</h2>
			
			<table>
				<thead>
					<tr>
						<th>Nome</th>
						<th>Email</th>
						<th>Senha</th>
						<th>CNPJ</th>
						<th>Descrição</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="loja" items="${requestScope.listaLojas}">
						<tr>
							<td>${loja.nome}</td>
							<td>${loja.email}</td>
							<td>${loja.senha}</td>
							<td>${loja.CNPJ}</td>
							<td>${loja.descricao}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>