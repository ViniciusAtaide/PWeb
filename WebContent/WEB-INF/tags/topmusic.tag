<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="tamanho" required="true" description="tamanho da div" %>
<div class="${tamanho }">
	<h3>Top Musicas</h3>
	<c:if test="${user ne null }">
		<a class="btn btn-large btn-primary" href="#cadastromusica" data-toggle="modal">Adicionar Música</a>				
	</c:if>
	<c:if test="${empty topmusics}">
		<h4 class="text-info">Não há nenhuma música</h4>
	</c:if>
	<c:forEach items="${topmusics}" var="musica">
		<h3>
			<a href="music.do?id=${musica.id}&action=show" data-toggle="modal">${musica.nome}</a>
		</h3>
		<c:forEach items="${musica.autores }" var="autor">
			<a href="author.do?id=${autor.id}&action=show" data-toggle="modal">${autor.nome}</a>
		</c:forEach>
		<br>
		<a href="style.do?id=${musica.estilo.id}&action=show">${musica.estilo.nome}</a>
		<br>
		<a href="album.do?id=${musica.album.id}&action=show" data-toggle="modal">${musica.album.nome }</a><br>
		<audio src="${musica.caminhoarq }" controls onplay="$.ajax('music.do?action=play&id=${musica.id }');" >		
			Seu browser não tem suporte ao html5 audio
		</audio>
		<br>
		<c:if test="${user.login eq 'administrador' }">
			<a href="music.do?id=${musica.id}&action=delete" class="btn btn-danger">Deletar Música</a>
		</c:if>
	</c:forEach>
		
</div>

