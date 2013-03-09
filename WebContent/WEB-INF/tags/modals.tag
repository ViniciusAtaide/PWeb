<%@ tag language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


			<!-- Div de cadastro do usuário -->


<div id="cadastro" class="modal hide fade" tabindex="-1" role="dialog" aria-labbeledby="Cadastrar" aria-hidden="false">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="Cadastrar">Cadastro</h3>
	</div>
	<div class="modal-body">
		<form action="user.do" id="cadastrouser" method="post" enctype="multipart/form-data" accept-charset="iso-8859-1,utf-8">
			<ul class="nav">
				<input type="hidden" name="action" value="create" /> 
				<li><input type="text" class="span3" name="login" id="login" placeholder="Login" /><span class="text-error" id="error-input"></span></li>
				<li><input type="password" class="span3" id="pass" name="senha" placeholder="Password" /><span class="text-error" id="error-pass"></span></li>
				<li><input type="password" class="span3" id="passcheck" name="senhacheck" placeholder="Repita o Password" /><span class="text-success" id="acert-pass"></span></li>
				<li><div id="div-input-file">
	            	<input name="foto" accept="image/*" type="file" size="10" id="file-original" onchange="abreURL(this);"/>
	            	<div id="div-input-falso">
	            		<input name="file-falso" type="text" id="file-falso" placeholder="Foto de Perfil"/>
	          		</div>
	        	</div></li>
	        	<br>
	        	<li><img id="foto" src="assets/img/default-user-image.png" alt="Seu perfil" /></li>
	        	
				<li><input type="submit" class="btn btn-danger" value="Registrar!" /> </li>
				<li><span class="text-error" id="error-submit" style="display: hidden;"></span></li>
			</ul>
		</form>
	</div>
</div>

<!-- ------------------------------------------------------------------------------------ -->
			
			<!-- Div de para amostragem do usuário -->
			
<div id="showuser" class="modal hide fade" tabindex="-1" role="dialog" aria-labbeledby="Usuario" aria-hidden="false">
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
			<a href="musica.do?action=show&id=${musica.id }">${musica.nome }</a>
			<div class="playdiv">
				<a class="play" href="music.do?id=${musica.id}&action=play"><i class="icon-play" ></i></a>
			</div>
			<div class="stopdiv" style="display: none;">
				<a class="stop" href="music.do?action=stop" disabled ><i class="icon-stop" ></i></a>
			</div>			
			</c:forEach>
			${user.datacriado }
	</div>
</div>

					<!-- Div para cadastrar musicas -->

<div id="cadastromusica" class="modal hide fade" tabindex="-1" role="dialog" aria-labbeledby="CadastrarMusica" aria-hidden="false">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="CadastrarMusica">Nova Música</h3>
	</div>
	<div class="modal-body">
		<form action="music.do" method="post" enctype="multipart/form-data" accept-charset="iso-8859-1,utf-8">
			<ul class="nav">						
				<li>
					<div id="div-input-file">
		            	<input name="musica" accept="audio/*" type="file" size="10" id="file-original" onchange="abreURL(this);"/>
		            	<div id="div-input-falso">
		            		<input name="file-falso" type="text" id="musica" class="span3" placeholder="Arquivo da Musica"/>
		          		</div>
		        	</div>
	        	</li> <br>        	
	        	<li><input type="hidden" name="action" value="create" /></li>
				<li><input type="text" class="span3" id="tit" name="nome" disabled placeholder="Titulo" /> </li>
				<li><input type="text" class="span3" id="est" name="estilo" disabled placeholder="Estilo" /></li>				
				<li><input type="text" class="span3" id="alb" name="album" disabled placeholder="Album"/><br></li>
				<li><input type="text" class="span3" id="aut" name="autor" disabled placeholder="Autor"/><br></li>			        
				<li><input type="submit" class="btn btn-danger" value="Concluir!" /></li>
			</ul>
	</form>
	</div>
</div>
