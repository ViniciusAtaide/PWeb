<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="titulo" required="true" rtexprvalue="true" %>
<%@ attribute name="path" required="true" %>
<%@ attribute name="busca" required="true" %>
<%@ attribute name="nome" required="true" %>
<html>
<head>
<meta http-equiv="Content-Type" content="charset=utf-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${path }style.css" rel="stylesheet">
<link href="${path }bootstrap.css" rel="stylesheet">
<link href="${path }bootstrap-responsive.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${titulo }</title>
</head>
<body>
	<div id="wrap">
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container pagination-centered">
					<button type="button" class="btn btn-navbar" data-toggle="collapse"
						data-target=".nav-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="brand" href="index.jsp">Projeto</a>
					<ul class="nav">
					<c:if test="${user.login eq 'administrador' }">						
						<li>
							<a href="painel.jsp"><i class='icon-wrench icon-white'></i>Painel</a>
						</li>						
					</c:if>									
					<c:if test="${user ne null }">
						<li>
							<btn class="btn btn-primary" href="#cadastromusica" data-toggle="modal">Adicionar Música</a>
						</li>						
					</c:if>					
					</ul>
					<div class="nav-collapse collapse">
						<c:if test="${sessionScope.user ne null }">
							<div class="nav pull-right span5">
								<a href="user.do?action=logoff" class="btn btn-danger">LogOff</a>
								<img src="${user.caminhofoto }" height="30" width="30" alt=" Perfil" />
								Bem-vindo <a href="#showuser" data-toggle="modal">${user.login}</a>
							</div>
						</c:if>
						<c:if test="${sessionScope.user eq null }">
							<form class="navbar-form pull-right" action="user.do" method="post" accept-charset="utf-8">
								<input type="text" class="span2" name="login" placeholder="Login" /> 
								<input type="password" class="span2" name="senha" placeholder="Pass" /> 
								<input type="hidden" name="action" value="login" /> 
								<input type="submit" class="btn btn-primary" value="Go!">
							</form>
							<ul class="nav pull-right">
								<li><a href="#cadastro" data-toggle="modal">Registrar</a></li>
							</ul>
						</c:if>

						<ul class="nav pull-right">
							<li>
								<form action="${busca}.do" method="get" class="form-search navbar-form">							
									<div class="input-append">
										<input type="search" class="input-medium search-query span2" name="busca" id="appendInputButton" placeholder="Buscar ${nome}" /> 
										<input type="hidden" name="action" value="search" />
										<button type="submit" class="btn">
											<i class="icon-search"></i>
										</button>
									</div>
								</form>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>		

		