<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="tamanho" required="true" description="tamanho da div" %>
<div class="${tamanho } corpo">
	<c:if test="${user ne null }">
		<div class="row">
			<h3>Usuário</h3>
		
			<p><img src="${usu.caminhofoto }" alt="Foto do Usuário" height="200" width="200"/></p>
			<h4>${usu.login }</h4>
			<p>Data em que logou pela primeira vez: ${usu.datacriado }</p>
		</div>		
		<div class="row">	
			<p>MiniPost desse usuário:</p>
			<c:forEach items="${usu.miniposts}" var="minipost">
				<p class="small">
					${minipost.titulo }
				<p>
			</c:forEach>		
			<p>Musicas desse usuario:</p>
			<c:forEach items="${usu.musicas }" var="music">
				<p>Musica</p>
					<audio src="${music.caminhoarq }" controls onplay="$.ajax('music.do?action=play&id=${musica.id }');"> </audio>
					<a href="music.do?action=show&id=${music.id }" >${music.nome }</a><br>
				</p>				
			</c:forEach>							
		</div>
	</c:if>
</div>