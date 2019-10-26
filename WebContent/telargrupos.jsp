<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Resultado"%>
<%@ page import="controller.GerarGrupos"%>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Resultados</title>
<link rel="stylesheet"
	href="node_modules/bootstrap/compiler/bootstrap.css">
<link rel="stylesheet" href="node_modules/bootstrap/compiler/style.scss">

<style type="text/css">
h1 {
	text-align: center;
}

form {
	text-align: center;
	margin-bottom: 20px;
}

.rebaixado {
	background-color: red !important;;
}

nav {
	z-index: 10;
}

#carouselSite {
	z-index: -1;
}
</style>
</head>
<body>
	<%
		List<Resultado> listaResultado = (List<Resultado>) session.getAttribute("LISTARESULTADOG");
		int valor  = 5;
		session.setAttribute("VALOR", valor);
		String classe = "normal";
	%>

	<nav
		class="navbar navbar-expand-lg navbar-light    bg-gradient-warning">
		<div class="container">
			<!-- nome em destaque no navbar -->
			<a class="navbar-brand" href="a">FUTEBOL</a>

			<!-- reconher o navbar -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSite">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSite">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="principal.html">Inicio</a></li>
					<li class="nav-item"><a class="nav-link" href="telajogos.jsp">Sortear
							Jogos</a></li>
					<li class="nav-item"><a class="nav-link" href="telagrupo.jsp">Sortear
							Grupos</a></li>
					<li class="nav-item"><a class="nav-link" href="telagols.jsp">Gerar
							Gols</a></li>
					<li class="nav-item"><a class="nav-link"
						href="telaresultados.jsp">Resultados</a></li>
					<li class="nav-item"><a class="nav-link"
						href="telargrupos.jsp">Resultados Grupo</a></li>
					<li class="nav-item"><a class="nav-link"
						href="telafinalistas.jsp">Finalistas!</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<h1>Resultado por Grupos</h1>


	<div id="carouselSite" class="carousel slide" data-site="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<jsp:include page="./tabelas.jsp"></jsp:include>
				<div class="carousel-caption d-none d-md-block text-light">
					<h3></h3>
					<p></p>
				</div>
			</div>
			<div class="carousel-item">
				<jsp:include page="./tabelas.jsp"></jsp:include>
				<div class="carousel-caption d-none d-md-block text-light">
					<h3></h3>
					<p></p>
				</div>
			</div>
			<div class="carousel-item">
				<jsp:include page="./tabelas.jsp"></jsp:include>
				<div class="carousel-caption d-none d-md-block text-light">
					<h3></h3>
					<p></p>
				</div>
			</div>
			<div class="carousel-item">
				<jsp:include page="./tabelas.jsp"></jsp:include>
				<div class="carousel-caption d-none d-md-block text-light">
					<h3></h3>
					<p></p>
				</div>
			</div>
		</div>
	</div>
	<a class="carousel-control-prev" href="#carouselSite" role="button"
		data-slide="prev"> <span class="carousel-control-prev-icon"></span>
		<span class="sr-only">Anterior</span>
	</a>
	<a class="carousel-control-next" href="#carouselSite" role="button"
		data-slide="next"> <span class="carousel-control-next-icon"></span>
		<span class="sr-only">Proximo</span>
	</a>
	<% session.removeAttribute("LISTARESULTADOG"); %>

	<form action="./pegarResultadosGrupos" method="post">
		<button type="submit" name="s" value="gerar" class="btn btn-primary"
			style="width: 300px">Gerar Grupos</button>
	</form>




	<script src="node_modules/jquery/dist/jquery.js"></script>
	<script src="node_modules/popper.js/dist/umd/popper.js"></script>
	<script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>
</body>
</html>