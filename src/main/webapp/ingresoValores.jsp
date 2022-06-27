<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Formulario de ingreso</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	
	<link href="css/estilos.css" rel="stylesheet">
</head>

<body>

<% HttpSession sessionUser = request.getSession();  
	String userName = (String)sessionUser.getAttribute("nombre");

%>
	<nav class="navbar navbar-dark bg-dark navbar-expand-lg">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Generador Factura</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
				aria-controls="navbarNavAltMarkup" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav ms-auto">
					<a class="nav-link active" aria-current="page" href="#"><%=userName%></a> 
					<a class="nav-link" href="procesaFactura">Genera Factura</a> 
					<a class="nav-link" href="#">Pricing</a> 
					<a href="deslogueo" class="nav-link">Desloguearse</a>
				</div>
			</div>
		</div>
	</nav>


	<section class="container mt-5 border border-dark bg-dark text-light">
			<form class="mt-5 p-5 m-auto" action="procesaFactura" method="POST">

				<div class="row">
					<div class="col-sm-12 col-md-6 col-lg-4">
						<label for="nombre"> Nombre Completo </label>
						<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre Completo"
							required>
					</div>
					<div class="col-sm-12 col-md-4 col-lg-4">
						<label for="empresa">Empresa</label>
						<input type="text" class="form-control" id="empresa" name="empresa" placeholder="Nombre Empresa"
							required>
					</div>
					<div class="col-sm-12 col-md-6 col-lg-4">
						<label for="rut"> Identificador </label>
						<input type="text" class="form-control" id="rut" name="rut" placeholder="11111111-1" required>						
					</div>
					<div class="col-sm-12 col-md-6 col-lg-4">
						<label for="direccion"> Dirección </label>
						<input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección"
							required>
					</div>
					<div class="col-sm-12 col-md-6 col-lg-4">
						<label for="ciudad"> Ciudad </label>
						<input type="text" class="form-control" id="ciudad" name="ciudad" placeholder="Ciudad" required>
					</div>
					<div class="col-sm-12 col-md-6 col-lg-4">
						<label for="pais">País Cliente </label>
						<input type="text" class="form-control" id="pais" name="pais" placeholder="País" required>
					</div>
				</div>

				<table class="table table-dark table-striped mt-4">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Item</th>
							<th scope="col">Descripción</th>
							<th scope="col">Valor Unitario</th>
							<th scope="col">Cantidad</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>Valvulas Titanio</td>
							<td>Valvulas de carrera</td>
							<td>$120.000</td>
							<td>
								<input type="number" class="form-control" id="valvulas" name="valvulas" placeholder="Cantidad"
									required value="0">
							</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>Turbo Full Carrera</td>
							<td>Turbo de competicion multimarca</td>
							<td>$1.700.000</td>
							<td>
								<input type="number" class="form-control" id="turbo" name="turbo" placeholder="Cantidad" required value="0">
							</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>Kit Freno Competicion</td>
							<td>Juego de discos, balatas, caliper de competicion</td>
							<td>$760.000</td>
							<td>
								<input type="number" class="form-control" id="frenos" name="frenos" placeholder="Cantidad" required value="0">
							</td>
						</tr>
						<tr>
							<th scope="row">4</th>
							<td>Sistema de Refrigeración</td>
							<td>Sistema de enfriamiento motor Carrera</td>
							<td>$2.300.000</td>
							<td>
								<input type="number" class="form-control" id="refri" name="refri" placeholder="Cantidad"
									required value="0">
							</td>
						</tr>
						<tr>
							<th scope="row">5</th>
							<td>Plumillas Standar</td>
							<td>Plumillas Limpiaparabrisas para lluvia</td>
							<td>$10.000</td>
							<td>
								<input type="number" class="form-control" id="plumas" name="plumas" placeholder="Cantidad"
									required value="0">
							</td>
						</tr>
					</tbody>
				</table>

				<div style="margin:0 auto; padding-left: 20px; padding-bottom:20px; float: right;">
					<button type="submit" class="btn btn-primary">Genera Factura</button>
					<button type="reset" class="btn btn-danger">Limpiar</button>
				</div>
			</form>
		</section>

	<!-- Bootstrap popperjs -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<!--bootstrap js-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>

</html>