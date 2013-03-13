<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="tamanho" required="true" description="tamanho da div" %>
<div class="${tamanho }">
		<h3>Estilos</h3>		
		<c:if test="${user.login eq 'administrador' }">
			<a class="btn btn-primary" href="#cadastroestilo" data-toggle="modal">Novo estilo</a>			
		</c:if>
		<c:if test="${empty styles }">		
			<h4 class="text-info">Não há nenhum estilo </h4>
		</c:if>
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
		<p>Autores desse estilo: </p>
		<p>
		<c:forEach items="${author.albuns }" var="album">
			<a href="album.do?action=show&id=${album.id }" >${album.nome }</a>
		</c:forEach>
		</p>
		<c:forEach items="${author.autores }" var="author">
			<a href="author.do?action=show&id=${author.id }">author.nome</a>
		</c:forEach>
		<c:if test="${user.login eq 'administrador'}">
			<a href="style.do?action=delete&id=${style.id }" class="btn btn-danger">Deletar estilo</a>
		</c:if>
	</c:forEach>
	
</div>
