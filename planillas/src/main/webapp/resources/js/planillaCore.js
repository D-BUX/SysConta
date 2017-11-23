$( document ).ready(function() {
   listarempleado();
   
});
function listarempleado()
{
	 $.post('cc?opc=planillas', function (objJson) {
	        var s='';
	        var pl = objJson.pl;
	        var Remuneracion =[];
	        var ImpRenta =[];
	        console.log(pl);
	        for (var i = 0; i < pl.length; i++) {
	        	// aqui iran los calculos
	        	//falta calcualr si tiene horas extras
	        	if(pl[i].parentesco == "hijo"){
	        		Remuneracion [i] = pl[i].Basico + 85  ;
	        	}else {
	        		
	        	}
	        	
	        	// aqui va impuesto a la renta
	        	
	        	
	        	// cargamos tabla
				s += '<tr>';
	            s += '<td>'+pl[i].nombre+ ' '+pl[i].apellido+'</td>';
	            s += '<td>'+pl[i].ocupacion+'</td>';
	            s += '<td>'+pl[i].diaslaborados+'</td>';
	            s += '<td>'+pl[i].horas_normales+'</td>';
	            s += '<td>'+pl[i].horas_extras+'</td>';
	            s += '<td>'+pl[i].Basico+'</td>';
	            s += '<td>'+pl[i].parentesco+'</td>';
	            s += '<td>'+ Remuneracion[i] +'</td>';
	            s += '<td>'+ pl[i].nombreafp +'</td>';
	            s += '<td>'+ Math.round(Remuneracion[i] * pl[i].porcentaje)+'</td>';
	            s += '<td>'+"f. im renta"+'</td>';
	            s += '<td>'+ ( Math.round(Remuneracion[i] * pl[i].porcentaje)+ 100) +'</td>';
	            s += '<td>'+ " c. Neto"+'</td>';
	            s += '<td>'+pl[i].nombreap+'</td>';
	            s += '<td>'+" total aporte"+'</td>';
	            s += '<td><a id="'+pl[i].idempleado + pl[i].nombre+'" onclick="preba(this.id);" class="btn-floating waves-effect waves-light "><i class="mdi-editor-attach-money" style="background: #0097a7 !important"></i></a></td>';
	            s += '</tr>';
	   
			}
	        $("#contTable").empty();
	        $("#contTable").append(createTable());
	        $("#data").empty();
	        $("#data").append(s);
	        $('#data-table-row-grouping').dataTable();
	        $("#ckbCheckAll").click(function () {
                $(".checkBoxClass").prop('checked', $(this).prop('checked'));
            });
	        function getSelected() {
                var allVals = [];
                $('#data :checked').each(function () {
                    allVals.push($(this).val());
                });
                return allVals;
            }
	        $("#enviar").click(function (){
                var arrid=getSelected();                                     
                console.log(arrid);                                
            });
	    });
	};
function createTable() {
    var s = '<table id="data-table-row-grouping" class="display" cellspacing="0" width="100%">';
    s += '<thead>';
    s += '<tr>';
    s += '<th>Trabajador</th>';
    s += '<th>Ocupacion</th>';
    s += '<th>D. Laborados</th>';
    s += '<th>H.Laboradas</th>';
    s += '<th>H.Extras</th>';
    s += '<th>Sueldo Basico </th>';
    s += '<th>Asignacion Familiar </th>';
    s += '<th>Total Remuneraciones</th>';
    s += '<th>Afiliacion</th>';
    s += '<th>Pago %</th>';
    s += '<th>Impt.Renta</th>';
    s += '<th>Total Descuentos</th>';
    s += '<th><strong>Neto pagar</strong></th>';
    s += '<th>Essalud 9%</th>';
    s += '<th>Total Aporte</th>';
    s += '<th>Boleta</th>';
    s += ' </tr>';
    s += '</thead>';
    s += '<tbody id="data"></tbody>';
    s += '</table>';
    return s;
};


function preba (id){
	alert("El trabajador "+ id +" esta apto para generar boleta  ");
	
}


