<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="tamanho" required="true" description="tamanho da div" %>
<div class="${tamanho }">
	<div class="row">
		<h3>Usuário</h3>
	
		<p><img src="${usu.caminhofoto }" alt="Foto do Usuário" height="200" width="200"/></p>
		<h4>${usu.login }</h4>
		<p>Data em que logou pela primeira vez: ${usu.datacriado }</p>
	</div>		
	<div class="row">	
		<p>MiniPost desse usuário:</p>
		<c:forEach items="${usu.miniposts}" var="minipost">
			<p class="small">
				${minipost.titulo }
			<p>
		</c:forEach>
	
		<p>Musicas desse usuario:</p>
		<c:forEach items="${usu.musicas }" var="music">
			<a href="music.do?action=show&id=${music.id }" >${music.nome }</a><br>
		</c:forEach>
		</p>
		<c:if test="${usu.login eq 'administrador' }">
			<a href="usu.do?action=delete&id=${usu. }"></a>
		</c:if>	
	</div>
</div>