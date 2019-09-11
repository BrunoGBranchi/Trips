package br.com.trips.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class Imagens {
		
	@Id
	@GeneratedValue
	private Long id;
		
	@Lob
	private String imagem;

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

	public Imagens(String imagem) {
		super();
		this.imagem = imagem;
	}

	public Imagens() {
	
	}
	
	
	
}
