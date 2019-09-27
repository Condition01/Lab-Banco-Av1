<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "java.util.List"%>
<%@ page import = "model.Grupos"%>
<%@ page import = "controller.GerarGrupos"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Gerar Grupos</title>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<h3>Clique no Botao para gerar os Grupos</h3>
<br/>
	<%
		List<Grupos> lg = (List<Grupos>) session.getAttribute("LISTA2");
	%>
	
	<form action="./gerarGrupos" method="post">
		<button type="submit"  
			class="btn btn-danger" aria-label="Left Align" name="s">
  			Gerar Grupos
		</button>
	</form>
	
	
	
	<% if(lg != null && lg.size() > 0)  {%>
		<div class="container">
		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th>Grupo  </th>
					<th>codTime</th>
				</tr>
			</thead>
			<tbody>
				<% for (Grupos b: lg) { %>
					<tr>
						<td><%=b.getGrupo()%></td>
						<td><%=b.getCodTime()%></td>
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