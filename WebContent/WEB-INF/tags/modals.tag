<%@ tag language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


			<!-- Div de cadastro do usuário -->


<div id="cadastro" class="modal hide fade pagination-centered" tabindex="-1" role="dialog" aria-labbeledby="Cadastrar" aria-hidden="false">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="Cadastrar">Cadastro</h3>
	</div>
	<div class="modal-body">
		<form action="user.do" id="cadastrouser" method="post" enctype="multipart/form-data" accept-charset="utf-8">
		<input type="hidden" name="action" value="create" />
			<ul class="nav">				 
			<br><div class="alert alert-error" id="error-pass" style="display:none;">Verificar senha.<button class="close" type="button" data-dismiss="alert">x</button></div><div class="alert alert-error" id="error-input" style="display:none;"></div><div class="alert alert-success" id="acert-pass" style="display:none;">Correto.<button class="close" type="button" data-dismiss="alert">x</button></div>
				<li><input type="text" class="span3" name="login" id="login" autocomplete="off" placeholder="Login" /></li>				
				<li><input type="password" class="span3" id="pass" name="senha" autocomplete="off" placeholder="Password" /></li>				
				<li><input type="password" class="span3" id="passcheck" autocomplete="off" name="senhacheck" placeholder="Repita o Password" /></li>				
				<li>
					<div id="div-input-file">
	            		<input name="foto" accept="image/*" type="file" id="file-original" onchange="abreURL(this);"/>
	            		<div id="div-input-falso">
	            			<input name="file-falso" type="text" id="file-falso" placeholder="Foto de Perfil"/>
	          			</div>
	        		</div>
	        	</li>
	        	<br>
	        	<li><img id="foto" src="assets/img/default-user-image.png" width="120" height="120" alt="Seu perfil" /></li>
	        	<li><span id="error-submit" class="text-error"></span></li>
				<li><input type="submit" class="btn btn-danger" value="Registrar!" /> </li>
				
			</ul>					
		</form>
	</div>
</div>

<!-- ------------------------------------------------------------------------------------ -->
			
			<!-- Div de para amostragem do usuário da sessão -->
			
<div id="showuser" class="modal hide fade" tabindex="-1" role="dialog" aria-labbeledby="Usuario" aria-hidden="false">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="Usuario">Usuario</h3>
	</div>
	<div class="modal-body">
		<img alt="Perfil" src="${user.caminhofoto}" height="100" width="200">
		<h3>${user.login} </h3>
			<h4>MiniPosts</h4>
			<c:forEach items="${user.miniposts }" var="minipost">
			${minipost.titulo } <br>
			</c:forEach>
			<h4>Musicas</h4>
			<c:forEach items="${user.musicas }" var="musica">
			<a href="musica.do?action=show&id=${musica.id }">${musica.nome }</a>
			<audio controls>
				<source src="${musica.caminhoarq }" type="audio/mp3"></source>					
				Seu navegador nao tem suporte html5 audio.
			</audio>		
			</c:forEach>
			${user.datacriado }
	</div>
</div>

					<!-- Div para cadastrar musicas -->

<div id="cadastromusica" class="modal hide fade pagination-centered" tabindex="-1" role="dialog" aria-labbeledby="CadastrarMusica" aria-hidden="false">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="CadastrarMusica">Nova Música</h3>
	</div>
	<div class="modal-body">
		<form action="music.do" method="post" enctype="multipart/form-data" accept-charset="iso-8859-1,utf-8">
			<input type="hidden" name="action" value="create" />
			<ul class="nav">						
				<li>
					<div id="div-input-file">
		            	<input name="musica" accept="audio/*" type="file" size="10" id="file-original" onchange="abreId3(this);"/>
		            	<div id="div-input-falso">
		            		<input name="file-falso" type="text" id="musica" class="span3" placeholder="Arquivo da Musica"/>
		          		</div>
		        	</div>
	        	</li> 
				<br />	    		
				<li><input type="text" autocomplete="off" class="span3" id="tit" name="nome" disabled placeholder="Titulo" /> </li>
				<li>
					<select autocomplete="off" class="span3" id="est" name="estilo" disabled >
						<c:forEach items="${styles }" var="estilo"> 
							<option value="${estilo.id }">${estilo.nome }</option>
						</c:forEach>
					</select>
				</li>				
				<li><input type="text" autocomplete="off" class="span3" id="alb" name="album" disabled placeholder="Album"/><br></li>
				<li><input type="text" autocomplete="off" class="span3" id="aut" name="autor" disabled placeholder="Autor"/><br></li>			        
				<li><input type="submit" class="btn btn-danger" value="Concluir!" /></li>
			</ul>
			<div id="#erro_musica" class="alert alert-error" style="display:none;"><button class="close" type="button" data-dismiss="alert">x</button></div> 
	</form>
	</div>
</div>


					<!-- Div para cadastro de autores -->
								
<div id="cadastroautor" class="modal hide fade pagination-centered" tabindex="-1" role="dialog" aria-labbeledby="CadastrarAutor" aria-hidden="false">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="CadastrarAutor">Novo Autor</h3>
	</div>	
	<div class="modal-body">
		<form action="author.do" method="post" accept-charset="iso-8859-1,utf-8">
			<input type="hidden" name="action" 	value="create" />
			<ul class="nav">										
				<li><input type="text" autocomplete="off" class="span3" name="nome" placeholder="Nome do Artista" /> </li>				
				<li><input type="text" autocomplete="off" class="span3" name="sobre" placeholder="Sobre"/><br></li>
				<li><input type="submit" class="btn btn-danger" value="Concluir!" /></li>
			</ul>
	</form>
	</div>
</div>

					<!-- Div para cadastro de estilo -->
<div id="cadastroestilo" class="modal hide fade pagination-centered" tabindex="-1" role="dialog" aria-labbeledby="CadastrarEstilo" aria-hidden="false">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="CadastroEstilo">Novo Estilo</h3>
	</div>
	<div class="modal-body">
		<form action="style.do" method="post" accept-charset="iso-8859-1,utf-8">
			<input type="hidden" name="action" value="create" />
			<ul class="nav">										
				<li><input type="text" autocomplete="off" class="span3" name="nome" placeholder="Nome do Estilo" /> </li>				
				<li><textarea name="sobre" placeholder="Sobre"></textarea></li>
				<li><input type="submit" class="btn btn-danger" value="Concluir!" /></li>
			</ul>
	</form>
	</div>
</div>

					<!-- Div para cadastro de album -->
<div id="cadastroalbum" class="modal hide fade pagination-centered" tabindex="-1" role="dialog" aria-labbeledby="CadastroAlbum" aria-hidden="false">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
		<h3 id="CadastroAlbum">Novo Album</h3>
	</div>
	<div class="modal-body">
		<form action="album.do" method="post" accept-charset="iso-8859-1,utf-8">
			<input type="hidden" name="action" value="create" />
			<ul class="nav">										
				<li><input type="text" autocomplete="off" class="span3" name="nome" placeholder="Nome do Album" /> </li>				
				<li><textarea name="sobre" placeholder="Sobre"></textarea></li>
				<li><input type="submit" class="btn btn-danger" value="Concluir!" /></li>
			</ul>
	</form>
	</div>
</div>