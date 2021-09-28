<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>	
		<title>Lista de Veiculos</title>
		<link rel="stylesheet" type="text/css" href="css/global.css">
	</head>
	
	<body>
		
		<%String contextPath = request.getContextPath().replace("/", ""); %>
		<div class="topbar">
            <ul>
                <li class="linkTopoEsquerda">
                    <a href="${pageContext.request.contextPath}/admin">
                        <span id="titulo">LataVelhaInc. </span><span id="admin">admin</span>
                    </a>
                </li>
                <li class="linkTopoDireita">
                    <!--<a href="login.jsp">Login</a>--> 
                    <a href="${pageContext.request.contextPath}/logout">Sair</a>
                </li>
            </ul>
        </div>
		<div align="center">
			<h1 class="label">Lista de Veiculos</h1>
		</div>
		
		<div align="center">
			
			<table>
				<thead>
					<tr>
						<th>Placa</th>
						<th>Modelo</th>
						<th>Chassi</th>
						<th>Ano</th>
						<th>Quilometragem</th>
						<th>Descricao</th>
						<th>valor</th>
						<th>Nome da Loja</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="veiculo" items="${requestScope.listaVeiculos}">
						<tr>
							<td>${veiculo.placa}</td>
							<td>${veiculo.modelo}</td>
							<td>${veiculo.chassi}</td>
							<td>${veiculo.ano}</td>
							<td>${veiculo.quilometragem}</td>
							<td>${veiculo.descricao}</td>
							<td>${veiculo.valor}</td>
							<td>${veiculo.loja.nome}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>