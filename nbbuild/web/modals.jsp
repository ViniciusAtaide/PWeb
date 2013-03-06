<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="cadastro" class="modal hide fade" tabindex="-1" role="dialog"
	aria-labbeledby="Cadastrar" aria-hidden="false">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">x</button>
		<h3 id="Cadastrar">Cadastro</h3>
	</div>
	<div class="modal-body">
		<form action="user.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="action" value="create" /> <br /> <input
				type="text" class="span2" name="login" placeholder="Login" /> <br>
			<input type="password" class="span2" name="senha" placeholder="Pass" /><br>
			<div id="upload-file-container">
				<input type="file" name="foto" accept="image/*" id="foto" />
			</div>
			<input type="submit" class="btn btn-danger" value="Registrar!" />
		</form>
	</div>
</div>
<div id="showuser" class="modal hide fade" tabindex="-1" role="dialog"
	aria-labbeledby="Usuario" aria-hidden="false">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">x</button>
		<h3 id="Usuario">Usuario</h3>
	</div>
	<div class="modal-body">
		<img alt="Perfil" src="${user.caminhofoto}">
		<h3>
			${user.login}
			</p>
			<h4>MiniPosts</h4>
			<c:forEach items="${user.miniposts }" var="minipost">
			${minipost.titulo } <br>
			</c:forEach>
			<h4>Musicas</h4>
			<c:forEach items="${user.musicas }" var="musica">
			${musica.nome } <br>
			</c:forEach>
			${user.datacriado }
	</div>
</div>
<div id="cadastromusica" class="modal hide fade" tabindex="-1"
	role="dialog" aria-labbeledby="CadastrarMusica" aria-hidden="false">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">x</button>
		<h3 id="CadastrarMusica">Nova Música</h3>
	</div>
	<div class="modal-body">
		<form action="music.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="action" value="create" /> <br>
			<input type="text" name="nome" placeholder="Titulo" /> <br><input type="text" name="estilo" placeholder="Estilo" /> <br>
			<input type="text" name="album" placeholder="Album" /><br>
			<input type="text" name="autor" placeholder="Autor"/>
			<div id="upload-music-container">
				<input type="file" name="arq" accept="audio/wav" />
			</div>
			<input type="submit" class="btn btn-danger" value="Concluir!" />	
	</form>
	</div>
</div>