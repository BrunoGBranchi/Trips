package br.com.trips.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.trips.model.Imagens;
import br.com.trips.model.Viagem;

public interface ImagensRepository extends JpaRepository<Imagens, Long> {
	
	List<Imagens> findByViagem (Viagem viagem);
	
}
