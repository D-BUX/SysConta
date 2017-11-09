package pe.edu.upeu.planilla.dao;


import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PersonaDAO {

	@Autowired
	JdbcTemplate jt;
	
	private String sql;
	
	public ArrayList<Map<String, Object>> listar() {
		sql = "SELECT * FROM Persona";
        return (ArrayList<Map<String, Object>>) jt.queryForList(sql);
	}
	
	
	public ArrayList<Map<String, Object>> validar(String usuario, String pass) {
        sql = "Select *  \r\n" + 
        		"from planillasdb.persona p , planillasdb.usuario u , planillasdb.rol r \r\n" + 
        		"where p.idusuario = u.idusuario and u.idrol = r.idrol and u.usuario = ? and u.contraseña = ?";
        return (ArrayList<Map<String, Object>>) jt.queryForList(sql, usuario, pass);
    }
	public Map<String, Object> getByUserName(String usuario) {
        sql = "Select *\r\n" + 
        		"from planillasdb.persona p , planillasdb.usuario u , planillasdb.rol r \r\n" + 
        		"where p.idusuario = u.idusuario and u.idrol = r.idrol and u.usuario = ?";
        return jt.queryForMap(sql, usuario);
    }
	
}
