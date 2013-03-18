<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="tamanho" required="true" description="tamanho da div" %>
<div class="${tamanho } corpo">
	<h3>Albuns</h3>
	<c:if test="${user ne null }">
		<a class="btn btn-primary" href="#cadastroalbum" data-toggle="modal">Novo Album</a>			
	</c:if>
	<c:if test="${empty albums }">		
		<h4 class="text-info">Não há nenhum album </h4>
	</c:if>
	<c:forEach items="${albums}" var="album">
		<h4>
			Nome: ${album.nome }
		</h4>
		<p>	Sobre: <small>${album.sobre }</small> </p>
		<p>Estilo: <small>${album.estilo }</small></p>
		<p>Musicas desse album:</p>
		<p>		
		<c:forEach items="${album.musicas }" var="music">
			<a href="music.do?action=show&id=${music.id }" >${music.nome }</a><br>
		</c:forEach>
		</p>
		<p>Autores que fizeram esse album: </p>
		<p>
		<c:forEach items="${albums.autores }" var="author">
		<a href="author.do?action=show&id=${author.id }" >${author.nome }</a>
		</c:forEach>
		</p>
		<c:if test="${user.login eq 'administrador' }">
			<a href="author.do?action=delete&id=${album.id }" class="btn btn-danger">Deletar Album</a>
		</c:if>
	</c:forEach>	
</div>