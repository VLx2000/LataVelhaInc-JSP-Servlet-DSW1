<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<table border="1">
	<caption>
		<c:choose>
			<c:when test="${livro != null}">
            	Edição
            </c:when>
			<c:otherwise>
            	Cadastro
            </c:otherwise>
		</c:choose>
	</caption>
	<tr>
		<td><label for="nome">Nome</label></td>
		<td><input type="text" id="nome" name="nome" size="30"
			required value="${cliente.nome}" /></td>
	</tr>
	<tr>
		<td><label for="email">Email</label></td>
		<td><input type="text" id="email" name="email" size="30" required
			value="${cliente.email}" /></td>
	</tr>
	<tr>
		<td><label for="senha">Senha</label></td>
		<td><input type="text" id="senha" name="senha" size="30" required
			value="${cliente.senha}" /></td>
	<tr>
		<td><label for="CPF">cpf</label></td>
		<td><input type="text" id="CPF" name="CPF" size="30"
			required value="${cliente.CPF}" /></td>
	</tr>
	<tr>
		<td><label for="nascimento">nascimento</label></td>
		<td><input type="text" id="nascimento" name="nascimento" size="30" required
			value="${cliente.nascimento}" /></td>
	</tr>
	<tr>
		<td><label for="telefone">telefone</label></td>
		<td><input type="text" id="telefone" name="telefone" size="30" required
			value="${cliente.telefone}" /></td>
	</tr>
	<tr>
		<td><label for="sexo">sexo</label></td>
		<td><input type="text" id="sexo" name="sexo" size="30" required
			value="${cliente.sexo}" /></td>
	</tr>
	<tr>
		<td><label for="papel">papel</label></td>
		<td>
			<select name="papel">
				<option value="ADMIN" ${usuario.papel == "ADMIN" ? 'selected="selected"' : ''}>ADMIN</option>
				<option value="USER" ${usuario.papel == "USER" ? 'selected="selected"' : ''}>USER</option>
			</select>			
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit"
			value="<fmt:message key="save.link" />" /></td>
	</tr>
</table>