<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<table border="1">
	<caption>
		<c:choose>
			<c:when test="${loja != null}">
            	<fmt:message key="object.update"/>
            </c:when>
			<c:otherwise>
            	<fmt:message key="object.insert"/>
            </c:otherwise>
		</c:choose>
	</caption>
	<c:if test="${loja != null}">
		<input type="hidden" name="id" value="${loja.id}" />
	</c:if>
	<tr>
		<td><label for="nome"><fmt:message key="store.name"/></label></td>
		<td><input type="text" id="nome" name="nome" size="30"
			required value="${loja.nome}" /></td>
	</tr>
	<tr>
		<td><label for="email"><fmt:message key="store.email"/></label></td>
		<td><input type="text" id="email" name="email" size="30" required
			value="${loja.email}" /></td>
	</tr>
	<tr>
		<td><label for="senha"><fmt:message key="store.password"/></label></td>
		<td><input type="text" id="senha" name="senha" size="30" required
			value="${loja.senha}" /></td>
	</tr>
	<tr>
		<td><label for="CNPJ"><fmt:message key="store.cnpj"/></label></td>
		<td><input type="text" id="CNPJ" name="CNPJ" size="30" required
			value="${loja.CNPJ}" /></td>
	</tr>
	<tr>
		<td><label for="descricao"><fmt:message key="store.description"/></label></td>
		<td><input type="text" id="descricao" name="descricao" required
			size="50" value="${loja.descricao}" /></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="<fmt:message key="object.save"/>" /></td>
	</tr>
</table>