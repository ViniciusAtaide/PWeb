<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="tamanho" required="true" description="tamanho da div" %>

<div class="${tamanho } corpo">
	<h3 class="pagination-centered">Top Musicas</h3>	
	<c:if test="${empty topmusics}">
		<h4 class="text-info pagination-centered">Não há nenhuma música</h4>
	</c:if>
	<c:forEach items="${topmusics}" var="musica">
		<p>
			<c:if test="${!empty musica.caminhoarq }">
				<audio src="${musica.caminhoarq }" controls onplay="$.ajax('music.do?action=play&id=${musica.id }')">
					Seu player não está pronto para HTML5
				</audio>
			</c:if>
					
			<a href="music.do?id=${musica.id}&action=show">${musica.nome}</a>*
			<small>
			<c:forEach items="${musica.autores }" var="autor">
				<a href="author.do?id=${autor.id}&action=show">${autor.nome}</a>
			</c:forEach>
			*
			<a href="style.do?id=${musica.estilo.id}&action=show">${musica.estilo.nome}</a>*

			<a href="album.do?id=${musica.album.id}&action=show">${musica.album.nome }</a>						

			<a href="album.do?id=${musica.album.id}&action=show">${musica.album.nome }</a>			 

		</p> </small>
		
		<c:if test="${user.login eq 'administrador' }">
		<div class=" pagination-centered">
			<a href="music.do?id=${musica.id}&action=delete" class="btn btn-danger">Deletar Música</a>
		</div>
		</c:if>
	</c:forEach>
		
</div>

