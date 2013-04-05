<!DOCTYPE html>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<v:modals />
<!-- busca redireciona o form para o path correspondente e nome aparece como campo na busca -->
<v:header titulo="Projeto - Musica ${music.nome }" path="assets/css/" busca="music" nome="M�sica"/>
<div class="container pagination-centered">
	<v:menu />
	<div class="hero-unit span8">		
		<div class="span10">																							
			<div class="row">
				<v:music tamanho="span8"/>		
			</div><!-- row -->
		</div>		
		<p class="text-success pagination-centered" id="music-message">${requestScope.music_message}</p>
	</div> <!-- /hero unit -->	
</div> <!-- /container -->
<v:footer path="assets/js" />
</body>
</html>