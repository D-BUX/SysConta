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
<p><a class="waves-effect waves-light btn modal-trigger  light-blue" href="#modal1">Modal</a>
                </p>
				<div class="divider"></div>
			</div>

		</div>
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

				</article> </section>
			</div>
		</div>
		<!-- Floating Action Button -->
	</div>



<!-- inicia js -->
	<div class="col s12 m8 l9" id="ocul">
                
                <div id="modal1" class="modal">
                  <div class="modal-content">
                   
        <div class="container">
          <div id="invoice">
            <div class="invoice-header">
              <div class="row section">
                <div class="col s12 m6 l6">
                  <img src="<c:url value='resources/plugin/images/generic-logo.png'/>" alt="company logo">
                  <p>To,
                    <br/>
                    <span class="strong">Jonathan Doe</span>
                    <br/>
                    <span>125, ABC Street,</span>
                    <br/>
                    <span>New Yourk, USA</span>
                    <br/>
                    <span>+91-(444)-(333)-(221)</span>
                  </p>
                </div>

                <div class="col s12 m6 l6">
                  <div class="invoce-company-address right-align">
                    <span class="invoice-icon"><i class="mdi-social-location-city cyan-text"></i></span>

                    <p><span class="strong">Company Name LLC</span>
                      <br/>
                      <span>125, ABC Street,</span>
                      <br/>
                      <span>New Yourk, USA</span>
                      <br/>
                      <span>+91-(444)-(333)-(221)</span>
                    </p>
                  </div>

                  <div class="invoce-company-contact right-align">
                    <span class="invoice-icon"><i class="mdi-communication-quick-contacts-mail cyan-text"></i></span>
                    <p><span class="strong">www.exampledomain.com</span>
                      <br/>
                      <span>info@exampledomain.com</span>
                      <br/>
                      <span>admin@exampledomain.com</span>
                    </p>
                  </div>

                </div>
              </div>
            </div>

            <div class="invoice-lable">
              <div class="row">
                <div class="col s12 m3 l3 cyan">
                  <h4 class="white-text invoice-text">CARGA</h4>
                </div>
                <div class="col s12 m9 l9 invoice-brief cyan white-text">
                  <div class="row">
                    <div class="col s12 m3 l3">
                      <p class="strong"><strong>TOTAL INGRESOS</strong></p>
                      <h4 class="header"><sup>S/</sup >29<sub></sub></h4>
                    </div>
                    <div class="col s12 m3 l3">
                      <p class="strong"><strong>TOTAL DESCUENTOS</strong></p>
                      <h4 class="header"><sup>S/</sup >29<sub></sub></h4>
                    </div>
                    <div class="col s12 m3 l3">
                      <p class="strong"><strong>TOTAL APORTES </strong></p>
                      <h4 class="header"><sup>S/</sup >29<sub></sub></h4>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="invoice-table">
              <div class="row">
                <div class="col s12 m12 l12">
                  <table class="striped">
                    <thead>
                      <tr>
                        <th data-field="no">No</th>
                        <th data-field="item">Ingresos</th>
                        <th data-field="uprice">Descuentos</th>
                        <th data-field="price">Aporte de Empleador</th>
                        <th data-field="price">Total</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1.</td>
                        <td>MacBook Pro</td>
                        <td>$ 1,299.00</td>
                        <td>2</td>
                        <td>$ 1,100.00</td>
                      </tr>
                      <tr>
                        <td colspan="3"></td>
                        <td class="cyan white-text"><strong>TOTAL NETO </strong></td>
                        <td class="cyan strong white-text"><sup>S/</sup >29<sub></sub></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                
              </div>
            </div>
            
            <div class="invoice-footer">
              <div class="row">
                <div class="col s12 m6 l6">
                  <p class="strong">Nomnre de trbajador</p>
                  <p>Please make the cheque to: AMANDA ORTON</p>
                  <p class="strong">Terms & Condition</p>
                  <ul>
                    <li>You know, being a test pilot isn't always the healthiest business in the world.</li>
                    <li>We predict too much for the next year and yet far too little for the next 10.</li>
                  </ul>
                </div>
                <div class="col s12 m6 l6 center-align">
                  <p>Approved By</p>
                  <img src="images/signature-scan.png" alt="signature">
                  <p class="header">AMANDA ORTON</p>
                  <p>Managing Director</p>
                </div>
              </div>
            </div>
            
          </div>
          
        </div>
        <!--end container-->
                  </div>
                  <div class="modal-footer">
                    <a href="#" class="waves-effect waves-red btn-flat modal-action modal-close">Imprimir</a>
                
                  </div>
            </div>
    </div>
<!-- modal finish -->





	<%@include file="../../../jspf/general.jspf"%>

	<script src="<c:url value='resources/js/Chart.min.js'/>"></script>
</body>
<script src="<c:url value='resources/js/planillaCore.js'/>"></script>

</html>