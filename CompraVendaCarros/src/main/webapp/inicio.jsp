<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<fmt:bundle basename="message">
	    <head>
	        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	        <meta name="viewport" content="width=device-width, initial-scale=1.0">
	        <title><fmt:message key="page.title"/></title>
	        <link rel="stylesheet" href="css/global.css">
	    </head>
	    <body>
	        <%String contextPath = request.getContextPath().replace("/", ""); %>
	        <div class="topbar">
	            <ul id="links">
	                <li class="linkTopoEsquerda">
	                    <a href="/CompraVendaCarros/">
	                        <span id="titulo"><fmt:message key="topbar.title" /></span>
	                    </a>
	                </li>
	                <li class="linkTopoDireita">
	                    <a href="login.jsp"><fmt:message key="login.link" /></a>
	                </li>
	            </ul>
	        </div>
	        <section id="carros">
	            <div id="divFiltro">
	                <input type="text" name="Filtro" placeholder="<fmt:message key="filter.label" />" id="filtro">
	                <span id="legendaN"><fmt:message key="filter.count"/></span><span id="numero"></span>
	            </div>
	            <c:forEach var="veiculo" items="${requestScope.catalogo}">
	                <section class="box" onclick="location.href='login.jsp'">
	                    <div class="card">
	                        <div class="container">
	                            <img src="imagens/${veiculo.modelo}.jpg" alt="Carro">
	                        </div>
	                        <ul class="dadosCarro">
	                            <li class="modelo">${veiculo.modelo}</li>
	                            <li><fmt:message key="store.entity" />: ${veiculo.loja.nome}</li>
	                            <li>${veiculo.quilometragem}km</li>
	                            <li class="oferta">R$${veiculo.valor}</li>                    
	                        </ul>
	                    </div>
	                </section>
	            </c:forEach>
	        </section>
	        <script src="js/script.js"></script>
	    </body>
    </fmt:bundle>
</html>