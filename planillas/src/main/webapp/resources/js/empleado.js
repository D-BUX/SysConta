$( document ).ready(function() {
	var arrid=[];
   listarempleado();
   $('.btn-success').click(function(){
   	swal("Planilla programada!", "exitosamente!", "success");
   });
   
   function estadoplanilla() {
	$.ajax({
		type:"POST",
		url: "metod?opc=estplanilla",
		data: {arraid:arraid},
		success: function(arraid)
		{
			console.log("SUCCES:"+arraid);
		}
	})
}
});
function listarempleado()
{
	 $.post('metod?opc=listaremp', function (obj) {
	        var s='';
	        var emp = obj[0];
	        for (var i = 0; i < obj.length; i++) {
				s += '<tr>';
				 s += '<td>'+obj[i].idempleado+'</td>';
	            s += '<td>'+obj[i].nombre+ ' '+obj[i].apellido+'</td>';
	            s += '<td>'+obj[i].categoria+'</td>';
	            s += '<td>'+obj[i].cargo+'</td>';
	            s += '<td>'+obj[i].area+'</td>';
	            s += '<td>'+obj[i].departamento+'</td>';
	            s += '<td>'+obj[i].empresa+'</td>';
	            s += '<td><a class="btn-floating waves-effect waves-light "><i class="mdi-content-clear" style="background: #FF5252 !important;"></i></a>' +' '+'<a class="btn-floating waves-effect waves-light "><i class="mdi-editor-mode-edit" style="background:#00bcd4; "></i></a>'+' '+'<a class="btn-floating waves-effect waves-light "><i class="mdi-editor-attach-money" style="background: #0097a7 !important"></i></a>'+'</td>';
	            s += '<td><input type="checkbox" id="test'+i+'" class="checkBoxClass" value="' +'id:'+ obj[i].idempleado +' '+'nombre:'+ obj[i].nombre+'" /><label for="test'+i+'"></label></td>';
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
                    allVals.push($(this).parents("#data tr").find(".sorting_1").text());
                });
                return allVals;
            }
	        $("#enviar").click(function (){
	        	var envia = [];
	        	
                var arrid=getSelected();
                console.log(arrid.length);
                
                for (var i =1 ;i<arrid.length ; i++){
                    var envia = arrid[i];	
                }
                console.log(arrid)
                var url ='metod?opc=estplanilla';
                    for(var i =0 ; i<arrid.length;i++){
                    	data +='&add='+arrid[i];
                    }
                    console.log(data);
                    $.post(url,data,function(objJson){
                    	//Alert("as");
                    });
            });
	    });
	};
function createTable() {
    var s = '<table id="data-table-row-grouping" class="display" cellspacing="0" width="100%">';
    s += '<thead>';
    s += '<tr>';
    s += '<th>ID</th>';
    s += '<th>Nombres y Apellidos</th>';
    s += '<th>Categoria</th>';
    s += '<th>Cargo</th>';
    s += '<th>Area</th>';
    s += '<th>Departamento</th>';
    s += '<th>Empresa </th>';
    s += '<th>Opciones </th>';
    s += '<th>Seleccionar</th>';
    s += ' </tr>';
    s += '</thead>';
    s += '<tbody id="data"></tbody>';
    s += '</table>';
    return s;
    
};
