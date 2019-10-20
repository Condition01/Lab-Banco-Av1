<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="model.Jogos, java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="node_modules/bootstrap/compiler/bootstrap.css">
<link rel="stylesheet" href="node_modules/bootstrap/compiler/style.scss">
<style type="text/css">
h1 {
	text-align: center;
	margin-bottom: 20px;
}

#btn {
	text-align: center;
	margin-top: 20px;
}
</style>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-light    bg-gradient-warning">
		<div class="container">
			<!-- nome em destaque no navbar -->
			<a class="navbar-brand" href="a">Curso</a>

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
	<%
		List<Jogos> jogos = (List<Jogos>) session.getAttribute("LISTA");
	%>
	<h1>Rodadas do Campeonato Paulista</h1>
	<div class=container id="main">
		<div class="form-group">
			<form action="./gerarJogos" method="post">
				<select name="jogos" id="comboJogos" class="form-control">
					<option value="1">Rodada 1</option>
					<option value="2">Rodada 2</option>
					<option value="3">Rodada 3</option>
					<option value="4">Rodada 4</option>
					<option value="5">Rodada 5</option>
					<option value="6">Rodada 6</option>
					<option value="7">Rodada 7</option>
					<option value="8">Rodada 8</option>
					<option value="9">Rodada 9</option>
					<option value="10">Rodada 10</option>
					<option value="11">Rodada 11</option>
					<option value="12">Rodada 12</option>
					<option value="13">Rodada 13</option>
					<option value="14">Rodada 14</option>
					<option value="15">Rodada 15</option>
				</select>
				<div class="col-md-12 center-block" id="btn">
					<button type="submit" name="cmd" value="gerar"
						class="btn btn-primary" style="width: 300px">Ver rodada!</button>
				</div>
			</form>
		</div>
	</div>

	<%
		if (jogos != null && jogos.size() > 0) {
	%>
	<div class="container">
		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th>Time A</th>
					<th>Time B</th>
					<th>Gols Time A</th>
					<th>Gols Time B</th>
					<th>Data Jogo</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (Jogos j : jogos) {
				%>
				<tr>
					<td><%=j.getNomeTimeA()%></td>
					<td><%=j.getNomeTimeB()%></td>
					<td><%=j.getGolsTimeA()%></td>
					<td><%=j.getGolsTimeB()%></td>
					<td><%=j.getDataJogo()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<%
		}
	%>

	<script src="node_modules/jquery/dist/jquery.js"></script>
	<script src="node_modules/popper.js/dist/umd/popper.js"></script>
	<script src="node_modules/bootstrap/dist/js/bootstrap.js"></script>
</body>
</html>