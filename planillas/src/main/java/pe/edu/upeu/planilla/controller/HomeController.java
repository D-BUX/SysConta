package pe.edu.upeu.planilla.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/")
public class HomeController {

	

	@GetMapping("/home")
	public String hello() {
		return "index";
	}
	
	@GetMapping("/login")
	public ModelAndView hello(HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {
		/*Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth.isAuthenticated()) {
			System.out.println("EstÃ¡ autenticado");
			return "menu";
		} else {
			System.out.println("No estÃ¡ autenticado");
			return "login";
		}*/
		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Usuario y/o contraseña incorrecta!");
		}

		if (logout != null) {
			model.addObject("msg", "Has cerrado sesión.");
		}
		model.setViewName("login");
		
		return model;
	}

	
}
