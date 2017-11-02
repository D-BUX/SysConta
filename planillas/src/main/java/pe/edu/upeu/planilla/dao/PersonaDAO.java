package pe.edu.upeu.planilla.dao;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import pe.edu.upeu.planilla.config.AppConfig;

@Repository
public class PersonaDAO {

	DataSource d = AppConfig.getDataSource();

    private JdbcTemplate jt;

    public PersonaDAO(DataSource dataSource) {
        jt = new JdbcTemplate(dataSource);
    }
	
}
