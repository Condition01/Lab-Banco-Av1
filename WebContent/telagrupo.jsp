<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.List"%>
<%@ page import = "model.Grupos"%>
<%@ page import = "controller.GerarGrupos"%>


<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Gerar Grupos</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<style type="text/css">
		h1{
			text-align: center;
		}
		form{
			text-align: center;
			margin-bottom: 20px;
		}
		
	</style>
</head>
<body>
	<h1>Clique no Botao para gerar os Grupos</h1>
<br/>
	<%
		List<Grupos> lg = (List<Grupos>) session.getAttribute("LISTA2");
	%>
	
	<form action="./gerarGrupos" method="post">
		<button type="submit" name="s" value="gerar" class="btn btn-primary" style="width: 300px">Gerar Grupos</button>
	</form>
	
	<% if(lg != null && lg.size() > 0)  {%>
		<div class="container">
		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th>Grupo</th>
					<th>Time</th>
				</tr>
			</thead>
			<tbody>
				<% for (Grupos b: lg) { %>
					<tr>
						<td><%=b.getGrupo()%></td>
						<td><%=b.getNome()%></td>
					</tr>
			</tbody>
			<%}%>
		</table>
	</div>
	<%}
	session.removeAttribute("LISTA2");
	%>


</body>
</html>