<!DOCTYPE html>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<v:modals />
<!-- busca redireciona o form para o path correspondente e nome aparece como campo na busca -->
<v:header titulo="Projeto - Pagina Principal" path="assets/css/" busca="music" nome="M�sica"/>
<div class="container pagination-centered">
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