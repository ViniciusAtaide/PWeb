<!DOCTYPE html>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<v:modals />
<!-- busca redireciona o form para o path correspondente e nome aparece como campo na busca -->
<v:header titulo="Projeto - Musica ${music.nome }" path="assets/css/" busca="music" nome="Música"/>

<div class="container pagination-centered">
	<div class="hero-unit">
		<div class="row">
			<v:music tamanho="span10" />
		</div>	
		<p class="text-success pagination-centered" id="music-message">${requestScope.music_message}</p>
	</div>
</div>
<v:footer path="assets/js" />
</body>
</html>