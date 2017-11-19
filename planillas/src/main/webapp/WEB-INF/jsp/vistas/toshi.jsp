<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900"
	rel="stylesheet">

<script src="https://use.fontawesome.com/6a6312675e.js"></script>


<link rel="stylesheet"
	href="<c:url value='resources/wizard/css/style.css'/>">

<%@include file="../../../jspf/header.jspf"%>
</head>
<body>

	<div class="container" >
		<div class="wrapper" >
			<div id="wizard" class="wizard">
				<div class="wizard__content">
					<header class="wizard__header">
					<div class="wizard__header-overlay"></div>

					<div class="wizard__header-content">
						<h1 class="wizard__title">Bienvenido al area de
							Contrataciones !!</h1>
						<p class="wizard__subheading">
							Repuestos y Servicios Luchano <strong>SAC.</strong>
						</p>
						<br>
					</div>

					<div class="wizard__steps">
						<nav class="steps">
						<div class="step">
							<div class="step__content">
								<p class="step__number">
									<i class="fa fa-github-alt"></i>
								</p>
								<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
									viewBox="0 0 52 52"> <circle class="checkmark__circle"
									cx="26" cy="26" r="25" fill="none" /> <path
									class="checkmark__check" fill="none"
									d="M14.1 27.2l7.1 7.2 16.7-16.8" /> </svg>

								<div class="lines">
									<div class="line -start"></div>

									<div class="line -background"></div>

									<div class="line -progress"></div>
								</div>
							</div>
						</div>

						<div class="step">
							<div class="step__content">
								<p class="step__number">
									<i class="fa fa-book"></i>
								</p>
								<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
									viewBox="0 0 52 52"> <circle class="checkmark__circle"
									cx="26" cy="26" r="25" fill="none" /> <path
									class="checkmark__check" fill="none"
									d="M14.1 27.2l7.1 7.2 16.7-16.8" /> </svg>

								<div class="lines">
									<div class="line -background"></div>

									<div class="line -progress"></div>
								</div>
							</div>
						</div>

						<div class="step">
							<div class="step__content">
								<p class="step__number">
									<i class="fa fa-group"></i>
								</p>
								<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
									viewBox="0 0 52 52"> <circle class="checkmark__circle"
									cx="26" cy="26" r="25" fill="none" /> <path
									class="checkmark__check" fill="none"
									d="M14.1 27.2l7.1 7.2 16.7-16.8" /> </svg>

								<div class="lines">
									<div class="line -background"></div>

									<div class="line -progress"></div>
								</div>
							</div>
						</div>
						</nav>
					</div>
					</header>


					<div class="panels">
						<div class="panel">

							<header class="panel__header">
							<h2 class="panel__title">Registros Personales</h2>
							</header>

							<div class="panel__content">
								<div class="col s12 m8 l9">
									<div class="row">
										<form class="col s12">

											<div class="row">
												<div class="input-field col s6">
													<input id="nombre" type="text" class="validate"> <label
														for="last_name">Nombre</label>
												</div>
												<div class="input-field col s6">
													<input id="apellido" type="text" class="validate">
													<label for="last_name">Apellido</label>
												</div>
											</div>

											<div class="row">
												<div class="col s12 m12 l12">
													<div class="input-field col s4">
														<select>
															<option value="" disabled>Tipo Documento</option>
															<option value="DNI" selected>DNI</option>
															<option value="Carnet">Carnet Extranjeria</option>
														</select> <label>Selecciona Identificacion</label>
													</div>
													<div class="input-field col s8">
														<input id="numdoc" type="text" class="validate"> <label
															for="password">Numero</label>
													</div>
												</div>

											</div>
											<div class="row">
												<div class="input-field col s12">
													<input id="direcc" type="text" class="validate"> <label
														for="password">Direccion</label>
												</div>
											</div>

											<div class="row">
												<div class="input-field col s6">
													<input id="phone-demo" type="text" class=""> <label
														for="phone_demo">Phone</label>
												</div>
												<div class="input-field col s6">
													<select>
														<option value="" disabled>Estado Civil</option>
														<option value="Soltero" selected>Solero</option>
														<option value="Casado">Casado</option>
														<option value="Viudo">Viudo</option>
													</select> <label>Selecciona Estado Civil</label>
												</div>
											</div>

											<div class="row">
												<div class="input-field col s8">
													<input id="correo" type="email" class="validate"> <label
														for="password">E-mail</label>
												</div>
												<div class="input-field col s4">
													<select>
														<option value="" disabled>Sexo</option>
														<option value="M" selected>M</option>
														<option value="F">F</option>
													</select> <label>Selecciona Sexo</label>
												</div>
											</div>
											<div class="row">
												<div class="input-field col s6">
													<input placeholder="2015-01-01" id="fecha_nac" type="text"
														class=""> <label for="date_demo1">Fecha de
														nacimientos</label>
												</div>
												<div class="row section">
													<div class="col s12 m4 l12">
														<p>Selecciona foto de perfil</p>
													</div>
													<div class="col s12 m8 l12">
														<input type="file" id="foto" class="dropify"
															data-default-file="" />
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>


							</div>
							<p class="panel__content">
								En presente apartado representa el area de contrataciones para
								la empresa <strong>Repuestos y servicios Lucharno SAC.</strong>
								porfavor rellenar los campos correctamente. Atte:
								<stong>Secretaria General.</stong>
							</p>

						</div>

						<div class="panel">

							<header class="panel__header">
							<h2 class="panel__title">Area de Registro Familiar</h2>
							</header>

							<div class="panel__content">
								<div class="col s12 m8 l9">
									<div class="row">
										<form class="col s12">
											<div class="row">
												<div class="input-field col s6">
													<input id="nombre" type="text" class="validate"> <label
														for="last_name">Nombre</label>
												</div>
												<div class="input-field col s6">
													<input id="apellido" type="text" class="validate">
													<label for="last_name">Apellido</label>
												</div>
											</div>

											<div class="row">
												<div class="col s12 m12 l12">
													<div class="input-field col s4">
														<select>
															<option value="" disabled>Tipo Documento</option>
															<option value="DNI" selected>DNI</option>
															<option value="Carnet">Carnet Extranjeria</option>
														</select> <label>Selecciona Identificacion</label>
													</div>
													<div class="input-field col s8">
														<input id="numdoc" type="text" class="validate"> <label
															for="password">Numero</label>
													</div>
												</div>

											</div>
											<div class="row">
												<div class="col s12 m12 l12">
													<div class="input-field col s6">
														<select>
															<option value="" disabled>Parentescp</option>
															<option value="hijo" selected>Hijo (a)</option>
															<option value="esposa">Esposa</option>
														</select> <label>Selecciona Parentesco</label>
													</div>

													<div class="input-field col s6">
														<select>
															<option value="" disabled>Educacion</option>
															<option value="primaria" selected>Primaria</option>
															<option value="secundaria">Secundaria</option>
															<option value="superiro">Superiror</option>
														</select> <label>Selecciona Educacion</label>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<p class="panel__content">
								En presente apartado representa el area de contrataciones para
								la empresa <strong>Repuestos y servicios Lucharno SAC.</strong>
								porfavor rellenar los campos correctamente. Atte:
								<stong>Secretaria General.</stong>
							</p>



						</div>

						<div class="panel">


							<header class="panel__header">
							<h2 class="panel__title">Comtrato</h2>
							</header>

							<div class="panel__content">
								<div class="col s12 m8 l9">
									<div class="row">
										<form class="col s12">
											<div class="row">
												<div class="input-field col s6">
													<input id="codigo" type="text" class="validate"> <label
														for="last_name">Codigo Empleado</label>
												</div>

												<div class="input-field col s6">
													<select>
														<option value="" disabled>Cargo</option>
														<option value="DNI" selected>DNI</option>
														<option value="Carnet">Carnet Extranjeria</option>
													</select> <label>Selecciona Cargo</label>
												</div>

											</div>

											<div class="row">
												<div class="col s12 m12 l12">
													<div class="input-field col s6">
														<input id="txtDate1" type="date" class="datepicker">
														<label for="password">Inicio</label>
													</div>
													<div class="input-field col s6">
														<input id="txtDate2" type="date" class="datepicker">
														<label for="password">Fin</label>
													</div>
												</div>

											</div>
											<div class="row">
												<div class="input-field col s6">
													<select>
														<option value="" disabled>Seguro</option>
														<option value="DNI" selected>DNI</option>
														<option value="Carnet">Carnet Extranjeria</option>
													</select> <label>Selecciona Seguro</label>
												</div>
												<div class="input-field col s6">
													<select>
														<option value="" disabled>Categoria</option>
														<option value="DNI" selected>DNI</option>
														<option value="Carnet">Carnet Extranjeria</option>
													</select> <label>Selecciona Cateogria</label>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<p class="panel__content">
								En presente apartado representa el area de contrataciones para
								la empresa <strong>Repuestos y servicios Lucharno SAC.</strong>
								porfavor rellenar los campos correctamente. Atte:
								<stong>Secretaria General.</stong>
							</p>
						</div>
					</div>

					<div class="wizard__footer">
						<button class="button previous">Previous</button>
						<button class="button next">Next</button>
					</div>
				</div>

				<h1 class="wizard__congrats-message">
					<strong>Gracias..!</strong> Ha sido registrado con exito--!!
				</h1>
			</div>
		</div>
	</div>
	<%@include file="../../../jspf/general.jspf"%>
	
	<script	src='https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.4/lodash.min.js'></script>

	<script src="<c:url value='resources/wizard/js/index.js'/>"></script>
	
	<script type="text/javascript">
		$(document).ready(
				function() {
					// Basic
					$('.dropify').dropify();

					// Used events
					var drEvent = $('.dropify-event').dropify();

					drEvent.on('dropify.beforeClear', function(event, element) {
						return confirm("Do you really want to delete \""
								+ element.filename + "\" ?");
					});

					drEvent.on('dropify.afterClear', function(event, element) {
						alert('File deleted');
					});
				});

		// Basic

		$('#date-demo1').formatter({
			'pattern' : '{{9999}}-{{99}}-{{99}}',
		});

		// Advanced

		$('#phone-demo').formatter({
			'pattern' : '({{999}}) {{999}}-{{999}}',
			'persistent' : true
		});

		$('.datepicker').pickadate({
			min : new Date(),
		});

		$('.datepicker').pickadate({
			selectMonths : true, // Creates a dropdown to control month
			selectYears : 15
		// Creates a dropdown of 15 years to control year
		});

		$(function() {
			$('#txtDate1').datepicker();
			$('#txtDate1').datepicker('option', {
				dateFormat : 'yyyy-mm-dd'
			});
		});
	</script>

</body>
</html>