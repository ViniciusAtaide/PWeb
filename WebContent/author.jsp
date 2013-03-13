<!DOCTYPE html>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>

<!-- busca redireciona o form para o path correspondente e nome aparece como campo na busca -->
<v:header titulo="Projeto - Autor ${author.nome }" path="assets/css/" busca="author" nome="Autor"/>
<div class="container pagination-centered">
	<div class="hero-unit">
		<div class="row">
			<v:author tamanho="span10" />
		</div>
		<p class="text-success pagination-centered" id="music-message">${requestScope.music_message}</p>
	</div>	
</div> <!-- /container -->
</body>
</html>