package br.com.trips.repository;

import java.util.List;

import javax.persistence.NamedQuery;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import br.com.trips.model.Viagem;

public interface ViagemRepository extends JpaRepository<Viagem, Long>{
	
	//viagem_passageiros/
	//select * from viagem v join viagem_passageiros vp on vp.viagem_id = v.id where vp.viagem_id=2 and vp.passageiros_id=1;
	@Query("select v from Viagem v join viagem_passageiros vp on vp.viagem_id = vg.id where vp.viagem_id=?1 and vp.passageiros_id=?2")
	Viagem validaQR (Long idViagem, Long idPassageiro);
	
}
