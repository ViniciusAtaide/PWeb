<!DOCTYPE html>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<v:modals></v:modals>

<div class="container pagination-centered">
<v:header titulo="Projeto - Pagina Principal"></v:header>
<div class="navbar">
	<div class="navbar-inner">
		<div class="offset4">
			<ul class="nav nav-pills">
				<li><a href="index.jsp"><i class="icon-home"></i>Home</a></li>
				<li class="active"><a href="music.jsp"><i
						class="icon-music"></i>Musicas</a></li>
				<li><a href="style.jsp"><i class="icon-star"></i>Estilos</a></li>
				<li><a href="author.jsp"><i class="icon-user"></i>Autores</a></li>
				<c:if test="${user.login eq 'administrador' }">
					<li><a href="user.jsp">Usuários</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>

<div class="container">
	<div class="hero-unit">
		<div class="row">
			<div class="span8">
			<c:if test="${music ne null }">
				<h2 class="text-center">Musica Escolhida</h2>			
				<h3>${music.titulo}</h3>
				<c:forEach items="${music.autores }" var="autor">
					${autor.nome }: ${autor.sobre }							
				</c:forEach>
				<c:forEach items="${music.estilo }" var="estilo">
					${estilo.nome }: ${estilo.sobre }				
				</c:forEach>
				<c:forEach items="${music.minposts }" var="minipost">
					${minipost.titulo }: ${minipost.conteudo } às ${minipost.datapostado }				
				</c:forEach>
			</c:if>	
				<h3 class="text-center">Musicas</h3>
				<c:forEach items="${musicas}" var="musica">
					<p>
						<a href="musica.do?action=show#id=${musica.id}">${musica.nome}</a>
					</p>
					<c:forEach items="${musica.autores }" var="autor">
						<a href="autor.do?action=show#id=${autor.id} ">${autor.nome}</a>
					</c:forEach>
					<c:if test="${user.id eq musica.usuario.id }">
						<a href="musica.do?action=delete#id=${musica.id }"
							class="btn btn-danger">Deletar Musica</a>
					</c:if>
				</c:forEach>
				
			</div>
		</div>
	</div>
</div>
<script
	src="C:\Users\Vinicius\workspace\PWeb\WebContent\assets\js\jquery-latest.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>