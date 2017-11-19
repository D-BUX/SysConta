package pe.edu.upeu.planilla.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.google.gson.Gson;
import com.sun.javafx.scene.control.ControlAcceleratorSupport;

import pe.edu.upeu.planilla.config.AppConfig;
import pe.edu.upeu.planilla.dao.ContratoDAO;

@Controller
public class CenterController {

	private ContratoDAO c = new ContratoDAO(AppConfig.getDataSource());

	Map<String, Object> mp = new HashMap<>();
	Map<String, Object> rpta = new HashMap<String, Object>();
	List<Map<String, Object>> list;

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

				String ID_PASO = request.getParameter("id");
		        String ID_PROCESO = request.getParameter("proceso");
		        String DE_PASOS = request.getParameter("desc");
		        String NU_PASOS = request.getParameter("num");
		        String CO_PASOS = request.getParameter("cod");
		        String ESTADO = request.getParameter("estado");
		       //controler
		        rpta.put("rpta", "1");
				respuesta(response);
				break;
				
			case  "cargo":
				list = c.ListCargo();
				rpta.put("rpta", "1");
				respuesta(response);
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
		respuesta(response);
	}

	
	public void respuesta(HttpServletResponse response) {
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
	}
	

}
