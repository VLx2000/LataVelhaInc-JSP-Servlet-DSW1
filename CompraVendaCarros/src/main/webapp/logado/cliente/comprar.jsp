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
        <link rel="stylesheet" href="../css/global.css">
        <link rel="stylesheet" href="../css/comprar.css">
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
                <li class="nomeTopoDireita">
                    <span>Bem vindo: ${sessionScope.usuarioLogado.nome}</span>
                    <ul class="dropdown">
                        <li><a href="logout">Sair</a></li>
                    </ul>
                </li>
                <li class="linkTopoDireita">
                    <a href="cliente/listarPropostas">Propostas</a>
                </li>
            </ul>
        </div>
        <section class="carro">
            <div class="nomeCarro">
                o titulo e nome do carro vai aqui
            </div>
            <div class="fotos">
                as fotos vao aqui
            </div>
            <div class="info">
                as informaçoes do carro preço e nova proposta vao aqui
            </div>
        </section>
    </body>
</html>