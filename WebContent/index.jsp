<%@ include file="header.jsp"%>
<div class="container pagination-centered">
	<!-- Uso Futuro
	<div class="navbar">
		<div class="navbar-inner">
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
	</div>-->
	<div class="hero-unit">
		<div class="row">
			<div class="span5">
				<h3>Comunidade</h3>
				<c:if test="${empty miniposts }">
					<h4 class="text-info">Não há nenhum minipost ;/</h4>
				</c:if>
				<c:forEach items="${miniposts}" var="minipost">
					<h4>
						<img width="50" height="50" src="${minipost.usuario.caminhofoto }" />${minipost.titulo }
					</h4>
					<p>
						<small>${minipost.conteudo }</small>
					</p>
					<c:if test="${user.login eq 'administrador' || user.login eq minipost.usuario.login }">
						<a href="minipost.do?action=delete&id=${minipost.id }"
							class="btn btn-danger">Deletar Post</a>
					</c:if>
					<p>
						<small>Postado por ${minipost.usuario.login } em ${minipost.datapostado }.</small>
					</p>
				</c:forEach>
				<c:if test="${user ne null }">
					<div>
						<h4>Novo MiniPost</h4>
						<form action="minipost.do" method="post">
							<input type="text" name="titulo" placeholder="Titulo" /> <br>
							<textarea name="conteudo" cols="50" rows="10" placeholder="Conteúdo"></textarea>
							<br> 
							<input type="hidden" name="action" value="create" /> 
							<input type="submit" value="Postar" class="btn btn-primary" />
						</form>
					</div>
				</c:if>
			</div>
			<div class="span5">
				<h3>Top Musicas</h3>
				<c:if test="${empty topmusics }">
					<h4 class="text-info">Não há nenhuma música (ainda ;D)</h4>
				</c:if>
				<c:forEach items="${topmusics}" var="musica">
					<h3>
						<a href="music.do?id=${musica.id}&action=show" data-toggle="modal">${musica.nome}</a>
					</h3>
					<c:forEach items="${musica.autores }" var="autor">
						<a href="author.do?id=${autor.id}&action=show" data-toggle="modal">${autor.nome}</a>
					</c:forEach>
					<br>
					<a href="style.do?id=${musica.estilo.id}&action=show">${musica.estilo.nome}</a>
						<br>
					<a href="album.do?id=${musica.album.id}&action=show"
						data-toggle="modal">${musica.album.nome }</a><br>
					<c:if test="${user ne null }">
						<div class="playdiv">
							<a class="play" href="music.do?id=${musica.id}&action=play"><i class="icon-play" ></i></a>
						</div>
						<div class="stopdiv" style="display: none;">
							<a class="stop" href="music.do?action=stop" disabled ><i class="icon-stop" ></i></a>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<c:if test="${user ne null }">
				<div>
					<a class="btn btn-large btn-primary" href="#cadastromusica" data-toggle="modal">Upload de Música</a>
				</div>
			</c:if>
		</div>
		<p class="text-success pagination-centered" id="music-message">${requestScope.music_message}</p>
	</div>	
</div>
<%@ include file="footer.jsp"%>
</body>
</html>