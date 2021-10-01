<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
	<fmt:bundle basename="message">
	
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title><fmt:message key="upload.title"/></title>
		    <link rel="stylesheet" href="../css/global.css">
			<link rel="stylesheet" href="../css/inicio.css">
			<link rel="stylesheet" href="../css/lojas.css">
		</head>
		
		<body>
			<%
				String contextPath = request.getContextPath().replace("/", "");
			%>
			<div align="center">
				<h1><fmt:message key="upload.header"/></h1>
				<form method="post" action="uploadFile?id=${id}" enctype="multipart/form-data">
					<fmt:message key="upload.choose"/>: <input type="file" name="uploadFile" accept=".jpg" multiple/><input
						type="submit" value="Upload" />
				</form>
			</div>

			<div align="center">
				<h2><fmt:message key="upload.files"/></h2>
		
				<ul>
					<c:forEach var = "i" begin = "1" end = "${requestScope.num_files}">
						<li><a href="/<%=contextPath%>/imagens/${id}/${i}.jpg">${i}.jpg</a></li>
					</c:forEach>
				</ul>
			</div>
		</body>
	</fmt:bundle>

</html>