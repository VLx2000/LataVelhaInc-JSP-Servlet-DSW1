<%@ page contentType="text/html" pageEncoding="UTF-8"%>

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
                    <a href="${pageContext.request.contextPath}/admin">
                        <span id="titulo">LataVelhaInc. </span><span id="admin">admin</span>
                    </a>
                </li>
                <li class="linkTopoDireita">
                    <a href="logout">Sair</a>
                </li>
            </ul>
        </div>
        <section id="crudLinks">
            <div class="crud">
                <a href="admin/listaClientes">CRUD Clientes</a>
            </div>
            <div class="crud">
                <a href="admin/listaLojas">CRUD Lojas</a>
            </div>
            <div class="crud">
                <a href="veiculos">CRUD Veiculos</a>
            </div>
        </section>
    </body>
</html>