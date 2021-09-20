<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compra e Venda de Veículos</title>
        <link rel="stylesheet" href="global.css">
    </head>
    <body>
        <div class="topbar">
            <ul>
                <li class="linkTopoEsquerda">
                    <span>LataVelhaInc.</span>
                </li>
                <li class="linkTopoDireita">
                    <!--<a href="login.jsp">Login</a>--> 
                    <a href="crudLinks.jsp">Login</a>
                </li>
            </ul>
        </div>
        <section id="carros">
            <div id="divFiltro">
                <input type="text" name="Filtro" placeholder="filtrar modelo..." id="filtro">
            </div>
            <section class="box">
                <div class="card">
                    <img src="imagens/fusca.jpg" alt="fusca">
                    <ul class="dadosCarro">
                        <li class="modelo" value="teste">Frusca</li>
                        <li>Marca: Wolksvagen</li>
                        <li>Ano: 2050</li>
                        <li>Estado: Novo</li>
                        <li class="oferta"><br>$200.000</li>                    
                    </ul>
                </div>
            </section>
        </section>
        <script src="script.js"></script>
    </body>
</html>