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
       String sql="select * from persona p, empleado e,contrato co,cargo c, area a, departamento d, empresa em,sueldo s\r\n" + 
       		"where p.idpersona=e.idpersona and e.idempleado=c.idempleado and co.idcargo=c.idcargo and s.idsueldo=c.idsuedlo and c.idarea=a.idarea and d.iddepartamento=a.iddepartamento and em.idempresa=d.idempresa;"; 
       return jt.queryForList(sql);
       
    }
	
}
