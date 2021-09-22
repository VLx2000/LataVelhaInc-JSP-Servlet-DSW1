<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Compra e Venda de Veículos</title>
        <link rel="stylesheet" href="global.css">
    </head>
    <body>
        <%String contextPath = request.getContextPath().replace("/", ""); %>
        <div class="topbar">
            <ul id="links">
                <li class="linkTopoEsquerda">
                    <a href="${pageContext.request.contextPath}/clientes">
                        <span id="titulo">LataVelhaInc.</span>
                    </a>
                </li>
                <li class="linkTopoDireita">
                    <a href="${pageContext.request.contextPath}/logout.jsp">Sair</a>
                </li>
                <li class="nomeTopoDireita">
                    <!--<a href="login.jsp">Login</a>--> 
                    <span>Bem vindo: ${sessionScope.usuarioLogado.nome}</span>
                </li>
            </ul>
        </div>
        <section id="carros">
            <div id="divFiltro">
                <input type="text" name="Filtro" placeholder="filtrar por modelo..." id="filtro">
                <p id="numero"></p>
            </div>
            <c:forEach var="veiculo" items="${requestScope.catalogo}">
                <section class="box" onclick="Clicavel('${veiculo.placa}')">
                    <div class="card">
                        <div class="container">
                            <img src="imagens/${veiculo.modelo}.jpg" alt="Carro">
                        </div>
                        <ul class="dadosCarro">
                            <li class="modelo">${veiculo.modelo}</li>
                            <li>Loja: ${veiculo.loja.nome}</li>
                            <li>${veiculo.quilometragem}km</li>
                            <li class="oferta">$ ${veiculo.valor}</li>                    
                        </ul>
                    </div>
                </section>
            </c:forEach>
        </section>
        <script src="${pageContext.request.contextPath}/script.js"></script>
    </body>
</html>