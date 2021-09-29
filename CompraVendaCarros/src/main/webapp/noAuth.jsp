<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
	<fmt:bundle basename="message">
	    <head>
	        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	        <title><fmt:message key="noauth.title"/></title>
	        <link href="../css/global.css" rel="stylesheet" type="text/css"/>
	        <link href="css/global.css" rel="stylesheet" type="text/css"/>
	    </head>
	    <body>
	        <h1><fmt:message key="noauth.title"/></h1>
	        <c:if test="${mensagens.existeErros}">
	            <div id="erro">
	                <ul>
	                    <c:forEach var="erro" items="${mensagens.erros}">
	                        <li> ${erro} </li>
	                        </c:forEach>
	                </ul>
	            </div>
	        </c:if>
	        <div align="center">
	            <a id="voltar" href="${pageContext.request.contextPath}/index.jsp">Voltar para a página inicial</a>
	        </div>
	    </body>
    </fmt:bundle>
</html>