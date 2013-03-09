<!DOCTYPE html>
<%@taglib prefix="v" tagdir="/WEB-INF/tags" %>
<v:modals></v:modals>

<div class="container pagination-centered">
<v:header titulo="Projeto - Pagina Principal"></v:header>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="offset4">
				<ul class="nav nav-pills">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="music.jsp">Musicas</a></li>
					<li><a href="style.jsp">Estilos</a></li>
					<li><a href="author.jsp">Autores</a></li>
					<c:if test="${user.nome eq 'administrador' }">
						<li class="active"><a href="user.jsp">Usuários</a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="hero-unit">
			<div class="row">
				<div class="span6">
					<h3>Usuario</h3>
					<c:forEach items="${users}" var="user">
						<p>Login: ${user.login}</p>
						<p>Senha: ${user.senha }</p>
						<c:forEach items="${user.miniposts}" var="minipost">
							<a href="minipost.do?action=show#id=${minipost.id}">${minipost.titulo},</a>
						</c:forEach>
						<a href="user.do?action=delete#id=${minipost.id }"
							class="btn btn-danger">Deletar Usuario</a>

					</c:forEach>

				</div>
			</div>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>