package pe.edu.upeu.planilla.model;


import java.util.ArrayList;
import java.util.Map;


public class PersonaDTO {

	private int idpersona;
	private String nombre;
	private String apellido;
	private String tipo_doc;
	private String numero_doc;
	private String direccion;
	private String telefono;
	private String correo;
	private String estadocivil;
	private String sexo;
	private String fecha_nac;
	
	private int idusuario;
	private String usuario;
	private String contraseņa;
	
	private int idrol;
	private String nombrol;
	
	
	
	
	private ArrayList<Map<String, Object>> VALIDAR;
	
	public PersonaDTO() {
		super();
	}

	public PersonaDTO(Map<String,Object> userT) {
		this.nombre = ((String) userT.get("nombre")).trim();
		this.apellido = ((String) userT.get("apellido")).trim();
		this.tipo_doc = ((String) userT.get("tipo_doc")).trim();
		this.numero_doc = ((String) userT.get("numero_doc")).trim();
		this.direccion = ((String) userT.get("direccion")).trim();
		this.telefono = ((String) userT.get("telefono")).trim();
		this.correo = ((String) userT.get("correo")).trim();
		this.estadocivil = ((String) userT.get("estadocivil")).trim();
		this.sexo = ((String) userT.get("sexo")).trim();
		this.fecha_nac = ((String) userT.get("fecha_nac")).trim();
		this.usuario = ((String) userT.get("usuario")).trim();
		this.contraseņa = ((String) userT.get("contraseņa")).trim();
		this.idrol = (int) userT.get("idRol");
		this.nombrol = ((String) userT.get("nomrol")).trim();
		
	}
	
	
	public PersonaDTO(String nombre, String apellido, String tipo_doc, String numero_doc, String direccion,
			String telefono, String correo, String estadocivil, String sexo, String fecha_nac, int idusuario) {
		super();
		this.nombre = nombre;
		this.apellido = apellido;
		this.tipo_doc = tipo_doc;
		this.numero_doc = numero_doc;
		this.direccion = direccion;
		this.telefono = telefono;
		this.correo = correo;
		this.estadocivil = estadocivil;
		this.sexo = sexo;
		this.fecha_nac = fecha_nac;
		this.idusuario = idusuario;
	}

	public ArrayList<Map<String, Object>> getValidar( ArrayList<Map<String, Object>> VALIDAR) {
		return this.VALIDAR;
	}


	public int getIdpersona() {
		return idpersona;
	}


	public void setIdpersona(int idpersona) {
		this.idpersona = idpersona;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getApellido() {
		return apellido;
	}


	public void setApellido(String apellido) {
		this.apellido = apellido;
	}


	public String getTipo_doc() {
		return tipo_doc;
	}


	public void setTipo_doc(String tipo_doc) {
		this.tipo_doc = tipo_doc;
	}


	public String getNumero_doc() {
		return numero_doc;
	}


	public void setNumero_doc(String numero_doc) {
		this.numero_doc = numero_doc;
	}


	public String getDireccion() {
		return direccion;
	}


	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}


	public String getTelefono() {
		return telefono;
	}


	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}


	public String getCorreo() {
		return correo;
	}


	public void setCorreo(String correo) {
		this.correo = correo;
	}


	public String getEstadocivil() {
		return estadocivil;
	}


	public void setEstadocivil(String estadocivil) {
		this.estadocivil = estadocivil;
	}


	public String getSexo() {
		return sexo;
	}


	public void setSexo(String sexo) {
		this.sexo = sexo;
	}


	public String getFecha_nac() {
		return fecha_nac;
	}


	public void setFecha_nac(String fecha_nac) {
		this.fecha_nac = fecha_nac;
	}


	public int getIdusuario() {
		return idusuario;
	}


	public void setIdusuario(int idusuario) {
		this.idusuario = idusuario;
	}

	
}
