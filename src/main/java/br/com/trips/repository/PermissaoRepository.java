package br.com.trips.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.trips.model.Grupo;
import br.com.trips.model.Permissao;

public interface PermissaoRepository extends JpaRepository<Permissao, Long> {
	
	List<Permissao> findByGruposIn(Grupo grupo);

}