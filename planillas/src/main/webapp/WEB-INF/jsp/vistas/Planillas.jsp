<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<%@include file="../../../jspf/header.jspf"%>
</head>
<body>

	<div class="container">
		<div class="section">
			<div id="row-grouping" class="section">

				<div class="row">
					<p>Planillas</p>
					<div class="container">
						<div id="contTable" class="col s12 m8 l9">
						
						</div>
					</div>
					<input type="text" enable=false id="total">
				</div>
			</div>
			
			<div class="container">
				<h1>Reporte de mes </h1>
				<canvas id="myChart" class="container"></canvas>
			</div>

		</div>
	</div>

	<%@include file="../../../jspf/footer.jspf"%>
	<!-- ================================================
    Scripts
    ================================================ -->
	<%@include file="../../../jspf/general.jspf"%>
	
	<script src="<c:url value='resources/js/Chart.min.js'/>"></script>
</body>
<script src="<c:url value='resources/js/planillaCore.js'/>"></script>

</html>