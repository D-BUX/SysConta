package pe.edu.upeu.planilla.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import pe.edu.upeu.planilla.config.AppConfig;
import pe.edu.upeu.planilla.dao.PersonaDAO;
import pe.edu.upeu.planilla.model.PersonaDTO;



@Controller
@RequestMapping("/")
public class HomeController {


	private PersonaDAO pao = new PersonaDAO(AppConfig.getDataSource());
	
	private PersonaDTO p = new PersonaDTO();

	@GetMapping("/")
	public String hello() {
		return "login";
	}
	

    
    @RequestMapping("/x")
    public String Principal (Model mo, HttpServletRequest resquest , HttpServletResponse response){
        String url ="index";
        String user = resquest.getParameter("user");
        String Pass = resquest.getParameter("pass");
        HttpSession sesion = resquest.getSession();
        ArrayList<Map<String, Object>> c= pao.validar(user, Pass);
        try {
           p = (PersonaDTO) pao.getByUserName(user, Pass);
           
           if(p == null ) {
        	   
           resquest.getSession().setAttribute("Cliente", c);
                url = "index";
            }else{
                url="login";
            }
        } catch (Exception e) {
        }
        return url;
    }
	
	
	/*
	@GetMapping("/login")
	public ModelAndView hello(HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		/*Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.isAuthenticated()) {
			System.out.println("Está autenticado");
			return "menu";
		} else {
			System.out.println("No está autenticado");
			return "login";
		}
		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Usuario y/o contrase�a incorrecta!");
		}

		if (logout != null) {
			model.addObject("msg", "Has cerrado sesi�n.");
		}
		model.setViewName("login");
		
		return model;
	}

	@GetMapping(value = { "menu", "/"  })
	public String menu(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
		String Rol = ((PersonaDTO) authentication.getPrincipal()).getTipo_doc();
		String pagina="";
		HttpSession session = request.getSession(true);
		System.out.println(Rol);
		if(Rol.equals("1")) {
			System.out.println("redireccionar a home");
			session.setAttribute("ModE", "1");
			pagina = "home";
		}
		else {
			pagina = "menu";
		}
		return pagina;
	}
	
	
	@GetMapping("/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
			System.out.println("Logged Out Successfully!");
		}
		try {
			response.sendRedirect("login?logout");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("home")
	public String home() {
		String pagina = "home";
		return pagina;
	}
	*/
}
