<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pagination-centered">
	<audio id="player" onended="tocaProxima()">		
	</audio>
	<ul class="nav nav-inverse" id="playlist">	
		<c:forEach items="${playlist }" var="music">
			<li data-ogg="${music.caminhoarq }" data-id="${music.id }">${music.nome } </li>
		</c:forEach>
	</ul>
	<c:if test="${!empty playlist }">
		<button class="btn" onclick="$('#player').pause()"><i class="icon-stop"></i></button>
	</c:if>
</div> 