
function agregar (){
	
	//get values of man
	var nombre = $("#nombre").val();
	var apellido = $("#apellido").val();
	var tipodoc = $("#tipodoc").val();
	var numdocdoc = $("#numdoc").val();
	var direcc = $("#direcc").val();
	var phone = $("#phone-demo").val();
	var email =$("#correo").val();
	var civil = $("#civil").val();
	var sexo = $("#sexo").val();
	var fechanac = $("#fecha_nac").val();
	var foto = $("#foto").val();
	
	//values of family
	var nombref = $("#nombref").val();
	var apellidof = $("#apellidof").val();
	var numdocf = $("#numdocf").val();
	var parentesco = $("#parentesco").val();
	var educationf = $("#education").val();
	
	//get values for contrato and empleado form database
	var codigo = $("#codigo").val();
	var cargo = $("#cargo").val();
	var inicio = $("#txtDate1").val();
	var fin = $("#txtDate2").val();
	var seguro = $("#seguro").val();
	var categoria = $("#categoria").val();
	//alert ( "cargo" + cargo + "seguro " + seguro);
	
	/// Enviamos los datos al Controlador
	var url ="cc?opc=cargar";
	var data ="&nom=" + nombre ;
	data += "&ape=" + apellido;
	data += "&tipodoc=" + tipodoc;
	data += "&numdocdoc=" + numdocdoc;
	data += "&direcc=" + direcc;
	data += "&phone=" + phone;
	data += "&email=" + email;
	data += "&civil=" + civil;
	data += "&sexo=" + sexo;
	data += "&fechanac=" + fechanac;
	data += "&foto=" + foto;
	data += "&codigo=" + codigo;
	//cargo 
	data += "&cargo=" + cargo;
	//contrato
	data += "&inicio=" + inicio;
	data += "&fin=" + fin;
	data += "&seguro=" + seguro;
	data += "&categoria=" + categoria;
	//carga familiar
	data += "&nombref=" + nombref;
	data += "&apellidof=" + apellidof;
	data += "&numdocf=" + numdocf;
	data += "&parentesco=" + parentesco;
	data += "&educationf=" + educationf;
	
	if(nombre != "" || apellido!="" ){
		$.post(url,data,function(objJson){
			var rspta = objJson.rptasd;
			if(rspta == 1){
				//swal("Good job!", "You clicked the button!", "success");
				$('#salir').attr('href', 'tra');
			}else{
				alert ("nou");
			}
		});
	}else{
		//$('#salir').attr('href', 'tra'); 
		swal("Cancelled", "Your imaginary file is safe :)", "error");
		 //window.location.replace("http://localhost:9090/planillas/x");
	}
	
		
}