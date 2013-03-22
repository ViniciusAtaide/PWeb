<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="tamanho" required="true" description="tamanho da div" %>
<%@ attribute name="player" description="presença do player" %>
<div class="${tamanho } corpo">
	<c:if test="${!empty result}">	
		<c:forEach items="${result}" var="musica">
			<h4>
				<a href="music.do?id=${musica.id}&action=show" data-toggle="modal">${musica.nome}</a>
			</h4>
			Autores:<br>
			<c:forEach items="${musica.autores }" var="autor">
				<a href="author.do?id=${autor.id}&action=show" data-toggle="modal">${autor.nome}</a>
			</c:forEach>
			<br>
			Estilo:
			<a href="style.do?id=${musica.estilo.id}&action=show">${musica.estilo.nome}</a>
					<br>
			Album:
			<a href="album.do?id=${musica.album.id}&action=show" data-toggle="modal">${musica.album.nome }</a><br>
			<audio src="${musica.caminhoarq }" controls onplay="$.ajax('music.do?action=play&id=${music.id}')">		
			</audio>				
		</c:forEach>
	</c:if>
	<c:if test="${music ne null }">
		<h3>Música</h3>
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
		<h3>Músicas</h3>
		<h4 class="text-info">Não há nenhuma música.</h4>
	</c:if>
	<c:if test="${empty result }">
		<c:if test="${!empty musics }">
			<h3>Músicas</h3>
			<c:forEach items="${musics}" var="musica">
				<p>
					<a href="music.do?id=${musica.id}&action=add"><i class="icon-play"></i></a>
					<a href="music.do?id=${musica.id}&action=show">${musica.nome}</a>*
					<small>
					<c:forEach items="${musica.autores }" var="autor">
						<a href="author.do?id=${autor.id}&action=show">${autor.nome}</a>
					</c:forEach>
					*
					<a href="style.do?id=${musica.estilo.id}&action=show">${musica.estilo.nome}</a>*
					<a href="album.do?id=${musica.album.id}&action=show">${musica.album.nome }</a>			 
				</p> </small>
				
				<c:if test="${user.login eq 'administrador' }">
				<div class=" pagination-centered">
					<a href="music.do?id=${musica.id}&action=delete" class="btn btn-danger">Deletar Música</a>
				</div>
				</c:if>
			</c:forEach>			
		</c:if>
	</c:if>
</div>