package pe.edu.upeu.planilla.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import pe.edu.upeu.planilla.config.AppConfig;
import pe.edu.upeu.planilla.model.PersonaDTO;
import pe.edu.upeu.planilla.model.UsuarioDTO;

@Repository
public class PersonaDAO {

	DataSource d = AppConfig.getDataSource();

    private JdbcTemplate jt;

    public PersonaDAO(DataSource dataSource) {
        jt = new JdbcTemplate(dataSource);
    }
	
	private String sql;
	
	 public UsuarioDTO Validar (String user,  String pass){
	        String sql = "SELECT * FROM planillasdb.usuario u WHERE u.usuario = '" + user + "' AND u.contraseña  = '" + pass + "'";
	        
	        return jt.query(sql, new ResultSetExtractor<UsuarioDTO>() {

	            @Override
	            public UsuarioDTO extractData(ResultSet rs) throws SQLException,
	                    DataAccessException {
	                if (rs.next()) {
	                    UsuarioDTO c = new UsuarioDTO();
	                    c.setIdusuario(rs.getInt("idusuario"));
	                    c.setUsuario(rs.getString("usuario"));
	                    c.setContraseña(rs.getString("contraseña"));
	                    c.setIdrol(rs.getInt("idrol"));
	                    
	                    return c;
	                }
	                return null;
	            }
	        });
	        
	 }
	
	

	public  Map<String, Object> getByUserName(String usuario , String clave) {
        sql = "Select *\r\n" + 
        		"from planillasdb.persona p , planillasdb.usuario u , planillasdb.rol r \r\n" + 
        		"where p.idusuario = u.idusuario and u.idrol = r.idrol and u.usuario = ? and u.contraseña = ?";
        return jt.queryForMap(sql, usuario);
    }
	
	
	
}
