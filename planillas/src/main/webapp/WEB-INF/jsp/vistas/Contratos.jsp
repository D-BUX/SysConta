<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SysConta</title>
<!-- Materializecss compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<!--Import Google Icon Font-->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import Materialize-Stepper CSS (after importing materialize.css) -->


<link
	href="<c:url value='resources/stepper/materialize-stepper.min.css'/>"
	type="text/css" rel="stylesheet" media="screen,projection">

</head>
<body>

	<div class="container">

		<h3>
			Area de Contrataciones y Registro de Trabajadores <strong>UPEU</strong>
		</h3>
		<br>
		<ul class="stepper linear">
			<li class="step active">
				<div class="step-title waves-effect">
					<strong>DATOS PERSONALES</strong>
				</div>

				<div class="step-content">
					<div class="row">
						<div class="input-field col s12">
							<input id="nombre" name="text" type="text" class="validate" required>
							<label for="first_name">Nombre</label>
						</div>
						<div class="input-field col s12">
							<input id="apellido" name="text" type="text" class="validate"
								required> <label for="first_name" required>Apellido</label>
						</div>
						<div class="input-field col s12">
							<input id="text" name="text" type="text" class="validate"
								required> <label for="first_name" required>Nombre</label>
						</div>
						<div class="input-field col s12">
							<input id="text" name="text" type="text" class="validate"
								required> <label for="first_name" required>Nombre</label>
						</div>
						<div class="input-field col s12">
							<input id="text" name="text" type="text" class="validate"
								required> <label for="first_name" required>Nombre</label>
						</div>

					</div>
					<div class="step-actions">

						<button class="waves-effect waves-dark btn next-step">CONTINUE</button>
					</div>
				</div>
			</li>
			<li class="step">
				<div class="step-title waves-effect">Passo 2</div>
				<div class="step-content">
					<div class="row">
						<div class="input-field col s12">
							<input id="password" name="password" type="password"
								class="validate" required> <label for="password">Your
								password</label>
						</div>
					</div>
					<div class="step-actions">
						<button class="waves-effect waves-dark btn next-step">CONTINUE</button>
						<button class="waves-effect waves-dark btn-flat previous-step">BACK</button>
					</div>
				</div>
			</li>
			<li class="step">
				<div class="step-title waves-effect">Fim!</div>
				<div class="step-content">
					Finish!
					<div class="step-actions">
						<button class="waves-effect waves-dark btn" type="submit">SUBMIT</button>
					</div>
				</div>
			</li>
		</ul>

	</div>
</body>


<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- Materializecss compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<!-- jQueryValidation Plugin -->
<script
	src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.15.0/jquery.validate.min.js"></script>
<!--Import Materialize-Stepper JavaScript (after the jquery.validate.js and materialize.js) -->


<script type="text/javascript"
	src="<c:url value='resources/stepper/materialize-stepper.min.js'/>"></script>


<script>
	$(function() {
		$('.stepper').activateStepper();
	});
</script>
</html>