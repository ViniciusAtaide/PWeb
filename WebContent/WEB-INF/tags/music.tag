<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="tamanho" required="true" description="tamanho da div" %>
<%@ attribute name="player" description="presença do player" %>
<div class="${tamanho }">
	<c:if test="${empty result}">
	
		<h3>Resultado da busca</h3>
	
		<c:forEach items="${result}" var="musica">
			<h4>
				<a href="music.do?id=${musica.id}&action=show" data-toggle="modal">${musica.nome}</a>
			</h4>
			<c:forEach items="${musica.autores }" var="autor">
				<a href="author.do?id=${autor.id}&action=show" data-toggle="modal">${autor.nome}</a>
			</c:forEach>
			<br>
			<a href="style.do?id=${musica.estilo.id}&action=show">${musica.estilo.nome}</a>
					<br>
			<a href="album.do?id=${musica.album.id}&action=show" data-toggle="modal">${musica.album.nome }</a><br>
			<audio src="${musica.caminhoarq }" controls onplay="$.ajax('music.do?action=play&id=${music.id}')">		
			</audio>				
		</c:forEach>
	</c:if>
	<c:if test="${music ne null }">
		<h4>
			<a href="music.do?id=${music.id}&action=show" data-toggle="modal">${music.nome}</a>
		</h4>
		<c:forEach items="${music.autores }" var="autor">
			<a href="author.do?id=${autor.id}&action=show" data-toggle="modal">${autor.nome}</a>
		</c:forEach>
		<br>
		<a href="style.do?id=${music.estilo.id}&action=show">${music.estilo.nome}</a>
				<br>
		<a href="album.do?id=${music.album.id}&action=show" data-toggle="modal">${music.album.nome }</a><br>
		<audio src="${music.caminhoarq }" controls onplay="$.ajax('music.do?action=play&id=${music.id}')">		
		</audio>
	</c:if>
	<c:if test="${empty musics }">
		<h4 class="text-info">Não há nenhuma música.</h4>
	</c:if>
	<c:if test="${!empty musics }">
		<c:forEach items="${musics}" var="musica">		
			<h4>
				<a href="music.do?id=${musica.id}&action=show" data-toggle="modal">${musica.nome}</a>
			</h4>
			<c:forEach items="${musica.autores }" var="autor">
				<a href="author.do?id=${autor.id}&action=show" data-toggle="modal">${autor.nome}</a>
			</c:forEach>
			<br>
			<a href="style.do?id=${musica.estilo.id}&action=show">${musica.estilo.nome}</a>
					<br>
			<a href="album.do?id=${musica.album.id}&action=show" data-toggle="modal">${musica.album.nome }</a><br>
			<c:if test="${player == true }">
			<audio src="${musica.caminhoarq }" controls onplay="$.ajax('music.do?action=play&id=${music.id}')">		
			</audio>
			</c:if>				
		</c:forEach>
	</c:if>
</div>