package br.com.trips.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.trips.model.Grupo;
import br.com.trips.model.Usuario;

public interface GrupoRepository extends JpaRepository<Grupo, Long> {
	
	List<Grupo> findByUsuariosIn(Usuario usuario);

}