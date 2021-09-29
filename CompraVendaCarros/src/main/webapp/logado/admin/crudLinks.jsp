<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
	<fmt:bundle basename="message">
	    <head>
	        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	        <title><fmt:message key="page.title"/></title>
	        <link rel="stylesheet" href="css/global.css">
	    </head>
	    <body>
	        <div class="topbar">
	            <ul>
	                <li class="linkTopoEsquerda">
	                    <a href="admin">
	                        <span id="titulo"><fmt:message key="topbar.title"/></span><span id="admin">admin</span>
	                    </a>
	                </li>
	                <li class="linkTopoDireita">
	                    <a href="logout"><fmt:message key="user.logout"/></a>
	                </li>
	            </ul>
	        </div>
	        <section id="crudLinks">
	            <div class="crud">
	                <a href="admin/listaClientes"><fmt:message key="customer.crudname"/></a>
	            </div>
	            <div class="crud">
	                <a href="admin/listaLojas"><fmt:message key="store.crudname"/></a>
	            </div>
	        </section>
	    </body>
    </fmt:bundle>
</html>