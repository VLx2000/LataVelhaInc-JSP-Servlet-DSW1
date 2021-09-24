<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<fmt:bundle basename="message">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><fmt:message key="page.title" /></title>
        <link href="css/global.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1 class="tituloLogin">LataVelhaInc.</h1>
        <c:if test="${mensagens.existeErros}">
            <div id="erro">
                <ul>
                    <c:forEach var="erro" items="${mensagens.erros}">
                        <li> ${erro} </li>
                        </c:forEach>
                </ul>
            </div>
        </c:if>
        <div class="boxLogin">
        	<form method="post" action="login">
	        	<label class="labelLogin">
		       		<fmt:message key="user.login" />:
			       	<input class="camposLogin" type="text" name="login"
			                              value="${param.login}"/>
		       	</label>
        		
	        	<label>
	        		<fmt:message key="user.password" />:
	        		<input class="camposLogin" type="password" name="senha" />
	            </label>
	
	        	<input class="botaoLogin" type="submit" name="bOK" value="<fmt:message key="user.login"/>">
	
	        </form>
        </div>
    </body>
</fmt:bundle>
</html>