package pe.edu.upeu.planilla.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;


@Controller
public class CenterController {

	Map<String, Object> mp = new HashMap<>();
	 Map<String, Object> rpta = new HashMap<String, Object>();
	   
	PrintWriter out;
	Gson gson;
	
	@RequestMapping(value = "/cc")
	public void Logueo(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException {
		response.setContentType("application/json");
		HttpSession session = request.getSession(true);
		String url = "/Contratos";
		String opc = request.getParameter("opc");
		try {
			switch (opc) {
				case "cargar":
				
				mp.put("datos", url);
				break;
				case "logout":
					session = request.getSession(false);
			        session.invalidate();
			        response.sendRedirect("/login");
	
			}

		} catch (Exception e) {
			mp.put("rpta", false);
			System.out.println("Error CenterController COMPONENTS : " + e);
		}
		respuesta(response);
	}
	
	
	public void respuesta(HttpServletResponse response) {
		try {
			out = response.getWriter();
	        out.println(gson.toJson(mp));
	        out.flush();
	        out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
            out.flush();
            out.close();
		}
	}
	
	
}
