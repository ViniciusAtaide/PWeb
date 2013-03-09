<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<v:modals />

<div class="container pagination-centered">
<v:header titulo="Projeto - Pagina Principal" />
	<div class="hero-unit">
		<div class="row">
			<v:minipost tamanho="span2" />
			<v:musics tamanho="span2" />
			
			<div class="span2">
				<h3>Artistas</h3>
				<c:if test="${empty artist }">
					<h4 class="text-info">Não há nenhum Artista</h4>
				</c:if>
				
				<c:forEach items="${artists}" var="artista">
					<p>${artista.nome}</p>
					<p>${artista.sobre }</p>				
					<h3>
						<a href="artist.do?id=${artista.id}&action=show">${artista.nome}</a>
					</h3>
					<c:forEach items="${artista.estilos }" var="estilo">
						<a href="style.do?id=${estilo.id}&action=show">${estilo.nome}</a>
					</c:forEach>
					<br>				
					<br> 
					<c:forEach items="${albums }" var="album">
						<a href="album.do?id=${album.id }&action=show">${album.nome }</a>					
					</c:forEach>				
				</c:forEach>
			</div>
		</div>		
	</div>
	<p class="text-success pagination-centered" id="music-message">${requestScope.music_message}</p>
</div>
<v:footer />
</body>
</html>