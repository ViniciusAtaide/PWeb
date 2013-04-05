<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="tamanho" required="true" description="tamanho da div" %>
<div class="${tamanho } corpo">


	<!-- Checa se o resultado da busca existe -->
	<c:if test="${user.login eq 'administrador' }">
			<a class="btn btn-primary" href="#cadastroestilo" data-toggle="modal">Novo estilo</a>			
	</c:if>		
	<c:if test="${!empty result}">
		<h3>Resultado da busca</h3>	
		<c:forEach items="${result}" var="estilo">
			<h4>
				<a href="style.do?id=${estilo.id}&action=show" data-toggle="modal">${estilo.nome}</a>
			</h4>
			Autores:<br> 
			<c:forEach items="${estilo.autores }" var="autor">
				<a href="author.do?id=${autor.id}&action=show" data-toggle="modal">${autor.nome}</a>
			</c:forEach>
			<br>
			Músicas: <br>
			<c:forEach items="${estilo.musicas }" var="musica">
				<a href="style.do?id=${musica.id}&action=show">${musica.nome}</a><br>
				<audio src="${musica.caminhoarq }" controls class="pull-right" onplay="$.ajax('music.do?action=play&id=${music.id}')">		
			</audio>
			</c:forEach>					
		</c:forEach>
	</c:if>
		
	<c:if test="${!empty styles }">
		<h3>Estilos</h3>		
		
		<c:forEach items="${styles}" var="style">
			<h4>
				${style.nome }
			</h4>
			<p>
				<small>${style.sobre }</small>
			</p>
			<p>Musicas desse estilo:</p>
			<p>		
			<c:forEach items="${style.musicas }" var="music">	
				<a href="music.do?action=show&id=${music.id }" >${music.nome }</a><br>
			</c:forEach>
			</p>
			</p>
			<p>
			<c:forEach items="${style.autores }" var="author">
				<a href="author.do?action=show&id=${author.id }">${ author.nome}</a>
			</c:forEach>
			</p>
			<c:if test="${user.login eq 'administrador'}">
				<a href="style.do?action=delete&id=${style.id }" class="btn btn-danger">Deletar estilo</a>
			</c:if>
		</c:forEach>
	</c:if>
	<c:if test="${empty styles }">
		<h3>Estilos</h3>
		<h4 class="text-info">Não há nenhum Estilo.</h4>
	</c:if>
	<c:if test="${style ne null }">
		<h4> ${style.nome }	</h4>
		<p>
			<small>${style.sobre }</small>
		</p>
		<p>Musicas desse estilo:</p>
		<p>		
		<c:forEach items="${style.musicas }" var="music">	
		<a href="music.do?action=show&id=${music.id }" >${music.nome }</a><br>
		</c:forEach>
		<p>Autores desse estilo: </p>
		<p>
		<c:forEach items="${author.autores }" var="author">
			<a href="author.do?action=show&id=${author.id }">author.nome</a>, 
		</c:forEach>
		</p>
		<c:if test="${user.login eq 'administrador'}">
			<a href="style.do?action=delete&id=${style.id }" class="btn btn-danger">Deletar estilo</a>
		</c:if>		
	</c:if>
</div>
