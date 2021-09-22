<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>	
		<title>Lista de Veiculos</title>
		<link rel="stylesheet" href="veiculos.css">
		<link rel="stylesheet" type="text/css" href="global.css">
	</head>
	
	<body>
		
		<%String contextPath = request.getContextPath().replace("/", ""); %>
		<div class="topbar">
            <ul>
                <li class="linkTopoEsquerda">
                    <a href="${pageContext.request.contextPath}/admin">
                        <span id="titulo">CRUDS</span>
                    </a>
                </li>
                <li class="linkTopoDireita">
                    <!--<a href="login.jsp">Login</a>--> 
                    <a href="${pageContext.request.contextPath}/logout.jsp">Sair</a>
                </li>
            </ul>
        </div>
		<div align="center">
			<h1 class="label">Gerenciamento de Veiculos</h1>
			<a href="/<%=contextPath%>/veiculos/cadastro">Adicionar Novo Veículo</a>
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
						<th>Nome da Loja</th>
						<th>Ações</th>
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
							<td>${veiculo.loja.nome}</td>

						<td><a href="/<%= contextPath%>/veiculos/edicao?id=${veiculo.id}">Edição</a>
							&nbsp;&nbsp;&nbsp;&nbsp; <a
							href="/<%= contextPath%>/veiculos/remocao?id=${veiculo.id}"
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