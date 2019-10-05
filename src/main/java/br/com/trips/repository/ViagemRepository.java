package br.com.trips.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import br.com.trips.model.Viagem;

public interface ViagemRepository extends JpaRepository<Viagem, Long>{
	
	@Query("select v from Viagem v where v.id = ?1")
	List<Viagem> preencheRelatorio (Long id);
	
}
