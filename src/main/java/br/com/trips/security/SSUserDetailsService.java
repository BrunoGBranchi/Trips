package br.com.trips.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import br.com.trips.model.Roles;
import br.com.trips.model.Usuario;
import br.com.trips.repository.UsuarioRepository;

@Component
public class SSUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UsuarioRepository usuarios;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Usuario usuario = usuarios.findByLogin(username);
		
		if (usuario == null) {
			throw new UsernameNotFoundException("Usuário não encontrado!");
		}
		
		return new UsuarioSistema(usuario.getId(), usuario.getNome(), usuario.getLogin(), usuario.getSenha(),  authorities(usuario));
	}
	
	public Collection<? extends GrantedAuthority> authorities(Usuario usuario) {
		Collection<GrantedAuthority> auths = new ArrayList<>();
		
		for (Roles role : usuario.getRoles()) {
			auths.add(new SimpleGrantedAuthority("ROLE_" + role.name()));
		}
		return auths;
	}
	
}