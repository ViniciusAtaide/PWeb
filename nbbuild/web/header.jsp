<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#upload-file-container {
	background: url(assets/img/default-user-image.png) no-repeat;
}

#upload-file-container input {
	filter: alpha(opacity =   0);
	opacity: 0;
}
      html,
      body {
        height: 100%;
        /* The html and body elements cannot have any padding or margin. */
      }

      /* Wrapper for page content to push down footer */
      #wrap {
        min-height: 100%;
        height: auto !important;
        height: 100%;
        /* Negative indent footer by it's height */
        margin: 0 auto -60px;
      }

      /* Set the fixed height of the footer here */
      #push,
      #footer {
        height: 60px;
      }
      #footer {
        background-color: #f5f5f5;
      }

      /* Lastly, apply responsive CSS fixes as necessary */
      @media (max-width: 767px) {
        #footer {
          margin-left: -20px;
          margin-right: -20px;
          padding-left: 20px;
          padding-right: 20px;
        }
      }



      /* Custom page CSS
      -------------------------------------------------- */
      /* Not required for template or sticky footer method. */

      #wrap > .container {
        padding-top: 60px;
      }
      .container .credit {
        margin: 20px 0;
      }

      code {
        font-size: 80%;
      }

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Projeto</title>
</head>
<body>
	<div id="wrap">
	<div class="navbar navbar-inverse  navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<button type="button" class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="brand" href="index.jsp">Projeto</a>
				<div class="nav-collapse collapse">
					<ul class="nav fluid">
						<li>
							<div class="offset3">
								<form action="musica.do" method="get"
									class="form-search navbar-form">
									<div class="input-append">
										<input type="text" class="input-medium search-query"
											name="busca" id="appendInputButton"
											placeholder="Buscar Música" /> <input type="hidden"
											name="action" value="procura" />
										<button type="submit" class="btn">
											<i class="icon-search"></i>
										</button>
									</div>
								</form>
							</div>
						</li>
					</ul>
					<c:if test="${sessionScope.user eq null }">
						<form class="navbar-form  pull-right" action="user.do"
							method="post">
							<input type="text" class="span2" name="login" placeholder="Login">
							<input type="text" class="span2" name="senha" placeholder="Pass">
							<input type="hidden" name="action" value="login" /> <input
								type="submit" class="btn btn-primary" value="Go!">
						</form>

						<ul class="nav pull-right">
							<li><a href="#cadastro" data-toggle="modal">Registrar</a></li>
						</ul>
					</c:if>
					<c:if test="${sessionScope.user ne null }">
						<div class="span1"></div>
						<a href="user.do?action=logoff" class="btn btn-danger">LogOff</a>
						<img src="${user.caminhofoto }" alt="Perfil" />
						Bem-vindo <a href="#showuser" data-toggle="modal">${user.login}</a>
					</c:if>
				</div>
			</div>
		</div>

	</div>
	<div class="row-fluid">
		<div class="span1"></div>
	</div>
	<div class="row-fluid">
		<div class="span1"></div>
	</div>
	<p class="offset5 text-error" id="error-message">${requestScope.error_message}</p>
	<p class="offset5 text-success" id="success-message">${requestScope.content_message}</p>
	<%@include file="modals.jsp"%>