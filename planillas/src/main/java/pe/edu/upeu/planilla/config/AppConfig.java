package pe.edu.upeu.planilla.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import pe.edu.upeu.planilla.dao.ContratoDAO;
import pe.edu.upeu.planilla.dao.EmpleadoDAO;
import pe.edu.upeu.planilla.dao.PersonaDAO;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "pe.edu.upeu.planilla.*")
public class AppConfig extends WebMvcConfigurerAdapter {

	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
		registry.addResourceHandler("/jspf/**").addResourceLocations("/jspf/");
		super.addResourceHandlers(registry);
	}

	@Bean
	public static DataSource getDataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");// driver-conexion//
		dataSource.setUrl("jdbc:mysql://192.168.21.20/planillasdb");// url-conexion//
		dataSource.setUsername("remoto");// user-conexion//
		dataSource.setPassword("12345678");// pass-conexion//
		return dataSource;
	}

	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/jsp/");
		viewResolver.setSuffix(".jsp");

		return viewResolver;
	}

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Bean
	public PersonaDAO getPersonaDao() {
		return new PersonaDAO(getDataSource());
	}

	@Bean
	public EmpleadoDAO gEmpleadoDAO() {
		return new EmpleadoDAO(getDataSource());
	}

	@Bean
	public ContratoDAO getContratoDAO() {
		return new ContratoDAO(getDataSource());
	}

}
