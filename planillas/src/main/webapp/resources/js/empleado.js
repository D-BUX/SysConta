$( document ).ready(function() {
   listarempleado();
   
});
function listarempleado()
{
	 $.post('metod?opc=listaremp', function (obj) {
	        var s='';
	        var emp = obj[0];
	        for (var i = 0; i < obj.length; i++) {
				s += '<tr>';
	            s += '<td>'+obj[i].nombre+ ' '+obj[i].apellido+'</td>';
	            s += '<td>'+obj[i].categoria+'</td>';
	            s += '<td>'+obj[i].cargo+'</td>';
	            s += '<td>'+obj[i].area+'</td>';
	            s += '<td>'+obj[i].departamento+'</td>';
	            s += '<td>'+obj[i].empresa+'</td>';
	            s += '<td><a class="btn-floating waves-effect waves-light "><i class="mdi-content-clear" style="background: #FF5252 !important;"></i></a>' +' '+'<a class="btn-floating waves-effect waves-light "><i class="mdi-editor-mode-edit" style="background:#00bcd4; "></i></a>'+' '+'<a class="btn-floating waves-effect waves-light "><i class="mdi-editor-attach-money" style="background: #0097a7 !important"></i></a>'+'</td>';
	            s += '<td><input type="checkbox" id="test'+i+'" class="checkBoxClass" value="' + obj[i].nombre +'" /><label for="test'+i+'">Yellow</label></td>';
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