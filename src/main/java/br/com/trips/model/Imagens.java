package br.com.trips.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

@Entity
public class Imagens {
		
	@Id
	@GeneratedValue
	private Long id;
		
	@Lob
	private String imagem;
	
	@ManyToOne
	private Viagem viagem;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public Viagem getViagem() {
		return viagem;
	}

	public void setViagem(Viagem viagem) {
		this.viagem = viagem;
	}
	
	public Imagens(Long id, String imagem, Viagem viagem) {
		super();
		this.id = id;
		this.imagem = imagem;
		this.viagem = viagem;
	}
	
	public Imagens(String imagem, Viagem viagem) {
		super();
		this.imagem = imagem;
		this.viagem = viagem;
	}

	public Imagens() {
	
	}
	
	
}
