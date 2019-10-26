<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Resultado"%>
<%@ page import="controller.GerarGrupos"%>

<%
	List<Resultado> listaResultado = (List<Resultado>) session.getAttribute("LISTARESULTADOG");
	int valor = (int)session.getAttribute("VALOR");
	int valorAtual = valor - 5;
	String classe = "normal";
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
				for (int i = valorAtual; i < valor; i++) {
						Resultado r = listaResultado.get(i);
						if (r.isRebaixado()) {
							classe = "rebaixado";
						} else {
							classe = "normal";
						}
			%>
			<tr class="<%=classe%>">
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
	if(valor == 20) {
		valor = 0;
	}else{
		valor = valor+5;
	}
	session.setAttribute("VALOR", valor);
%>