<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<%@include file="../../../jspf/header.jspf"%>
</head>
<body>


	<div class="container">
		<div class="section">
			<div class="row">
				<div class="col s12">
					<h4 class="header">Planilla del mes de Noviembre <strong>REPUESTOS Y SERVICIOS LUCHANO</strong></h4>
				</div>
				<div id="contTable" class="col s12 m12 l12"></div>

				<div class="divider"></div>
			</div>

		</div>
		<!-- Floating Action Button -->

	</div>



	<div class="container">
		<div class="section">
			
			<div class="divider"></div>
			<div class="row">
				<section class="plans-container" id="plans"> <article	class="col s12 m6 l4">
				<div class="card z-depth-1 hoverable">
					<div class="card-image cyan waves-effect">
						<div class="card-title">MONTO TOTAL DE REMUNERACIONES </div>
						<div class="price" id="precio">
							<sup>S/</sup >29<sub></sub>
						</div>
						
					</div>
					<div class="card-content" id="cuerpoCarga">
						<ul class="collection">
							<li class="collection-item">Sueldo Basico</li>
							<li class="collection-item"><sup>S/</sup ><strong>Precio</strong><sub></sub></li>
							<li class="collection-item">Neto a Pagar</li>
							<li class="collection-item"><sup>S/</sup ><strong>Precio</strong><sub></sub></li>
						</ul>
					</div>
					
					<div class="card-action center-align">
						<button class="waves-effect waves-light  btn">Generar Informe</button>
					</div>
				</div>
				</article> <article class="col s12 m6 l8">
				<div class="container" style="width: 80%; height: 80%;">
					<h1>Reporte de mes</h1>
					<canvas id="myChart"></canvas>

				</div>

				</article>
				 </section>
				 
				 
			</div>
		</div>
	</div>
	
	
            

	<%@include file="../../../jspf/general.jspf"%>

	<script src="<c:url value='resources/js/Chart.min.js'/>"></script>
</body>
<script src="<c:url value='resources/js/planillaCore.js'/>"></script>

</html>