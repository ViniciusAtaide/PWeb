<%@ include file="header.jsp"%>
<div class="navbar">
	<div class="navbar-inner">
		<div class="offset4">
			<ul class="nav nav-pills">
				<li class="active"><a href="index.jsp"><i class="icon-home"></i>Home</a></li>
				<li><a href="music.jsp"><i class="icon-music"></i>Musicas</a></li>
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
			<div class="span6">
				<h3>Comunidade</h3>
				<c:forEach items="${miniposts}" var="minipost">
					<h4><img src="${minipost.usuario.caminhofoto }" />${minipost.titulo }</h4>
					<p><small>${minipost.conteudo }</small></p>
					<c:if test="${user.login eq 'administrador' }">
						<a href="minipost.do?action=delete&id=${minipost.id }"
							class="btn btn-danger">Deletar Post</a>
					</c:if>
					<c:if test="${user.login eq minipost.usuario.login }">
						<a href="minipost.do?action=delete&id=${minipost.id }"
							class="btn btn-danger">Deletar Post</a>
					</c:if>
					<p><small>Postado por ${minipost.usuario.login } em ${minipost.datapostado }.</small></p>
				</c:forEach>
				<div>
					<c:if test="${user ne null }">
						<div class="span3">
							<h4>Novo MiniPost</h4>
							<form action="minipost.do" method="post">
								<input type="text" name="titulo" placeholder="Titulo" /> <br>
								<textarea name="conteudo" cols="50" rows="10" placeholder="Conteúdo"></textarea> <br>
								<input type="hidden" name="action" value="create" />
								<input type="submit" value="Postar" class="btn btn-primary" />
							</form>
						</div>
					</c:if>
				</div>
			</div>
			<div class="span4">
			<h3>Top Musicas</h3>
			<c:forEach items="${musics}" var="musica">
				<h3><a href="music.do?id=${musica.id}&action=show" data-toggle="modal">${musica.nome }</a></h3>
				<c:forEach items="${musica.autores }" var="autor">
					 <a href="author.do?id=${autor.id}&action=show" data-toggle="modal">${autor.nome }</a>
				</c:forEach>
				<a href="style.do?id=${musica.estilo.id}&action=show">${musica.estilo.nome }</a>
				<a href="album.do?id=${musica.album.id}&action=show" data-toggle="modal">${musica.album.nome }</a>
				<a href="music.do?id=${musica.id}&action=play"><i class="icon-play"></i></a>
			</c:forEach>
			</div>
			<c:if test="${user ne null }">
			<div class="span3">
				<a class="btn btn-large btn-primary" href="#cadastromusica" data-toggle="modal">Upload de Música</a>
			</div>
			</c:if>

		</div>
	</div>
</div>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>