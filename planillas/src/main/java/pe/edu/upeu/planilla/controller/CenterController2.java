package pe.edu.upeu.planilla.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import pe.edu.upeu.planilla.dao.EmpleadoDAO;

@Controller
public class CenterController2 {
	
	private EmpleadoDAO eO;
    Map<String, Object> mp = new HashMap<>();

	@RequestMapping("/empleado")
	public ModelAndView paginas(ModelAndView modelo,HttpServletRequest request,HttpServletResponse response)
	{
		String opc=request.getParameter("opc");
		switch (opc) {
		case "1":
			break;

		case"2":
			break;
		}
		return modelo;
	}
	
	@RequestMapping(value="/metod",method=RequestMethod.POST)
	public void metod(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        String opc = request.getParameter("opc");
        try {
        	switch (opc) {
			case "listarem":
				mp.put("listaemp", eO.listarempleados());
				
				break;

			default:
				break;
			}
			
		} catch (Exception e) {

			System.out.println("Error:"+e);
		}
        Gson gson = new Gson();
        out.println(gson.toJson(mp));
		out.flush();
		out.close();
	}
}
