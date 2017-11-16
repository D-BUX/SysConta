$( document ).ready(function() {
   listarempleado();
});
function listarempleado()
{
	 $.post('metod?opc=listaremp', function (obj) {
	        var s='';
	        var emp = obj[0];
	        console.log(emp.nombre+emp.cargo+emp.area);
	        for (var i = 0; i < obj.length; i++) {
				s += '<tr>';
	            s += '<td>'+obj[i].nombre+ ' '+obj[i].apellido+'</td>';
	            s += '<td>'+obj[i].categoria+'</td>';
	            s += '<td>'+obj[i].cargo+'</td>';
	            s += '<td>'+obj[i].area+'</td>';
	            s += '<td>'+obj[i].departamento+'</td>';
	            s += '<td>'+obj[i].empresa+'</td>';
	            s += '</tr>';
			}
	        $("#contTable").empty();
	        $("#contTable").append(createTable());
	        $("#data").empty();
	        $("#data").append(s);
	        $('#data-table-row-grouping').dataTable();
	        
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
    s += ' </tr>';
    s += '</thead>';
    s += '<tbody id="data"></tbody>';
    s += '</table>';
    return s;
};