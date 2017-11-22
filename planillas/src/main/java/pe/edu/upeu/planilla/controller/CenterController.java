package pe.edu.upeu.planilla.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.sun.javafx.scene.control.ControlAcceleratorSupport;

import pe.edu.upeu.planilla.config.AppConfig;
import pe.edu.upeu.planilla.dao.ContratoDAO;

@Controller
public class CenterController {

	private ContratoDAO c = new ContratoDAO(AppConfig.getDataSource());

	Map<String, Object> mp = new HashMap<>();
	Map<String, Object> rpta = new HashMap<String, Object>();
	ArrayList<Map<String, Object>>  list =new ArrayList<Map<String, Object>>();

	

	@RequestMapping(value = "/cc" , method=RequestMethod.POST)
	public void Logueo(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException {
		response.setContentType("application/json");
		HttpSession session = request.getSession(true);
		PrintWriter out = response.getWriter();
		String url = "/Contratos";
		String opc = request.getParameter("opc");
		System.out.println(opc);
		try {
			switch (opc) {
			case "cargar":
			    String nom = request.getParameter("nom");
		        String ape = request.getParameter("ape");
		        String tipodoc = request.getParameter("tipodoc");
		        String numdocdoc = request.getParameter("numdocdoc");
		        String direcc = request.getParameter("direcc");
		        String phone = request.getParameter("phone");
		        String email = request.getParameter("email");
		        String civil = request.getParameter("civil");
		        String sexo = request.getParameter("sexo");
		        String fechanac = request.getParameter("fechanac");
		        String foto = request.getParameter("foto");
		        String codigo = request.getParameter("codigo");
		        //cargo
		        String cargo = request.getParameter("cargo");
		        //contrato
		        String inicio = request.getParameter("inicio");
		        String fin = request.getParameter("fin");
		        String seguro = request.getParameter("seguro");
		        String categoria = request.getParameter("categoria");
		        // carga FAMILIAR
		        String nombref = request.getParameter("nombref");
		        String apellidof = request.getParameter("apellidof");
		        String numdocf = request.getParameter("numdocf");
		        String parentesco = request.getParameter("parentesco");
		        String educationf = request.getParameter("educationf");
		        //cargar cuenta
		        String banco = request.getParameter("banco");
		        String tipoCuenta = request.getParameter("tipoCuenta");
		        String numCuenta = request.getParameter("numCuenta");
		        
		        
		        //Registramos
		        //int a = c.Contartar(nom, ape, tipodoc, numdocdoc, direcc, phone, email, civil, sexo, fechanac, foto, codigo, cargo, inicio, fin, seguro, categoria, nombref, apellidof, numdocf, parentesco, educationf);
		        int a = c.ContartarAct(nom, ape, tipodoc, numdocdoc, direcc, phone, email, civil, sexo, fechanac, foto, codigo, cargo, inicio, fin, seguro, categoria, nombref, apellidof, numdocf, parentesco, educationf, tipoCuenta, numCuenta, banco);
		        
		       //controler
		        
		        if(a!=0) {
		        	rpta.put("rptasd", "1");	
		        }else {
		        	rpta.put("rptasd", "0");
					
		        }
		        
				break;
				
			case  "cargo":
				 mp.put("pr",  c.ListCargo());
				 mp.put("rpta", "1");
				 System.out.println(c.ListCargo());
				break;
			case  "seguro":
				 mp.put("s",  c.ListSeguro());
				 mp.put("rptas", "1");
				 System.out.println(c.ListCargo());
				break;
			case "logout":
				session = request.getSession(false);
				session.invalidate();
				response.sendRedirect("/login");
				break;
			}

		} catch (Exception e) {
			mp.put("rpta", false);
			System.out.println("Error CenterController COMPONENTS : " + e);
		}
		    Gson gson = new Gson();
	        out.println(gson.toJson(mp));
			out.flush();
			out.close();
	}

	
	/*public void respuesta(HttpServletResponse response) {
		try {
			out = response.getWriter();
			out.println(gson.toJson(list));
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			out.flush();
			out.close();
		}
	}*/
	

}
