<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Compra e Venda de Veículos</title>
        <link rel="stylesheet" href="../css/global.css">
        <link rel="stylesheet" href="../css/comprar.css">
        <link rel="stylesheet" type="text/css" href="../slick/slick.css"/>
        <link rel="stylesheet" type="text/css" href="../slick/slick-theme.css"/>
        <link rel="stylesheet" href="../css/propostas.css">
				
    </head>
    <body>
        <%String contextPath = request.getContextPath().replace("/", ""); %>
        <div class="topbar">
            <ul id="links">
                <li class="linkTopoEsquerda">
                    <a href="${pageContext.request.contextPath}/clientes">
                        <span id="titulo">LataVelhaInc.</span>
                    </a>
                </li>
                <li class="nomeTopoDireita">
                    <span>Bem vindo: ${sessionScope.usuarioLogado.nome}</span>
                    <ul class="dropdown">
                        <li><a href="../logout">Sair</a></li>
                    </ul>
                </li>
                <li class="linkTopoDireita">
                    <a href="../proposta/listarPropostasCliente">Propostas</a>
                </li>
            </ul>
        </div>
        <section class="carro">
                <div class="fotos">                
                        <ul class="slider">
                            <c:forEach var = "i" begin = "1" end = "10">    
                            <li>
                                <img src="../imagens/fotos/${veiculo.modelo}/${i}.jpg" alt="Carro" />
                            </li>
                            </c:forEach>
                        </ul>
                </div>
            <div class="info">
                <c:set var="veiculo" value='${requestScope.veiculo}' />
                <ul class="dadosCarro">
                    <li class="nomeModelo">${veiculo.modelo} (${veiculo.ano}) - ${veiculo.quilometragem}km</li>
                    <li>Loja: ${veiculo.loja.nome}</li>
                    <li>Placa: ${veiculo.placa}</li>
                    <li>Chassi: ${veiculo.chassi}</li>
                    <li class="oferta">$ ${veiculo.valor}</li>
                </ul>
                <!--<c:choose>
                    <c:when test="${veiculo != null}">-->
                    <c:forEach var="proposta" items="${requestScope.listaPropostas}">            
                    	<c:if test ="${proposta.estado == 'ABERTO' && proposta.veiculo.id == veiculo.id}">
                    		<c:set var = "block_proposta" scope = "page" value = "True"/>
                    		<c:set var = "proposta_aberta" scope = "page" value = "${proposta}"/>
                        </c:if>   
					</c:forEach>
					<c:choose>
               			<c:when test="${pageScope.block_proposta == null}">
	                        <form action="../proposta/insereProposta?id_veiculo=${veiculo.id}&id_loja=${veiculo.loja.id}" method="post">
	                            <input id="pvalor" type="text" name="valor" placeholder="Proposta">
	                            <input id="proposta" type="submit" name="Proposta" value="Fazer Proposta">
                        	</form>
                        </c:when>
                        <c:otherwise>
                        	<div align="center">
								<h1 class="label">Proposta em aberto</h1>
							</div>
                       		<table class="propostas">
								<thead>
									<tr>
                        				<th>Foto</th>
                        				<th>Carro</th>
                        				<th>Valor</th>
                        				<th>Loja</th>
										<th>Proposta</th>
                        				<th>Status</th>
                        				<th class="acao"></th>
									</tr>
								</thead>

							<tbody>
								<tr class="proposta">
                            		<td><img src="../imagens/${pageScope.proposta_aberta.veiculo.modelo}.jpg" alt="Carro" height="80px" width="80px"></td>
                            		<td>${pageScope.proposta_aberta.veiculo.modelo}</td>
                            		<td>${pageScope.proposta_aberta.veiculo.valor}</td>
                            		<td>${pageScope.proposta_aberta.loja.nome}</td>
									<td>${pageScope.proposta_aberta.valor}</td>
                            		<td class="estado">${pageScope.proposta_aberta.estado}</td>
                            		<td class="acao">
                               			 <a id="remover" href="removerProposta?id=${pageScope.proposta_aberta.id}">CANCELAR</a>
                            		</td>
								</tr>
							</tbody>
							</table>
                       </c:otherwise> 	
                    </c:choose>
                    <!--</c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>-->
            </div>
            <div class="descricao">
                Sobre: ${veiculo.descricao}
            </div>
        </section>
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="../slick/slick.min.js"></script>
        <script src="../js/carrossel.js"></script>
    </body>
</html>