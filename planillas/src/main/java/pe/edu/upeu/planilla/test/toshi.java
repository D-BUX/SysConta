package pe.edu.upeu.planilla.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import pe.edu.upeu.planilla.config.AppConfig;
import pe.edu.upeu.planilla.dao.ContratoDAO;
import pe.edu.upeu.planilla.dao.PersonaDAO;


public class toshi {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		conect();
		validar();
		list();
	}
	
	
	public static void conect() {
		DataSource d = AppConfig.getDataSource();

		if (d != null) {
			System.out.println("Conectado");
		} else {
			System.out.println("No se pudo conectar");
		}
	}
	
	public static void validar () {
		DataSource d = AppConfig.getDataSource();

		PersonaDAO a = new PersonaDAO(d);
		
		
		
	}
	public static void list () {
		DataSource d = AppConfig.getDataSource();

		ContratoDAO a = new ContratoDAO(d);
		
		 List<Map<String, Object>> as = a.ListCargo();
		System.out.println(as);
	}
	
	
}
