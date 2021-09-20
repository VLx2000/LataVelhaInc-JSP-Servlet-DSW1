<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>	
		<title>Lista de clientes</title>
		<link rel="stylesheet" href="cliente/listaClientes.css">
		<link rel="stylesheet" href="../global.css">
	</head>

	<body>

		<%String contextPath = request.getContextPath().replace("/", ""); %>
		<div class="topbar">
            <ul>
                <li class="linkTopoEsquerda">
                    </span><a href="/CompraVendaCarros/">LataVelhaInc.</a>
                </li>
                <li class="linkTopoDireita">
                    <!--<a href="login.jsp">Login</a>--> 
                    <a href="crudLinks.jsp">Login</a>
                </li>
            </ul>
        </div>
		<div align="center">
			<h1>Gerenciamento de clientes</h1>
			<a href="/<%=contextPath%>/clientes/cadastro">Adicionar Nova Cliente</a>
		</div>
		<div align="center">
			<h2>Lista de clientes</h2>

			<table>
				<thead>
					<tr>
						<th>Id</th>
						<th>Email</th>
						<th>senha</th>
						<th>cpf</th>
						<th>nome</th>
						<th>telefone</th>
                        <th>sexo</th>
						<th>nascimento</th>
						<th>papel</th>
						<th>Ações</th>
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
							<td><a href="/<%= contextPath%>/clientes/edicao?id=${cliente.id}">Edição</a>
							&nbsp;&nbsp;&nbsp;&nbsp; <a
							href="/<%= contextPath%>/clientes/remocao?id=${cliente.id}"
							onclick="return confirm('Tem certeza de que deseja excluir este item?');">
								Remoção </a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html> 