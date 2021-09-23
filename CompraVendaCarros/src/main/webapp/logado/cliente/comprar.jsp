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
                <ul class="dadosCarro">
                    <li class="nomeModelo">${veiculo.modelo} (${veiculo.ano}) - ${veiculo.quilometragem}km</li>
                </ul>
            </div>
            <div class="fotos">
                <div class="container">
                    <img src="../imagens/fotos/${veiculo.modelo}.jpg" alt="Carro">
                </div>
            </div>
            <div class="info">
                <c:set var="veiculo" value='${requestScope.veiculo}' />
                <ul class="dadosCarro">
                    <li>Loja: ${veiculo.loja.nome}</li>
                    <li>Placa: ${veiculo.placa}</li>
                    <li>Chassi: ${veiculo.chassi}</li>
                    <li class="oferta">$ ${veiculo.valor}</li>
                </ul>
                <!--<c:choose>
                    <c:when test="${veiculo != null}">-->
                        <form action="../proposta/Comprar?id=${veiculo.id}" method="post">
                            <input id="comprar" type="submit" name="Comprar" value="Comprar">
                        </form>
                        <form action="../proposta/insereProposta?id=${veiculo.id}" method="post">
                            <input id="pvalor" type="text" name="valor" placeholder="Proposta">
                            <input id="proposta" type="submit" name="Proposta" value="Fazer Proposta">
                        </form>
                    <!--</c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>-->
            </div>
            <div class="descricao">
                Sobre: ${veiculo.descricao}
            </div>
        </section>
    </body>
</html>