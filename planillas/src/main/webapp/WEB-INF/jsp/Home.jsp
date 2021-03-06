<%@page import="pe.edu.upeu.planilla.model.UsuarioDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sistema de planillas | Contabilidad</title>



<!-- CSS -->
<%@include file="../../jspf/header.jspf"%>

<%
	HttpSession sesion = request.getSession();
	UsuarioDTO cli = (UsuarioDTO) session.getAttribute("u");
	if (cli != null) {
%>

</head>
<body>
	<!-- Start Page Loading -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>
	<!-- End Page Loading -->

	<!-- START HEADER -->
	<header id="header" class="page-topbar"> <!-- start header nav-->
	<div class="navbar-fixed">
		<nav class="navbar-color">
		<div class="nav-wrapper">
			<ul class="left">
				<li><h1 class="logo-wrapper">
						<a href="#" class="brand-logo darken-1"><img
							src="<c:url value='resources/plugin/images/materialize-logo.png'/>"
							alt="materialize logo"></a> <span class="logo-text">Planillas</span>
					</h1></li>
			</ul>
			<div class="header-search-wrapper hide-on-med-and-down">
				<i class="mdi-action-search"></i> <input type="text" name="Search"
					class="header-search-input z-depth-2"
					placeholder="Explore Materialize" />
			</div>
			<ul class="right hide-on-med-and-down">

				<li><a href="javascript:void(0);"
					class="waves-effect waves-block waves-light toggle-fullscreen"><i
						class="mdi-action-settings-overscan"></i></a></li>
				<li><a href="javascript:void(0);"
					class="waves-effect waves-block waves-light notification-button"
					data-activates="notifications-dropdown"><i
						class="mdi-social-notifications"><small
							class="notification-badge">5</small></i> </a></li>
				<li><a href="#" data-activates="chat-out"
					class="waves-effect waves-block waves-light chat-collapse"><i
						class="mdi-communication-chat"></i></a></li>
			</ul>
			<!-- notifications-dropdown -->
			<ul id="notifications-dropdown" class="dropdown-content">
				<li>
					<h5>
						NOTIFICATIONS <span class="new badge">2</span>
					</h5>
				</li>
				<li class="divider"></li>
				<li><a href="#!"><i class="mdi-action-add-shopping-cart"></i>
						A new order has been placed!</a> <time class="media-meta"
						datetime="2015-06-12T20:50:48+08:00">2 hours ago</time></li>
				<li><a href="#!"><i class="mdi-action-stars"></i> Completed
						the task</a> <time class="media-meta"
						datetime="2015-06-12T20:50:48+08:00">3 days ago</time></li>
				<li><a href="#!"><i class="mdi-action-settings"></i>
						Settings updated</a> <time class="media-meta"
						datetime="2015-06-12T20:50:48+08:00">4 days ago</time></li>
				<li><a href="#!"><i class="mdi-editor-insert-invitation"></i>
						Director meeting started</a> <time class="media-meta"
						datetime="2015-06-12T20:50:48+08:00">6 days ago</time></li>
				<li><a href="#!"><i class="mdi-action-trending-up"></i>
						Generate monthly report</a> <time class="media-meta"
						datetime="2015-06-12T20:50:48+08:00">1 week ago</time></li>
			</ul>
		</div>
		</nav>
	</div>
	<!-- end header nav--> </header>
	<!-- END HEADER -->

	<!-- //////////////////////////////////////////////////////////////////////////// -->

	<!-- START MAIN -->
	<div id="main">
		<!-- START WRAPPER -->
		<div class="wrapper">

			<!-- START LEFT SIDEBAR NAV-->

			<aside id="left-sidebar-nav">
			<ul id="slide-out" class="side-nav fixed leftside-navigation">
				<li class="user-details cyan darken-2">
					<div class="row">
						<div class="col col s4 m4 l4">
							<img src="<c:url value='resources/plugin/images/avatar.jpg'/>"
								alt="" class="circle responsive-img valign profile-image">
						</div>
						<div class="col col s8 m8 l8">
							<ul id="profile-dropdown" class="dropdown-content">
								<li><a href="#"><i class="mdi-action-face-unlock"></i>
										Profile</a></li>
								<li><a href="#"><i class="mdi-action-settings"></i>
										Settings</a></li>
								<li><a href="#"><i class="mdi-communication-live-help"></i>
										Help</a></li>
								<li class="divider"></li>
								<li><a href="#"><i class="mdi-action-lock-outline"></i>
										Lock</a></li>
								<li><a href="logout"><i
										class="mdi-hardware-keyboard-tab"></i> Logout</a></li>
							</ul>
							<a
								class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn"
								href="#" data-activates="profile-dropdown"><%=cli.getUsuario()%><i
								class="mdi-navigation-arrow-drop-down right"></i></a>
							<%
								if (cli.getIdrol() == 1) {
							%>
							<p class="user-roal">GTH</p>
							<%
								} else if (cli.getIdrol() == 2) {
							%>
							<p class="user-roal">Contador</p>
							<%
								} else if (cli.getIdrol() == 3) {
							%>
							<p class="user-roal">Administador</p>
							<%
								} else {
							%>
							<p class="user-roal">Otro</p>
							<%
								}
							%>
						</div>
					</div>
				</li>
				<%
					if ((cli.getIdrol() == 1)) {
				%>

				<li class="bold"><a href="#" id="home" name="myframe"
					class="waves-effect waves-cyan"><i class="mdi-action-dashboard"></i>
						Home</a></li>
				<li class="bold"><a href="#" id="con" name="myframe"
					class="waves-effect waves-cyan"><i class="mdi-action-dashboard"></i>
						Contratación</a></li>
				<li class="bold"><a href="#" id="trabajo" name="myframe"
					class="waves-effect waves-cyan"><i class="mdi-action-dashboard"></i>
						Reg. Trabajadores</a></li>
				<li class="bold"><a href="#" id="planilla" name="myframe"
					class="waves-effect waves-cyan"><i class="mdi-action-dashboard"></i>
						Planillas</a></li>
				<li class="bold"><a href="#" id="basic" name="myframe"
					class="waves-effect waves-cyan"><i class="mdi-action-dashboard"></i>
						Registros Basicos</a></li>
				
				<%
					} else if (cli.getIdrol() == 3) {
				%>
				<li class="bold"><a href="#" name="myframe"
					class="waves-effect waves-cyan"><i class="mdi-action-dashboard"></i>
						Home</a></li>
				<li class="bold"><a href="#" id="planilla" name="myframe"
					class="waves-effect waves-cyan"><i class="mdi-action-dashboard"></i>
						Planillas</a></li>
				

				<%
					}else {
				%>
				<li class="bold"><a href="#" id="home" name="myframe"
					class="waves-effect waves-cyan"><i class="mdi-action-dashboard"></i>
						Home</a></li>
				<li class="bold"><a href="#" id="con" name="myframe"
					class="waves-effect waves-cyan"><i class="mdi-action-dashboard"></i>
						Contratación</a></li>
				<li class="bold"><a href="#" id="trabajo" name="myframe"
					class="waves-effect waves-cyan"><i class="mdi-action-dashboard"></i>
						Reg. Trabajadores</a></li>
				<li class="bold"><a href="#" id="planilla" name="myframe"
					class="waves-effect waves-cyan"><i class="mdi-action-dashboard"></i>
						Planillas</a></li>
				<%
					}
				%>
			</ul>
			<a href="#" data-activates="slide-out"
				class="sidebar-collapse btn-floating btn-medium waves-effect waves-light hide-on-large-only cyan"><i
				class="mdi-navigation-menu"></i> </a> </aside>

			<!-- END LEFT SIDEBAR NAV-->

			<!-- //////////////////////////////////////////////////////////////////////////// -->

			<!-- START CONTENT -->
			<section id="content"> <!--breadcrumbs start-->
			<div id="breadcrumbs-wrapper">
				<!-- Search for small screen -->
				<div class="header-search-wrapper grey hide-on-large-only">
					<i class="mdi-action-search active"></i> <input type="text"
						name="Search" class="header-search-input z-depth-2"
						placeholder="Explore Materialize">
				</div>
				<div class="container">
					<div class="row">
						<div class="col s12 m12 l12">

							<ol class="breadcrumbs">
								<li><a href="index.html">Dashboard</a></li>
								<li><a href="#">CSS</a></li>
								<li class="active">Grid</li>
							</ol>
						</div>
					</div>
				</div>
			</div>

			<!-- //////////////////////////////////////////////////////////////////////////// -->

			<!--start container-->

			<div class="container">
				<div class="container" id="Contenido" class="newContent"></div>

				<div id="content" class="oldContent">

					<div class="row">
						<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
							<h1 class="page-title txt-color-blueDark"
								style="margin: 0px 0px 0px;">
								<i class="fa-fw fa fa-home" id="icon_menu"></i><label
									class="titulo_menu"></label><span> </span>
							</h1>
						</div>
						<div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
							<div class="animacion_load"></div>
						</div>

						<iframe id="myframe" name="myframe" class="iframe_principal"
							scrolling="si" width="100%" height="2000" frameborder="0"
							src="<c:url value='C'/>"></iframe>
					</div>
				</div>

			</div>



			<!-- //////////////////////////////////////////////////////////////////////////// -->

			<!--end container--> </section>
		</div>
	</div>



	<%@include file="../../jspf/footer.jspf"%>
	<!-- ================================================
    Scripts
    ================================================ -->
	<%@include file="../../jspf/general.jspf"%>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#con").click(function() {
				$('#myframe').attr('src', '<c:url value="cont"/>');
				$(".newContent").hide();
				$(".oldContent").show();

			});

			$("#home").click(function() {
				$('#myframe').attr('src', '<c:url value="C"/>');
				$(".newContent").hide();
				$(".oldContent").show();

			});

			$("#trabajo").click(function() {
				$('#myframe').attr('src', '<c:url value="tra"/>');
				$(".newContent").hide();
				$(".oldContent").show();

			});

			$("#planilla").click(function() {
				$('#myframe').attr('src', '<c:url value="planilla"/>');
				$(".newContent").hide();
				$(".oldContent").show();

			});

			$("#boletas").click(function() {
				$('#myframe').attr('src', '<c:url value="boletas"/>');
				$(".newContent").hide();
				$(".oldContent").show();

			});
			
			$("#basic").click(function() {
				$('#myframe').attr('src', '<c:url value="basic"/>');
				$(".newContent").hide();
				$(".oldContent").show();

			});

			
		});
	</script>


</body>
<%
	} else {
		out.print("<script> window.parent.location.href = '/planillas/';</script>");
	}
%>
</html>