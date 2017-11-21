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
					<p>Lista de Trabajadores Contratados</p>
					<div id="contTable" class="col s12 m12 l9"></div>
				</div>
			</div>

		</div>
	</div>

	<%@include file="../../../jspf/footer.jspf"%>
	<!-- ================================================
    Scripts
    ================================================ -->
	<%@include file="../../../jspf/general.jspf"%>
</body>
<script src="<c:url value='resources/js/empleado.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.btn-success').click(function() {
			swal("Good job!", "You clicked the button!", "success");
		});
	});
</script>
</html>