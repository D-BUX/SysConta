$( document ).ready(function() {
   listarempleado();
   
});
function listarempleado()
{
	 $.post('cc?opc=planillas', function (objJson) {
	        var s='';
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
	        	var tbas =0;
	        	tbas  = tbas + pl[i].Basico;
	        	var tnp = 0 , ttr =0;
	        	tnp = tnp + NP;
	        	
	        	ttr = ttr + tr[i];
	        	
	        	var datall = [ tbas , Math.round(ttr) , Math.round( NP) ];
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
	            s += '<td><a id="'+pl[i].idempleado + pl[i].nombre+'" onclick="preba(this.id);" class="btn-floating waves-effect waves-light "><i class="mdi-editor-attach-money" style="background: #0097a7 !important"></i></a></td>';
	            s += '</tr>';
	   
			}
	        $("#contTable").empty();
	        $("#contTable").append(createTable());
	        $("#data").empty();
	        $("#data").append(s);
	        $('#data-table-row-grouping').dataTable();
	      
	        
	        /// gregar cuadro estadistico
	        	var labela =['Sueldo Básico' , 'Total Remuneraciones' , 'Neto a pagar'];
	    		
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

	    		//ssds
	    	
	    	
	    	// asqui
	        
	    });
	};
function createTable() {
    var s = '<table id="data-table-row-grouping" class="display" cellspacing="0">';
    s += '<thead>';
    s += '<tr>';
    s += '<th>Trabajador</th>';
    s += '<th>Ocupacion</th>';
    s += '<th>D.Laborados</th>';
    s += '<th>H.Laboradas</th>';
    s += '<th>H.Extras</th>';
    s += '<th>Pago h.extra</th>';
    s += '<th>Sueldo Basico</th>';
    s += '<th>Asignacion Familiar </th>';
    s += '<th>T.Remuneraciones</th>';
    s += '<th>Afiliacion</th>';
    s += '<th>Impt.Renta</th>';
    s += '<th>Total Descuentos</th>';
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
function agregar() {
	
	
}




function preba (id){
	alert("El trabajador "+ id +" esta apto para generar boleta  ");
	
}




