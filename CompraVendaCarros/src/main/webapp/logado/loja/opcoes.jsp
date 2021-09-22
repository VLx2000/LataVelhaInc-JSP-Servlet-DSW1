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
                    <a href="${pageContext.request.contextPath}/lojas">
                        <span id="titulo">LataVelhaInc. </span><span id="corporativo">Corporativo</span>
                    </a>
                </li>
                <li class="nomeTopoDireita">
                    <!--<a href="login.jsp">Login</a>--> 
                    <span>Loja: ${sessionScope.lojaLogada.nome}</span>
                </li>
            </ul>
        </div>
        <section id="crudLinks">
            <div class="crud">
                <a href="lojas/listarVeiculos">Lista de Veículos</a>
            </div>
            <div class="crud">
                <a href="lojas/listarPropostas">Lista de Propostas</a>
            </div>
        </section>
    </body>
</html>