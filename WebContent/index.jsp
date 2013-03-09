<!DOCTYPE html>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<v:modals></v:modals>
<div class="container pagination-centered">
<v:header titulo="Projeto - Pagina Principal"></v:header>

	<div class="hero-unit">
		<div class="row">
			<v:minipost tamanho="span5"></v:minipost>			
			<v:topmusics tamanho="span5"></v:topmusics>
			<c:if test="${user ne null }">
				<a class="btn btn-large btn-primary" href="#cadastromusica" data-toggle="modal">Adicionar Música</a>				
			</c:if>
		</div>
		<p class="text-success pagination-centered" id="music-message">${requestScope.music_message}</p>
	</div>	
</div>
<v:footer />
</body>
</html>