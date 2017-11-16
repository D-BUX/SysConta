$( document ).ready(function() {
    $.post('metod', function (obj) {
        
        var emp = obj[0];
        console.log(emp);     /*
        $("#nombres").text(trab.NOM + " " + trab.AP_P + " " + trab.AP_M);
        $("#correo").text(trab.CORREO);
        $("#fecha").text(trab.F);
        $("#sexo").text(trab.SEXO);
        $("#num_doc").text(trab.N_D);
        var o = trab.T;
        if (o === '1') {
            $("#tip_doc").text('DNI');
        } else {
            $("#tip_doc").text('Otros');
        }
*/

    });
});