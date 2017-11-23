package pe.edu.upeu.planilla.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.mysql.fabric.xmlrpc.base.Array;
import com.mysql.jdbc.Blob;

import pe.edu.upeu.planilla.config.AppConfig;

public class ContratoDAO {

	DataSource d = AppConfig.getDataSource();

	private JdbcTemplate jt;

	public ContratoDAO(DataSource dataSource) {
		jt = new JdbcTemplate(dataSource);
	}
	
	//metodo para listar el combobox de cargo
	public ArrayList<Map<String, Object>> ListCargo (){
		return (ArrayList<Map<String, Object>>) jt.queryForList("SELECT idcargo, cargo FROM planillasdb.cargo");
	}
	
	//metodo para listar el combobox de seguro
		public ArrayList<Map<String, Object>> ListSeguro (){
			return (ArrayList<Map<String, Object>>) jt.queryForList("SELECT d.idseguro, d.nombreafp FROM planillasdb.seguro d;");
		}
	
		// metodo para registrar persona , empleado , carga familiar  y contrato- cuenta
		public int ContartarAct(String p_nombre , String p_apellido, String tipodoc, String numdoc , String direc , String telef, String Correo
				,String civil , String sexo, String fnac , String foto , String Codigo, String cargo , String fechaIni , String fechafin , String seguro, String categoria
				, String nombreF , String apellidoF , String dni, String parentesco , String education , String tipo_cuenta , String p_numero , String nom_banco) {
			int a = 0;
			try {
				String sql ="{call planillasdb.ContratoActual('"+p_nombre.trim()+"', '"+p_apellido.trim()+"', '"+tipodoc+"', '"+numdoc+"', '"+direc+"', '"+telef+"', '"+Correo+"', "
						+ "'"+civil+"', '"+sexo+"', '"+fnac+"', '"+foto+"' , '"+Codigo+"', 'ACTIVO', "+cargo+" , '"+fechaIni+"', '"+fechafin+"', "+seguro+","
								+ " '"+categoria+"', '"+nombreF+"', '"+apellidoF+"', '"+dni+"', '"+parentesco+"', '"+education+"', '"+ tipo_cuenta +"' , '"+p_numero+"', '"+nom_banco+"')}";
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
		
		//metodo para listarPlanillas
		public ArrayList<Map<String, Object>> LisPlanillas (){
			String sql ="SELECT  em.idempleado, pr.nombre , pr.apellido , cg.cargo as ocupacion ,p.diaslaborados , p.horas_normales , p.horas_extras , p.estado,\r\n" + 
					"        s.sueldo as Basico,  cf.parentesco,sg.idseguro ,sg.nombreafp, sg.porcentaje,ap.idaportes , ap.nombreap , ap.porcentajeap\r\n" + 
					"FROM planillasdb.persona Pr , planillasdb.empleado em, planillasdb.carga_familiar cf,  planillasdb.contrato ct ,  planillasdb.cargo cg ,  planillasdb.sueldo s,\r\n" + 
					"	 planillasdb.pago p, planillasdb.seguro sg ,  planillasdb.aportes ap \r\n" + 
					"where pr.idpersona = em.idpersona  and cf.idempleado = em.idempleado and em.idempleado = ct.idempleado and em.idaportes = ap.idaportes and sg.idseguro = em.idseguro and\r\n" + 
					"	   ct.idcargo = cg.idcargo and cg.idsueldo = s.idsueldo and em.idempleado = p.idempleado \r\n" + 
					"       And p.estado = 1;";
			return (ArrayList<Map<String, Object>>) jt.queryForList(sql);
		}
		
		
}
