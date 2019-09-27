<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="model.Jogos, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style type="text/css">
		h1{
			text-align: center;
			margin-bottom: 20px;
		}
		#btn{
			text-align: center;
			margin-top: 20px;
		}
	</style>
</head>
<body>
	<%
		List<Jogos> jogos =(List<Jogos>) session.getAttribute("LISTA");
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
					<button type="submit" name="cmd" value="gerar" class="btn btn-primary" style="width: 300px">Ver rodada!</button>
				</div>
			</form>
		</div>		
	</div>
	
	<% if(jogos != null && jogos.size() > 0)  {%>
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
				<% for (Jogos j : jogos) { %>
					<tr>
						<td><%=j.getNomeTimeA()%></td>
						<td><%=j.getNomeTimeB()%></td>
						<td><%=j.getGolsTimeA()%></td>
						<td><%=j.getGolsTimeB()%></td>
						<td><%=j.getDataJogo()%></td>
					</tr>
				<%}%>
			</tbody>
		</table>
	</div>
	<%}%>	
		
</body>
</html>