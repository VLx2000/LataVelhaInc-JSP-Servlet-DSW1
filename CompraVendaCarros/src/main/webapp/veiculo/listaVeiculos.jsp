<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>	
		<title>Lista de Veiculos</title>
		<link rel="stylesheet" href="veiculo/listaVeiculos.css">
	</head>
	
	<body>
		
		<%String contextPath = request.getContextPath().replace("/", ""); %>
		
		<div align="center">
			<h1>Gerenciamento de Veiculos</h1>
		</div>
		
		<div align="center">
			<h2>Lista de Veiculos</h2>
			
			<table>
				<thead>
					<tr>
						<th>Placa</th>
						<th>Modelo</th>
						<th>Chassi</th>
						<th>Quilometragem</th>
						<th>Descricao</th>
						<th>valor</th>
						<th>cnpj_loja</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="veiculo" items="${requestScope.listaVeiculos}">
						<tr>
							<td>${veiculo.placa}</td>
							<td>${veiculo.modelo}</td>
							<td>${veiculo.chassi}</td>
							<td>${veiculo.quilometragem}</td>
							<td>${veiculo.descricao}</td>
							<td>${veiculo.valor}</td>
							<td>${veiculo.cnpj_loja}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>