<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Campeonato Paulista</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<style type="text/css">
		#main{
			text-align: center;
		}
		footer{
			text-align: left;
		}
		#a1{
			text-decoration: none;
		}
		#a2{
			text-decoration: none;
		}
		img{
		  	height: 350px;
			widht: 200px;
		}
		#nav{
			widht: 100%;
			height: 80px;
			text-align: center;
		}
		h1{
			padding-top: 1%;
		}

		@media only screen and (max-width: 600px) {
		  img{
		  	height: 250px;
			widht: 100px;
		  }
		}
	</style>
</head>
<body>
	<div id="nav">
		<h1>Campeonato Paulista</h1>
	</div>
	<div class="container-fluid" id="main">
		<div class="row">
			<div class="d-flex flex-column col-sm-6">
				<a href="telagrupo.jsp" id="a1">Sortear Grupos<a>
				<a href="telagrupo.jsp"><img src="./imagens/SortearGrupos.png"></a>
			</div>
			<div class="d-flex flex-column col-sm-6">
				<a href="telajogos.jsp" id="a2">Sortear Jogos<a>
				<a href="telajogos.jsp"><img src="./imagens/SortearJogos.png"></a>
			</div>
		</div>	
		<div class="row">
			<div class="d-flex flex-column col-sm-6">
				<a href="telagols.jsp">Gerar Gols</a>
			</div>
			<div class="d-flex flex-column col-sm-6">
				<a href="telagols.jsp">Ver Campeonato</a>				
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>