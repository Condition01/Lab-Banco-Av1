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
</style>
</head>
<body>
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
	<h1>Finalistas!</h1>
	<br />

	<%
		List<Resultado> listaResultado = (List<Resultado>) session.getAttribute("LISTAFINALISTA");
		String classe = "normal";
	%>

	<form action="./pegarFinalista" method="post">
		<button type="submit" name="s" value="gerar" class="btn btn-primary"
			style="width: 300px">Gerar Grupos</button>
	</form>

	<%
		if (listaResultado != null && listaResultado.size() > 0) {
	%>
	<div class="container">
		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th>Grupo</th>
					<th>Nome</th>
					<th>Vitoria</th>
					<th>Empate</th>
					<th>Derrota</th>
					<th>Gols Marcados</th>
					<th>Gols Sofridos</th>
					<th>Saldo</th>
					<th>Pontos</th>
				</tr>
			</thead>
			<tbody>

				<%
					for (Resultado r : listaResultado) {
				%>
				<tr>
					<td><%=r.getGrupo()%></td>
					<td><%=r.getNome()%></td>
					<td><%=r.getVitorias()%></td>
					<td><%=r.getEmpates()%></td>
					<td><%=r.getDerrotas()%></td>
					<td><%=r.getGols()%></td>
					<td><%=r.getGolsSofridos()%></td>
					<td><%=r.getSaldoGols()%></td>
					<td><%=r.getPontos()%></td>



				</tr>
			</tbody>
			<%
				}
			%>
		</table>
	</div>
	<%
		}
		session.removeAttribute("LISTAFINALISTA");
	%>



	<script src="node_modules/jquery/dist/jquery.js"></script>
	<script src="node_modules/popper.js/dist/umd/popper.js"></script>
	<script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>
</body>
</html>