<!DOCTYPE html>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>

<div class="container pagination-centered">
<v:header titulo="Projeto - Pagina Principal"></v:header>

	<div class="navbar">
		<div class="navbar-inner">
			<div class="offset4">
				<ul class="nav nav-pills">
					<li><a href="index.jsp"><i class="icon-home"></i>Home</a></li>
					<li><a href="music.jsp"><i class="icon-music"></i>Musicas</a></li>
					<li><a href="style.jsp"><i class="icon-star"></i>Estilos</a></li>
					<li class="active"><a href="author.jsp"><i class="icon-user"></i>Autores</a></li>
					<c:if test="${user.nome eq 'administrador' }">
						<li><a href="user.jsp">Usuários</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="hero-unit">
			<div class="row">
				<div class="span4"><h3>Autores</h3></div>
				<c:forEach items="${requestScope.authors}" var="author">
					Nome: ${author.nome }
					Sobre: ${author.sobre }
					<c:if test="${authors ne null }">
						<a href=""></a>
					</c:if>
				</c:forEach>
			</div>

		</div>
	</div>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>