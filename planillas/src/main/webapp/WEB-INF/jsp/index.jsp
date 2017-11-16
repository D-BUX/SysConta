<%@page import="pe.edu.upeu.planilla.model.UsuarioDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
							<p class="user-roal">ROOt</p>
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
					if ((cli.getIdrol() == 1) || (cli.getIdrol() == 2)) {
				%>

				<li class="bold"><a href="#" class="waves-effect waves-cyan"><i
						class="mdi-action-dashboard"></i> Home</a></li>
				<li class="bold"><a href="contrato" onclick="listarCliente();"
					id="click" class="waves-effect waves-cyan"><i
						class="mdi-action-dashboard"></i> Contratacion</a></li>
				<li class="bold"><a href="#" class="waves-effect waves-cyan"><i
						class="mdi-action-dashboard"></i> Reg. Trabajadores</a></li>
				<li class="bold"><a href="#" class="waves-effect waves-cyan"><i
						class="mdi-action-dashboard"></i> Planillas</a></li>
				<li class="bold"><a href="#" class="waves-effect waves-cyan"><i
						class="mdi-action-dashboard"></i> Boletas</a></li>
				<%
					} else if (cli.getIdrol() == 3) {
				%>
				<li class="bold"><a href="#" class="waves-effect waves-cyan"><i
						class="mdi-action-dashboard"></i> Home</a></li>
				<li class="bold"><a href="#" class="waves-effect waves-cyan"><i
						class="mdi-action-dashboard"></i> Planillas</a></li>
				<li class="bold"><a href="#" class="waves-effect waves-cyan"><i
						class="mdi-action-dashboard"></i> Boletas</a></li>

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
							<h5 class="breadcrumbs-title">
								Hola ,
								<%=cli.getUsuario()%></h5>
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
			<div class="container" id="Contenido">

				<div class="section">
					<div id="row-grouping" class="section">

						<div class="row">
							<p>Lista de Trabajadores Contratados</p>
							<div class="col s12 m12 l9">
								<table id="data-table-row-grouping" class="display"
									cellspacing="0" width="100%">
									<thead>
										<tr>
											<th>Name</th>
											<th>Position</th>
											<th>Office</th>
											<th>Age</th>
											<th>Start date</th>
											<th>Salary</th>
										</tr>
									</thead>



									<tbody>


										<tr>
											<td>Haley Kennedy</td>
											<td>Senior Marketing Designer</td>
											<td>London</td>
											<td>43</td>
											<td>2012/12/18</td>
											<td>$313,500</td>
										</tr>
										<tr>
											<td>Tatyana Fitzpatrick</td>
											<td>Regional Director</td>
											<td>London</td>
											<td>19</td>
											<td>2010/03/17</td>
											<td>$385,750</td>
										</tr>
										<tr>
											<td>Michael Silva</td>
											<td>Marketing Designer</td>
											<td>London</td>
											<td>66</td>
											<td>2012/11/27</td>
											<td>$198,500</td>
										</tr>


										<tr>
											<td>Haley Kennedy</td>
											<td>Senior Marketing Designer</td>
											<td>London</td>
											<td>43</td>
											<td>2012/12/18</td>
											<td>$313,500</td>
										</tr>
										<tr>
											<td>Tatyana Fitzpatrick</td>
											<td>Regional Director</td>
											<td>London</td>
											<td>19</td>
											<td>2010/03/17</td>
											<td>$385,750</td>
										</tr>
										<tr>
											<td>Michael Silva</td>
											<td>Marketing Designer</td>
											<td>London</td>
											<td>66</td>
											<td>2012/11/27</td>
											<td>$198,500</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

				</div>
			</div>

			<!-- //////////////////////////////////////////////////////////////////////////// -->

			<!--end container--> </section>
		</div>
	</div>

	<div class="fixed-action-btn horizontal click-to-toggle"
		style="position: absolute; right: 19px;">
		<a class="btn-floating btn-large red"> <i
			class="mdi-navigation-menu"></i>
		</a>
		<ul>
			<li><a class="btn-floating red"><i
					class="large mdi-editor-insert-chart"></i></a></li>
			<li><a class="btn-floating yellow darken-1"><i
					class="large mdi-editor-format-quote"></i></a></li>
			<li><a class="btn-floating green"><i
					class="large mdi-editor-publish"></i></a></li>
			<li><a class="btn-floating blue"><i
					class="large mdi-editor-attach-file"></i></a></li>
		</ul>
	</div>


	<%@include file="../../jspf/footer.jspf"%>
	<!-- ================================================
    Scripts
    ================================================ -->
	<%@include file="../../jspf/general.jspf"%>
	<script type="text/javascript">
	
	$(document).ready(function (){  
	    
	});
 
	function listarCliente(){
		  alert("cliente");
	    $.get("cc",{opc:"cargar"},function (data){
	       $("#contenido").html(data);
	       // alert(data);
	     });    
	
	/*$("#click").click(function listarCliente(){
		   // alert("cliente");
	    $.get("cc",{opc:"cargar"},function (data){
	       $("#contenido").html(data);
	       // alert(data);
	     });    
		
	});*/
	
	</script>


</body>
<%
	} else {
		out.print("<script> window.parent.location.href = '/planillas/';</script>");
	}
%>
</html>