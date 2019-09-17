package br.com.trips.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.com.trips.model.Viagem;

public interface ViagemRepository extends JpaRepository<Viagem, Long>{

}
