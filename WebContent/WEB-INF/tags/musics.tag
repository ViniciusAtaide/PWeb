<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="tamanho" required="true" description="tamanho da div" %>
<div class="${tamanho }">
	<h3>Musicas</h3>
	<c:if test="${empty musics}">
		<h4 class="text-info">Não há nenhuma música (ainda ;D)</h4>
	</c:if>
	<c:forEach items="${musics}" var="musica">
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
		<audio controls src="${musica.caminhoarq }" onplay="music.do?action=play&id=${musica.id }">	</audio>					
	</c:forEach>
</div>
