<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<v:modals />

<!-- busca redireciona o form para o path correspondente e nome aparece como campo na busca -->
<v:header titulo="Projeto - Painel de Controle" path="assets/css/" busca="music" nome="Música" />
<div class="container pagination-centered">
	<div class="hero-unit">
		<div class="row">
			<v:minipost tamanho="span3" />
			<v:music tamanho="span3" />
			<v:author tamanho="span2" />	
			<v:style tamanho="span2" />							
		</div>
		<p class="text-success pagination-centered" id="music-message"> ${requestScope.music_message } </p>		
	</div>
</div>
<v:footer path="assets/js/"/>
</body>
</html>