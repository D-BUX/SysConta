package pe.edu.upeu.planilla.dao;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import pe.edu.upeu.planilla.config.AppConfig;
import java.util.*;
public class EmpleadoDAO {

	DataSource d = AppConfig.getDataSource();

    private JdbcTemplate jt;

    public EmpleadoDAO(DataSource dataSource) {
        jt = new JdbcTemplate(dataSource);
    }
    public List<Map<String, Object>> listarempleados()
    {
       String sql="select upper(p.nombre) nombre,upper(p.apellido) apellido,upper(e.empleadocategoria)categoria,upper(c.cargo) cargo, upper(a.area) area,upper(d.departamentonombre) departamento,upper(em.empresanombre) empresa\r\n" + 
       		"from planillasdb.persona p,planillasdb.empleado e,planillasdb.contrato co,planillasdb.cargo c,planillasdb.area a,planillasdb.departamento d,planillasdb.empresa em,planillasdb.sueldo s\r\n" + 
       		"where p.idpersona=e.idpersona and e.idempleado=co.idempleado and co.idcargo=c.idcargo and s.idsueldo=c.idsueldo and c.idarea=a.idarea and d.iddepartamento=a.iddepartamento and em.idempresa=d.idempresa;"; 
       return jt.queryForList(sql);
       
    }
	
}
