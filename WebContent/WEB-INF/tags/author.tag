<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="tamanho" required="true" description="tamanho da div" %>
<div class="${tamanho }">
	<c:if test="${music ne null }">
		<h4>
			${author.nome }
		</h4>
		<p>
			<small>${author.sobre }</small>
		</p>
		<p>Musicas desse autor:</p>
		<c:forEach items="${author.musicas }" var="music">
		<p>		
			<a href="music.do?action=show&id=${music.id }" >${music.nome }</a><br>
		</c:forEach>
		</p>
		<p></p>
		<p>
		<c:forEach items="${author.estilos }" var="style">
			<a href="style.do?action=show&id=${style.id }" >${style.nome }</a>
		</c:forEach>
		</p>
		<c:if test="${user ne null }">
			<a href="author.do?action=delete&id=${author.id }" class="btn btn-danger">Deletar Autor</a>
		</c:if>
	</c:if>



		<h3>Autores</h3>
		<c:if test="${user ne null }">
			<a class="btn btn-primary" href="#cadastroautor" data-toggle="modal">Novo Autor</a>			
		</c:if>
		<c:if test="${empty authors }">		
			<h4 class="text-info">Não há nenhum autor </h4>
		</c:if>
		<c:forEach items="${authors}" var="author">
		<h4>
			${author.nome }
		</h4>
		<p>
			<small>${author.sobre }</small>
		</p>
		<p>Musicas desse autor:</p>
		<p>		
		<c:forEach items="${author.musicas }" var="music">
			<a href="music.do?action=show&id=${music.id }" >${music.nome }</a><br>
		</c:forEach>
		</p>
		<p></p>
		<p>
		<c:forEach items="${author.estilos }" var="style">
			<a href="style.do?action=show&id=${style.id }" >${style.nome }</a>
		</c:forEach>
		</p>
		<c:if test="${user ne null }">
			<a href="author.do?action=delete&id=${author.id }" class="btn btn-danger">Deletar Autor</a>
		</c:if>
	</c:forEach>	
</div>
