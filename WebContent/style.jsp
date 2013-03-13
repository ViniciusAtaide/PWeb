<!DOCTYPE html>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<v:modals />

<!-- busca redireciona o form para o path correspondente e nome aparece como campo na busca -->
<v:header titulo="Projeto - Estilo ${style.nome }" path="assets/css/" busca="style" nome="Estilo" />

<div class="container pagination-centered" >
	<div class="hero-unit">
		<div class="row">
 			<v:style tamanho="span10" /> 
 		</div>			
	</div>
	<p class="text-success pagination-centered" id="music-message">${requestScope.music_message}</p>
</div>
<v:footer path="assets/js/" />
</body>
</html>