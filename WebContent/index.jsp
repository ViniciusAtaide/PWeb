<!DOCTYPE html>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<v:modals />
<!-- busca redireciona o form para o path correspondente e nome aparece como campo na busca -->
<v:header titulo="Projeto - Pagina Principal" path="assets/css/" busca="music" nome="Música"/>

<div class="container pagination-centered">
		<div class="pagination-centered">
			<h4>			
				<span class="text-error" id="error-message">${requestScope.error_message}</span>
				<span class="text-success" id="success-message">${requestScope.content_message}</span>
			</h4>
		</div>
	<div class="hero-unit">
		<div class="row">
			<v:minipost tamanho="span5" />			
			<v:topmusic tamanho="span5" />
					
		</div><!-- /row -->		
		<p class="text-success pagination-centered" id="music-message">${requestScope.music_message}</p>
	</div> <!-- /hero unit -->	
</div> <!-- /container -->
<v:footer path="assets/js/"/>
</body>
</html>