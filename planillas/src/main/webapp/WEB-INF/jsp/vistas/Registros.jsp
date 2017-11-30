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

<div class="container" >
	<div class="section">
		<div id="row-grouping" class="section">

			<div class="row">
				<p>Actualizacionde UIT</p>
				 <div class="col s12 m8 l9">
                  <div class="row">
                    <form class="col s12">
                      <div class="row">
                        <div class="input-field col s6">
                          <input placeholder="UIT" id="first_name" type="text" class="validate">
                          <label for="first_name">UIT</label>
                        </div>
                        
                      </div>
                       </form>
                  </div>
                </div>
              
				
				
			</div>
		</div>

	</div>
	<center>
	<button class="btn btn-success waves-effect waves-light" type="submit" id="enviar" style="background: #0097a7 !important">ENVIAR A PLANILLA
                        <i class="mdi-content-send right"></i>
     </button>
     </center>
</div>

	<%@include file="../../../jspf/footer.jspf"%>
	<!-- ================================================
    Scripts
    ================================================ -->
	<%@include file="../../../jspf/general.jspf"%>
</body>


</html>