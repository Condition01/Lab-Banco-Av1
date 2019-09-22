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
		img{
			height: 500px;
			widht: 350px;
		}
		#main{
			text-align: center;
		}
		body{
			background-color: #000
		}
		h1{
			color: #eec700;
		}
		footer{
			text-align: left;
		}
		
		@media only screen and (max-width: 600px) {
		  img{
		  	height: 350px;
			widht: 200px;
		  }
		}
	</style>
</head>
<body>
	<div class="container-fluid" id="main">
		<div id="nav">
			<h1>CAMPEONATO PAULISTA</h1>
		</div>
		<div class="row">
			<div class="d-flex flex-column col-sm-6">
				<a href="telagrupo.jsp"><img src="./imagens/grupos.png"></a>
			</div>
			<div class="d-flex flex-column col-sm-6">
				<a href="telajogos.jsp"><img src="./imagens/jogos.png"></a>
			</div>
		</div>	
		<div>
			<p id="copyright">&copy; Bruno e Everson<p>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>