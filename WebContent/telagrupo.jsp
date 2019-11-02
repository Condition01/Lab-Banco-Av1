<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Grupos"%>
<%@ page import="controller.GerarGrupos"%>


<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>Gerar Grupos</title>
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
nav {
	background-color: #f2cb12;
}
</style>
</head>
<body>
		<nav
			class="navbar navbar-expand-lg navbar-light">
			<div class="container" id="nav1">
				<!-- nome em destaque no navbar -->
				<a class="navbar-brand" href="./principal.html"><img alt="" src="images/PAULISTA.png"></a>

				<!-- reconher o navbar -->
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSite">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSite">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link"
							href="principal.html">Inicio</a></li>
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
	<h1>Clique no Botao para gerar os Grupos</h1>
	<br />
	<%
		List<Grupos> lg = (List<Grupos>) session.getAttribute("LISTA2");
	%>

	<form action="./gerarGrupos" method="post">
		<button type="submit" name="s" value="gerar" class="btn btn-primary"
			style="width: 300px">Gerar Grupos</button>
	</form>

	<%
		if (lg != null && lg.size() > 0) {
	%>
	<div class="container">
		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th>Grupo</th>
					<th>Time</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Grupos b : lg) {
				%>
				<tr>
					<td><%=b.getGrupo()%></td>
					<td><%=b.getNome()%></td>
				</tr>
			</tbody>
			<%
				}
			%>
		</table>
	</div>
	<%
		}
		session.removeAttribute("LISTA2");
	%>

	<script src="node_modules/jquery/dist/jquery.js"></script>
	<script src="node_modules/popper.js/dist/umd/popper.js"></script>
	<script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>
</body>
</html>