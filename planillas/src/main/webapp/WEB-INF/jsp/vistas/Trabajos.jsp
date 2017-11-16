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
			
			<h5>Lista de Trabajadores Contratados</h5>
			<div class="col s12 m4 l3">
                  <p>DataTables has most features enabled by default, so all you need to do to use it with your own tables is to call the construction function.</p>

                  <p>Searching, ordering, paging etc goodness will be immediately added to the table, as shown in this example.</p>
                </div>
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

</html>