<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<table border="1">
	<caption>
		<c:choose>
			<c:when test="${cliente != null}">
            	<fmt:message key="object.update"/>
            </c:when>
			<c:otherwise>
            	<fmt:message key="object.insert"/>
            </c:otherwise>
		</c:choose>
	</caption>
	<c:if test="${cliente != null}">
		<input type="hidden" name="id" value="${cliente.id}" />
	</c:if>
	<tr>
		<td><label for="nome"><fmt:message key="customer.name"/></label></td>
		<td><input type="text" id="nome" name="nome" size="30"
			required value="${cliente.nome}" /></td>
	</tr>
	<tr>
		<td><label for="email"><fmt:message key="customer.email"/></label></td>
		<td><input type="text" id="email" name="email" size="30" required
			value="${cliente.email}" /></td>
	</tr>
	<tr>
		<td><label for="senha"><fmt:message key="customer.password"/></label></td>
		<td><input type="text" id="senha" name="senha" size="30" required
			value="${cliente.senha}" /></td>
	<tr>
		<td><label for="CPF"><fmt:message key="customer.ssn"/></label></td>
		<td><input type="text" id="CPF" name="CPF" size="30"
			required value="${cliente.CPF}" /></td>
	</tr>
	<tr>
		<td><label for="nascimento"><fmt:message key="customer.birth"/></label></td>
		<td><input type="text" id="nascimento" name="nascimento" size="30" required
			value="${cliente.nascimento}" /></td>
	</tr>
	<tr>
		<td><label for="telefone"><fmt:message key="customer.phone"/></label></td>
		<td><input type="text" id="telefone" name="telefone" size="30" required
			value="${cliente.telefone}" /></td>
	</tr>
	<tr>
		<td><label for="sexo"><fmt:message key="customer.gender"/></label></td>
		<td><input type="text" id="sexo" name="sexo" size="30" required
			value="${cliente.sexo}" /></td>
	</tr>
	<tr>
		<td><label for="papel"><fmt:message key="customer.paper"/></label></td>
		<td>
			<select name="papel">
				<option value="ADMIN" ${cliente.papel == "ADMIN" ? 'selected="selected"' : ''}>ADMIN</option>
				<option value="USER" ${cliente.papel == "USER" ? 'selected="selected"' : ''}>USER</option>
			</select>			
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="<fmt:message key="object.save"/>"/></td>
	</tr>
</table>