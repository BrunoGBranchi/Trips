package br.com.trips.repository;

import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.trips.model.Viagem;

public interface ViagemRepository extends JpaRepository<Viagem, Long>{
	
	//viagem_passageiros/
	//select * from viagem v join viagem_passageiros vp on vp.viagem_id = v.id where vp.viagem_id=2 and vp.passageiros_id=1;
		
	Viagem validaQR (Long idViagem, Long idPassageiro);
	
}
