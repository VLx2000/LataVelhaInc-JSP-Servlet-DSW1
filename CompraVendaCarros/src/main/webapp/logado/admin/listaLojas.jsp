<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>	
		<title>Lista de Lojas</title>
		<link rel="stylesheet" href="lojas.css">
		<link rel="stylesheet" type="text/css" href="../global.css">
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
		<div class="" align="center">
			<h1 class="label">Gerenciamento de Lojas</h1>
		</div>
		
		<div align="center">
			<h3>Lista de Lojas</h3>
			
			<table>
				<thead>
					<tr>
						<th>Id</th>
						<th>Nome</th>
						<th>Email</th>
						<th>Senha</th>
						<th>CNPJ</th>
						<th>Descrição</th>
						<th>Ações</th>
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
							<td><a href="/<%= contextPath%>/admin/edicaoLoja?id=${loja.id}">Edição</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="/<%= contextPath%>/admin/remocaoLoja?id=${loja.id}"
								onclick="return confirm('Tem certeza de que deseja excluir este item?');">
									Remoção </a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="adiciona">
				<a href="/<%=contextPath%>/admin/cadastroLoja">Adicionar Nova Loja</a>
			</div>
		</div>
	</body>
</html>