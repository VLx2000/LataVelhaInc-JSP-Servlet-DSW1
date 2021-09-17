<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>	
		<title>Lista de clientes</title>
		<link rel="stylesheet" href="cliente/listaClientes.css">
	</head>

	<body>

		<%String contextPath = request.getContextPath().replace("/", ""); %>

		<div align="center">
			<h1>Gerenciamento de clientes</h1>
			<a href="/<%=contextPath%>/clientes/cadastro">Adicionar Nova Cliente</a>
		</div>
		<div align="center">
			<h2>Lista de clientes</h2>

			<table>
				<thead>
					<tr>
						<th>Email</th>
						<th>senha</th>
						<th>cpf</th>
						<th>nome</th>
						<th>telefone</th>
                        <th>sexo</th>
						<th>nascimento</th>
						<th>papel</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="cliente" items="${requestScope.listaClientes}">
						<tr>
							<td>${cliente.email}</td>
                            <td>${cliente.senha}</td>
                            <td>${cliente.CPF}</td>
                            <td>${cliente.nome}</td>
                            <td>${cliente.telefone}</td>
                            <td>${cliente.sexo}</td>
                            <td>${cliente.nascimento}</td>
                            <td>${cliente.papel}</td>
							<td>
								<a href="/<%=contextPath%>/clientes/remocao?CPF=${cliente.CPF}">Remover</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html> 