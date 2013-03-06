<%@include file="header.jsp"%>
	<div class="navbar">
		<div class="navbar-inner">
			<div class="offset4">
				<ul class="nav nav-pills">
					<li><a href="index.jsp"><i class="icon-home"></i>Home</a></li>
					<li><a href="music.jsp"><i class="icon-music"></i>Musicas</a></li>
					<li class="active"><a href="style.jsp"><i class="icon-star"></i>Estilos</a></li>
					<li><a href="author.jsp"><i class="icon-user"></i>Autores</a></li>
					<c:if test="${user.nome eq 'administrador' }">
						<li><a href="user.jsp">Usuários</a></li>
					</c:if>				</ul>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="hero-unit">
			<div class="row-fluid">				
				<h3>Estilos</h3>
				<c:forEach items="${requestScope.estilos}" var="estilo">
				Estilo: ${estilo.nome}
				Sobre: ${estilo.sobre}
				</c:forEach>
			</div>
			<c:if test="${estilo ne null }"><a href="style.do?id=${requestScope.style.id}#action=delete"
				class="btn btn-danger pull-right">Deletar Estilo</a>
			</c:if>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>