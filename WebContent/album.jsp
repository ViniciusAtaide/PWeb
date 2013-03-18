<!DOCTYPE html>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<v:modals />

<!-- busca redireciona o form para o path correspondente e nome aparece como campo na busca -->
<v:header titulo="Projeto - Album ${Album.nome }" path="assets/css/" busca="album" nome="Album" />
<div class="container pagination-centered">
	<div class="hero-unit span8">		
		<div class="span10">																							
			<div class="row">
				<v:album tamanho="span8" />		
			</div><!-- row -->
		</div>		
		<p class="text-success pagination-centered" id="music-message">${requestScope.music_message}</p>
	</div> <!-- /hero unit -->	
</div>
<v:footer path="assets/js/" />
</body>
</html>