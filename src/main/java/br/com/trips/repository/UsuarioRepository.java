package br.com.trips.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.trips.model.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

	Usuario findByLogin(String login);
}
