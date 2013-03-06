<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="cadastro" class="modal hide fade" tabindex="-1" role="dialog" aria-labbeledby="Cadastrar" aria-hidden="false">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="Cadastrar">Cadastro</h3>
	</div>
	<div class="modal-body">
		<form action="user.do" id="cadastrouser" method="post" enctype="multipart/form-data">
			<input type="hidden" name="action" value="create" /> <br />
			<input type="text" class="span3" name="login" id="login" placeholder="Login" />
			<span class="text-error" id="error-input"></span><br>
			<input type="password" class="span3" id="pass" name="senha" placeholder="Password" /><span class="text-error" id="error-pass"></span><br>
			<input type="password" class="span3" id="passcheck" name="senhacheck" placeholder="Repita o Password" /><span class="text-success" id="acert-pass"></span><br>
			<div id="div-input-file">
            	<input name="foto" accept="image/*" type="file" size="10" id="file-original" onchange="abreURL(this);"/>
            	<div id="div-input-falso">
            		<input name="file-falso" type="text" id="file-falso" placeholder="Foto de Perfil"/>
          		</div>
        	</div>
        	<br>
        	<img id="foto" src="assets/img/default-user-image.png" alt="Seu perfil" />
        	<br>
			<input type="submit" class="btn btn-danger" value="Registrar!" /> <br>
			<span class="text-error" id="error-submit"></span>
		</form>
	</div>
</div>
<div id="showuser" class="modal hide fade" tabindex="-1" role="dialog"
	aria-labbeledby="Usuario" aria-hidden="false">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="Usuario">Usuario</h3>
	</div>
	<div class="modal-body">
		<img alt="Perfil" src="${user.caminhofoto}">
		<h3>${user.login} </h3>
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
<div id="cadastromusica" class="modal hide fade" tabindex="-1" role="dialog" aria-labbeledby="CadastrarMusica" aria-hidden="false">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="CadastrarMusica">Nova Música</h3>
	</div>
	<div class="modal-body">
		<form action="music.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="action" value="create" /> <br>
			<input type="text" class="span3" id="tit" name="nome" disabled placeholder="Titulo" /> <br>
			<input type="text" class="span3" name="estilo" id="est" placeholder="Estilo" /> <br>				
			<input type="text" class="span3" id="alb" name="album" disabled placeholder="Album"/><br>
			<input type="text" class="span3" id="aut" name="autor" disabled placeholder="Autor"/>
			<div id="div-input-file">
            	<input name="musica" accept="audio/*" type="file" size="10" id="file-original" onchange="abreURL(this);"/>
            	<div id="div-input-falso">
            		<input name="file-falso" type="text" id="musica" class="span3" placeholder="Arquivo da Musica"/>
          		</div>
        	</div>
        
        	<br>
			<input type="submit" class="btn btn-danger" value="Concluir!" />
	</form>
	</div>
</div>
