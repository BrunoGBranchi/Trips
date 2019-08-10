package br.com.trips.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class UsuarioSistema extends User {

	private static final long serialVersionUID = 1L;
	
	private Long id;
	
	private String nome;
	
	public UsuarioSistema(Long id, String nome, String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		
		this.nome = nome;
		this.id = id;
	}
	
	
	
	public String getNome() {
		return nome;
	}
	
	public Long getId() {
		return id;
	}

}