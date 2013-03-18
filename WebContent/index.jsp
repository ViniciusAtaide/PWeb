<!DOCTYPE html>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<v:modals />
<!-- busca redireciona o form para o path correspondente e nome aparece como campo na busca -->
<v:header titulo="Projeto - Pagina Principal" path="assets/css/" busca="music" nome="Música"/>

<div class="container">	
	<div class="pagination-centered">
		<h4>			
			<span class="text-error" id="error-message">${requestScope.error_message}</span>
			<span class="text-success" id="success-message">${requestScope.content_message}</span>
		</h4>
	</div>
	<v:menu />
	<div class="hero-unit span8">		
		<div class="span10">
			<div class="row">				
				<v:minipost tamanho="span8 pagination-centered" />										
			</div><!-- /row -->
			<div class="row">
				<v:topmusic tamanho="span8" />		
			</div><!-- row -->
		</div>		
		<p class="text-success pagination-centered" id="music-message">${requestScope.music_message}</p>
	</div> <!-- /hero unit -->	
</div> <!-- /container -->
<v:footer path="assets/js/"/>
</body>
</html>