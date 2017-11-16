package pe.edu.upeu.planilla.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import pe.edu.upeu.planilla.config.AppConfig;
import pe.edu.upeu.planilla.dao.PersonaDAO;
import pe.edu.upeu.planilla.model.PersonaDTO;
import pe.edu.upeu.planilla.model.UsuarioDTO;



@Controller
@RequestMapping("/")
public class HomeController {

	
	Map<String, Object> mp = new HashMap<>();

	private PersonaDAO pao = new PersonaDAO(AppConfig.getDataSource());
	
	private PersonaDTO p = new PersonaDTO();
	private UsuarioDTO u = new UsuarioDTO();

	@GetMapping("/")
	public String hello() {
		return "login";
	}
	
	@RequestMapping(value = "/C")
    public String inicio() {
        return "vistas/inicio";
    }

	@RequestMapping(value = "/cont")
    public String conta() {
        return "vistas/Contratos";
    }
	
	@RequestMapping(value = "/tra")
    public String trabajo() {
        return "vistas/Trabajos";
    }
	
	@RequestMapping(value = "/planilla")
    public String planilla() {
        return "vistas/Planillas";
    }
	
	@RequestMapping(value = "/boletas")
    public String boletas() {
        return "vistas/Boletas";
    }
	
	
	
    
    @RequestMapping("/x")
    public String Principal (Model mo, HttpServletRequest resquest , HttpServletResponse response ) throws IOException{
    	response.setContentType("application/json");
    	PrintWriter out = response.getWriter();
        String url ="";
        String user = resquest.getParameter("user");
        String Pass = resquest.getParameter("pass");
        HttpSession sesion = resquest.getSession();
       
        try {
        	ModelAndView model = new ModelAndView();
        u = pao.Validar(user, Pass);
           if(u != null)  {  
             resquest.getSession().setAttribute("u", u);
                url = "Home";
            }else{
            	model.addObject("error", "Usuario y/o contraseña incorrecta!");
                url="login";
            }
        } catch (Exception e) {
        	 System.out.println("Error : " + e);
        }
      
        return url;
    }
	
	

	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(false);
        session.invalidate();
        request.getSession().setAttribute("u", null);
		return "login";
        //response.sendRedirect("/planillas/");
	}
	
	@GetMapping("/home")
	public String home() {
		String pagina = "index";
		return pagina;
	}

}
