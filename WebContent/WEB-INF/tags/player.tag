<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pagination-centered">
	<audio id="player" onended="tocaProxima()" >		
	</audio>
	<ul id="playlist">
		<c:forEach items="${playlist }" var="music">
			<li><a data-ogg="${music.caminhoarq }" data-id="${music.id }">${music.nome }</a> </li>
		</c:forEach>
	</ul>
	<c:if test="${!empty playlist }">
		<button class="btn" id="stop" onclick="$('#player').pause()"><i class="icon-stop"></i></button>
	</c:if>
</div> 