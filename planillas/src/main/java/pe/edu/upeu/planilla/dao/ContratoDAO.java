package pe.edu.upeu.planilla.dao;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.mysql.jdbc.Blob;

import pe.edu.upeu.planilla.config.AppConfig;

public class ContratoDAO {

	DataSource d = AppConfig.getDataSource();

	private JdbcTemplate jt;

	public ContratoDAO(DataSource dataSource) {
		jt = new JdbcTemplate(dataSource);
	}

	
	// metodo para registrar persona , empleado , carga familiar  y contrato-
	public int Contartar(String p_nombre , String p_apellido, String tipodoc, String numdoc , String direc , String telef, String Correo
			,String civil , String sexo, String fnac , Blob foto , String Codigo, int idCargo , String fechaIni , String fechafin , int Seguro, String categoria
			, String nombreF , String apellidoF , String dni, String parentesco , String education) {
		int a = 0;
		try {
			String sql ="{call planillasdb.CONTRATACIONES('"+p_nombre.trim()+"', '"+p_apellido.trim()+"', '"+tipodoc+"', '"+numdoc+"', '"+direc+"', '"+telef+"', '"+Correo+"', "
					+ "'"+civil+"', '"+sexo+"', '"+fnac+"', '"+foto+"' , '"+Codigo+"', 'ACTIVO', "+idCargo+" , '"+fechaIni+"', '"+fechafin+"', "+Seguro+","
							+ " '"+categoria+"', '"+nombreF+"', '"+apellidoF+"', '"+dni+"', '"+parentesco+"', '"+education+"')}";
			a = jt.update(sql);
			if(a != 0) {
				a =1;
			}else {
				a=0;
			}
		} catch (Exception e) {
			System.out.println("error");
		}
		return a;
	}
	
	//metodo para listar el combobox de cargo
	public List<Map<String, Object>> ListCargo (){
		return jt.queryForList("SELECT idcargo, cargo FROM planillasdb.cargo");
	}
	
	
	
}
