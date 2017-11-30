$( document ).ready(function() {
   listarempleado();
  

});
function listarempleado()
{
	 $.post('cc?opc=planillas', function (objJson) {
	        var s='';
	        var tbas =0;
	        var tnp = 0;
	        var ttr =0;
	        var pl = objJson.pl;
	        var ruit = objJson.u;
	        var Remuneracion =[];
	        var ImpRenta =[];
	        var thorasEx = [];
	        var f =0 ;
	        var SBAS = [];
	        var ht =0 ;
	        var total = 0;
	        console.log(pl);
	        console.log(uit);
	        
	        for (var i = 0; i < ruit.length; i++) {
	        	var uit =[];
	        	uit = ruit[i].ui;
	        }
	        
	        
	        for (var i = 0; i < pl.length; i++) {
	        	// aqui iran los calculos
	        	//falta calcualr si tiene horas extras
	        	if(pl[i].parentesco == "hijo"){
	        		f = 85  ;
	        	}else {
	        		f=  0 ;
	        	}
	        	
	        	//falta calcualr si tiene horas extras
	        	thorasEx [i]= pl[i].horas_extras	  
	        	if(thorasEx[i] >0){
	        		
	        		if(thorasEx [i] > 2){
	        			var recuento = thorasEx [i] -  2 ;
	        			var p = (pl[i].Basico/30/8)*2*1.25; //priemras 1 a2 horas
	        			var t =(pl[i].Basico/30/8) * recuento * 1.35 ;
	        			ht = p + t;
	        		
	        		}else{
	        			ht = (pl[i].Basico/30 / 8 )*2 *thorasEx[i]* 1.25;
	        		}
	        		
	        	}
	        	
	        	Remuneracion [i] = pl[i].Basico + f ;
	        	var tr = pl[i].Basico + f + ht;
	        	// aqui va impuesto a la renta
	        	var descuento = (Remuneracion[i] * pl[i].porcentaje)+ 100;
	        	
	        	
	        	//imúesto a la renta
	        	
	        	console.log("uit" +  uit);
	        	var ipt = tr * 14;
	        	//console.log(ipt);
	        	var imr = [];
	        	var  se = 7 * uit;
	        	var bimp = ipt -se ; // bienestar imponible
	        	var pc = 5*uit; //primera condicion de uit
	        	
	        	console.log("pc" + pc);
	        	if (bimp > pc ){
	        		var sc = 20 * uit
	        		if(bimp > sc){
	        			var a = sc - pc;
	        		}else{ //no es maypr a 20 
	        			imr[i] = ((pc * 0.08) + ((bimp - pc) * 0.14)) / 12;
	        		}
	        	}else{ // no es mayo qu 5uit 
	        		if (bimp<0){
	        			imr =0;
	        		}else{
	        			imr = (bimp * 0.08)/12;
	        		}
	        	
	        		console.log(imr);
	        	}
	        	
	        	var rdes = descuento + imr;
	        	var NP = tr - rdes;
	        	var apor = tr * pl[i].porcentajeap;
	        	var napor = '';
	        	if(pl[i].nombreap == 'essalud'){
	        		napor = 'si';
	        	}else{
	        		napor = 'no';
	        	}
	        	
	        	tbas  = tbas + pl[i].Basico;
	        	tnp = tnp + NP;
	        	ttr = ttr + tr;
	        	
	        	console.log("tabas" + tbas);
	        	console.log("ttr" + ttr);
	        	console.log("tnp" + tnp);
	        	
	        	// cargamos tabla
				s += '<tr>';
	            s += '<td>'+pl[i].nombre+ ' '+pl[i].apellido+'</td>';
	            s += '<td>'+pl[i].ocupacion+'</td>';
	            s += '<td>'+pl[i].diaslaborados+'</td>';
	            s += '<td>'+pl[i].horas_normales+'</td>';
	            s += '<td>'+pl[i].horas_extras+'</td>';
	            s += '<td>'+Math.round(ht)+'</td>';
	            s += '<td>'+pl[i].Basico+'</td>';
	            s += '<td>'+pl[i].parentesco+'</td>';
	            s += '<td>'+Math.round(tr) +'</td>';
	            s += '<td>'+ pl[i].nombreafp +'</td>';
	            s += '<td>'+  Math.round(imr) +'</td>';
	            s += '<td>'+ ( Math.round(rdes)) +'</td>';
	            s += '<td>'+ Math.round(NP)+'</td>';
	            s += '<td>'+napor+'</td>';
	            s += '<td>'+ Math.round(apor)+'</td>';
	            s += '<td><a id ="'+pl[i].idempleado + pl[i].nombre+'" onclick="modal(this.id);" class="waves-effect waves-light btn modal-trigger  light-blue" href="#modal1">+</a></td>';
	            s += '</tr>';
	   
			}
	        $("#contTable").empty();
	        $("#contTable").append(createTable());
	        $("#data").empty();
	        $("#data").append(s);
	        $('#data-table-row-grouping').dataTable();
	      
	        
	        /// gregar cuadro estadistico
	        	var labela =['Sueldo Básico' , 'Total Remuneraciones' , 'Neto a pagar'];
	        	rttr =  Math.round(ttr) ;
	        	rtnp = Math.round( tnp); 
	        	var datall = [ tbas , rttr , rtnp ];
	        	
	    		var ctx = document.getElementById("myChart").getContext('2d');
	    		
	    		console.log(labela);
	    		console.log(datall);
	    		
	    		var myChart = new Chart(ctx, {
	    			type : 'bar',
	    			data : {
	    				labels :labela,
	    				datasets : [ {
	    					label : '# Planilla para el presente mes',
	    					data : datall,
	    					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
	    							'rgba(54, 162, 235, 0.2)',
	    							'rgba(255, 206, 86, 0.2)',
	    							'rgba(75, 192, 192, 0.2)',
	    							'rgba(153, 102, 255, 0.2)',
	    							'rgba(255, 159, 64, 0.2)' ],
	    					borderColor : [ 'rgba(255,99,132,1)',
	    							'rgba(54, 162, 235, 1)',
	    							'rgba(255, 206, 86, 1)',
	    							'rgba(75, 192, 192, 1)',
	    							'rgba(153, 102, 255, 1)',
	    							'rgba(255, 159, 64, 1)' ],
	    					borderWidth : 1
	    				} ]
	    			},
	    			options : {
	    				scales : {
	    					yAxes : [ {
	    						ticks : {
	    							beginAtZero : true
	    						}
	    					} ]
	    				}
	    			}
	    		});
	    		
	    		p = precio(rttr);
	    		v = cuerpocarga(tbas , rtnp);
	    		
	    		$("#precio").empty();
				$("#precio").append(p);
	    		
				$("#cuerpoCarga").empty();
				$("#cuerpoCarga").append(v);
	    		
				m=modal (id);
				$("#modal1").empty();
				$("#modal1").append(v);
	    		
	    });
	};
	
function createTable() {
    var s = '<table id="data-table-row-grouping" class="display" cellspacing="0">';
    s += '<thead>';
    s += '<tr>';
    s += '<th>Trabajador</th>';
    s += '<th>Ocupacion</th>';
    s += '<th>Dias Labor</th>';
    s += '<th>H.Laboradas</th>';
    s += '<th>H.extras</th>';
    s += '<th>Pago h.extra</th>';
    s += '<th>Sueldo Basico</th>';
    s += '<th>Asignacion Familiar </th>';
    s += '<th>T.Remuneracion</th>';
    s += '<th>Afiliacion</th>';
    s += '<th>Impt.Renta</th>';
    s += '<th>T.Descuentos</th>';
    s += '<th><strong>Neto pagar</strong></th>';
    s += '<th>Essalud</th>';
    s += '<th>T.Aporte</th>';
    s += '<th>Boleta</th>';
    s += ' </tr>';
    s += '</thead>';
    s += '<tbody id="data"></tbody>';
    s += '</table>';
    return s;
};

// funcion para generar reporte grafico
function precio(rttr) {
	var p = '<sup>S/</sup >'+rttr+'<sub></sub>';
	return p;
}

function cuerpocarga(tbas , rtnp){
	var v = '<ul class="collection">';
	v +='<li class="collection-item">Sueldo Basico</li>';
	v +='<li class="collection-item"><sup>S/</sup ><strong>'+ tbas +'</strong><sub></sub></li>';
	v +='<li class="collection-item">Neto a Pagar</li>';
	v +='<li class="collection-item"><sup>S/</sup ><strong>'+ rtnp +'</strong><sub></sub></li>';
	v +='</ul>';
	 
	return v;
}

function preba (id){
	
	 //$('#modal1').show();
	  //$('#modal1').modal('close');
	 alert("El trabajador "+ id +" esta apto para generar boleta  ");
}


//cargamos modal
function modal (id){
	  $('#ocul').show();
	var m = "<!--start container-->\
        <div class='container'>\
          <div id='invoice'>\
            <div class='invoice-header'>\
              <div class='row section'>\
                <div class='col s12 m6 l6'>\
                  <img src='images/generic-logo.png' alt='company logo'>\
                  <p>To,\
                    <br/>\
                    <span class='strong'>Jonathan Doe</span>\
                    <br/>\
                    <span>125, ABC Street,</span>\
                    <br/>\
                    <span>New Yourk, USA</span>\
                    <br/>\
                    <span>+91-(444)-(333)-(221)</span>\
                  </p>\
                </div>\
                <div class='col s12 m6 l6'>\
                  <div class='invoce-company-address right-align'>\
                    <span class='invoice-icon'><i class='mdi-social-location-city cyan-text'></i></span>\
                    <p><span class='strong'>Company Name LLC</span>\
                      <br/>\
                      <span>125, ABC Street,</span>\
                      <br/>\
                      <span>New Yourk, USA</span>\
                      <br/>\
                      <span>+91-(444)-(333)-(221)</span>\
                    </p>\
                  </div>\
                  <div class='invoce-company-contact right-align'>\
                    <span class='invoice-icon'><i class='mdi-communication-quick-contacts-mail cyan-text'></i></span>\
                    <p><span class='strong'>www.exampledomain.com</span>\
                      <br/>\
                      <span>info@exampledomain.com</span>\
                      <br/>\
                      <span>admin@exampledomain.com</span>\
                    </p>\
                  </div>\
                </div>\
              </div>\
            </div>\
            <div class='invoice-lable'>\
              <div class='row'>\
                <div class='col s12 m3 l3 cyan'>\
                  <h4 class='white-text invoice-text'>CARGA</h4>\
                </div>\
                <div class='col s12 m9 l9 invoice-brief cyan white-text'>\
                  <div class='row'>\
                    <div class='col s12 m3 l3'>\
                      <p class='strong'><strong>TOTAL INGRESOS</strong></p>\
                      <h4 class='header'><sup>S/</sup >29<sub></sub></h4>\
                    </div>\
                    <div class='col s12 m3 l3'>\
                      <p class='strong'><strong>TOTAL DESCUENTOS</strong></p>\
                      <h4 class='header'><sup>S/</sup >29<sub></sub></h4>\
                    </div>\
                    <div class='col s12 m3 l3'>\
                      <p class='strong'><strong>TOTAL APORTES </strong></p>\
                      <h4 class='header'><sup>S/</sup >29<sub></sub></h4>\
                    </div>\
                  </div>\
                </div>\
              </div>\
            </div>\
            <div class='invoice-table'>\
              <div class='row'>\
                <div class='col s12 m12 l12'>\
                  <table class='striped'>\
                    <thead>\
                      <tr>\
                        <th data-field='no'>No</th>\
                        <th data-field='item'>Ingresos</th>\
                        <th data-field='uprice'>Descuentos</th>\
                        <th data-field='price'>Aporte de Empleador</th>\
                        <th data-field='price'>Total</th>\
                      </tr>\
                    </thead>\
                    <tbody>\
                      <tr>\
                        <td>1.</td>\
                        <td>MacBook Pro</td>\
                        <td>$ 1,299.00</td>\
                        <td>2</td>\
                        <td>$ 1,100.00</td>\
                      </tr>\
                      <tr>\
                        <td colspan='3'></td>\
                        <td class='cyan white-text'><strong>TOTAL NETO </strong></td>\
                        <td class='cyan strong white-text'><sup>S/</sup >29<sub></sub></td>\
                      </tr>\
                    </tbody>\
                  </table>\
                </div>\
              </div>\
            </div>\
            <div class='invoice-footer'>\
              <div class='row'>\
                <div class='col s12 m6 l6'>\
                  <p class='strong'>Nomnre de trbajador</p>\
                  <p>Please make the cheque to: AMANDA ORTON</p>\
                  <p class='strong'>Terms & Condition</p>\
                  <ul>\
                    <li>You know, being a test pilot isn't always the healthiest business in the world.</li>\
                    <li>We predict too much for the next year and yet far too little for the next 10.</li>\
                  </ul>\
                </div>\
                <div class='col s12 m6 l6 center-align'>\
                  <p>Approved By</p>\
                  <img src='images/signature-scan.png' alt='signature'>\
                  <p class='header'>AMANDA ORTON</p>\
                  <p>Managing Director</p>\
                </div>\
              </div>\
            </div>\
          </div>\
        </div>\
        <!--end container-->\
        </div>\
        <div class='modal-footer'>\
          <a href='#' class='waves-effect waves-red btn-flat modal-action modal-close'>Imprimir</a>\
        </div>\
        </div>"
		return m;

}
