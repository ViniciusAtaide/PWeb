<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="tamanho" required="true" description="tamanho da div" %>
<div class="${tamanho }">
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
			<a href="minipost.do?action=delete&id=${minipost.id }" class="btn btn-danger">Deletar Post</a>
		</c:if>
		<p>
			<small>Postado por ${minipost.usuario.login } em ${minipost.datapostado }.</small>
		</p>
	</c:forEach>
	<c:if test="${user ne null }">
		<div>
			<h4>Novo MiniPost</h4>
			<form action="minipost.do" method="post">
				<input type="text" name="titulo" class="span2" placeholder="Titulo" /> <br>
				<textarea name="conteudo" cols="10" rows="10" placeholder="Conteúdo"></textarea>
				<br> 
				<input type="hidden" name="action" value="create" /> 
				<input type="submit" value="Postar" class="btn btn-primary" />
			</form>
		</div>
	</c:if>
</div>
