package pe.edu.upeu.planilla.config;

import javax.sql.DataSource;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pe.edu.upeu.planilla.dao.PersonaDAO;

@Service("userDetailsService")
@Transactional(readOnly=true)
public class UserDetailsServiceImpl implements UserDetailsService{

	DataSource d = AppConfig.getDataSource();
	
	private PersonaDAO pao = new PersonaDAO(d);
	
	@Override
	public UserDetails loadUserByUsername(String User) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

}
