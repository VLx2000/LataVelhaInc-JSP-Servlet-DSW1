<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>File Upload Demo</title>
    <link rel="stylesheet" href="../css/global.css">
	<link rel="stylesheet" href="../css/inicio.css">
	<link rel="stylesheet" href="../css/lojas.css">
</head>

<body>
	<%
		String contextPath = request.getContextPath().replace("/", "");
	%>
	<div align="center">
		<h1>File Upload</h1>
		<form method="post" action="uploadFile?id=${id}" enctype="multipart/form-data">
			Choose a file: <input type="file" name="uploadFile" /><input
				type="submit" value="Upload" />
		</form>
	</div>
	<br />
	
	${requestScope.message}
	
	<br/>
	<div align="center">
		<h2>Files</h2>

		<ul>
			<!--<c:forEach var="file" items="${requestScope.filelist}">
				<li><a href="/<%=contextPath%>/imagens/${id}/${file}">${file}</a></li>
			</c:forEach>-->
			<c:forEach var = "i" begin = "1" end = "10">
				<li><a href="/<%=contextPath%>/imagens/${id}/${i}.jpg">${i}.jpg</a></li>
			</c:forEach>
		</ul>
	</div>
</body>

</html>