package br.com.trips.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.trips.model.Viagem;

public interface ViagemRepository extends JpaRepository<Viagem, Long>{
	
	Viagem validaQR (Long idViagem, Long idPassageiro);
	
	List<Viagem> findByPassageiro (Long idPassageiro);
		
}