<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Jogos, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<title>Gerar gols</title>
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
		List<Jogos> jogos =(List<Jogos>) session.getAttribute("LISTA3");
	%>
	<h1>Gerar Gols</h1>
	<div class=container id="main">
		<div class="form-group">
			<form action="./gerarGols" method="post">
				<select name="gols" id="comboGols" class="form-control">
					<option value="1">31/01/2016</option>
					<option value="2">04/02/2016</option>
					<option value="3">08/02/2016</option>
					<option value="4">12/02/2016</option>
					<option value="5">16/02/2016</option>
					<option value="6">20/02/2016</option>
					<option value="7">23/02/2016</option>
					<option value="8">27/02/2016</option>
					<option value="9">01/03/2016</option>
					<option value="10">05/03/2016</option>
					<option value="11">08/03/2016</option>
					<option value="12">12/03/2016</option>
					<option value="13">15/03/2016</option>
					<option value="14">19/03/2016</option>
					<option value="15">22/03/2016</option>
					<option value="16">26/03/2016</option>
					<option value="17">29/03/2016</option>
					<option value="18">02/04/2016</option>
					<option value="19">05/04/2016</option>
					<option value="20">09/04/2016</option>
					<option value="21">12/04/2016</option>
					<option value="22">16/04/2016</option>
					<option value="23">19/04/2016</option>
					<option value="24">23/04/2016</option>
					<option value="25">26/04/2016</option>
					<option value="26">30/04/2016</option>
					<option value="27">03/04/2016</option>
					<option value="28">07/05/2016</option>
					<option value="29">10/05/2016</option>
					<option value="30">14/05/2016</option>
				</select>
				<div class="col-md-12 center-block" id="btn">
					<button type="submit" name="cmd" value="gerar" class="btn btn-primary" style="width: 300px">Gerar Resultado!</button>
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