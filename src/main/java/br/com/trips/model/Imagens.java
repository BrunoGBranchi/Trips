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
	
	private String nomeArquivo;
	
	private String tipoArquivo;
	
	@Lob
	private byte[] data;

	public Imagens(String nomeArquivo, String tipoArquivo, byte[] data) {
		super();
		this.nomeArquivo = nomeArquivo;
		this.tipoArquivo = tipoArquivo;
		this.data = data;
	}

	public Imagens() {
	
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNomeArquivo() {
		return nomeArquivo;
	}

	public void setNomeArquivo(String nomeArquivo) {
		this.nomeArquivo = nomeArquivo;
	}

	public String getTipoArquivo() {
		return tipoArquivo;
	}

	public void setTipoArquivo(String tipoArquivo) {
		this.tipoArquivo = tipoArquivo;
	}

	public byte[] getData() {
		return data;
	}

	public void setData(byte[] data) {
		this.data = data;
	}
	
	
	
}
