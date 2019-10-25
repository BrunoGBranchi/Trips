package br.com.trips.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

@NamedQueries({@NamedQuery(name="Viagem.validaQR", 
query="select new br.com.trips.model.Viagem(v.titulo) from Viagem as v left join v.passageiros vp where v.id=?1 and vp.id=?2")})

@Entity
public class Viagem implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Long id;
	private String titulo;
	private String origem;
	private String data_saida;
	private String hora_saida;
	private String destino;
	private String data_retorno;
	private String hora_retorno;
	private String hora_chegada;
	private String embarque;
	private String visitacoes;
	private String inclusos;
	private String valor;
	@OneToMany(cascade = CascadeType.ALL)
	private List<Imagens> imagens;
	@Lob
	private String roteiro;
	@OneToMany(cascade = CascadeType.ALL)
	private List<Usuario> passageiros;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getOrigem() {
		return origem;
	}

	public void setOrigem(String origem) {
		this.origem = origem;
	}

	public String getData_saida() {
		return data_saida;
	}

	public void setData_saida(String data_saida) {
		this.data_saida = data_saida;
	}

	public String getHora_saida() {
		return hora_saida;
	}

	public void setHora_saida(String hora_saida) {
		this.hora_saida = hora_saida;
	}

	public String getDestino() {
		return destino;
	}

	public void setDestino(String destino) {
		this.destino = destino;
	}

	public String getData_retorno() {
		return data_retorno;
	}

	public void setData_retorno(String data_retorno) {
		this.data_retorno = data_retorno;
	}

	public String getHora_retorno() {
		return hora_retorno;
	}

	public void setHora_retorno(String hora_retorno) {
		this.hora_retorno = hora_retorno;
	}

	public String getHora_chegada() {
		return hora_chegada;
	}

	public void setHora_chegada(String hora_chegada) {
		this.hora_chegada = hora_chegada;
	}

	public String getEmbarque() {
		return embarque;
	}

	public void setEmbarque(String embarque) {
		this.embarque = embarque;
	}

	public String getVisitacoes() {
		return visitacoes;
	}

	public void setVisitacoes(String visitacoes) {
		this.visitacoes = visitacoes;
	}

	public String getInclusos() {
		return inclusos;
	}

	public void setInclusos(String inclusos) {
		this.inclusos = inclusos;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

	public List<Imagens> getImagens() {
		return imagens;
	}

	public void setImagens(List<Imagens> imagens) {
		this.imagens = imagens;
	}

	public String getRoteiro() {
		return roteiro;
	}

	public void setRoteiro(String roteiro) {
		this.roteiro = roteiro;
	}

	public List<Usuario> getPassageiros() {
		return passageiros;
	}

	public void setPassageiros(List<Usuario> passageiros) {
		this.passageiros = passageiros;
	}

	public Viagem(Long id, String titulo, String origem, String data_saida, String hora_saida, String destino,
			String data_retorno, String hora_retorno, String hora_chegada, String embarque, String visitacoes,
			String inclusos, String valor, List<Imagens> imagens, String roteiro, List<Usuario> passageiros) {
		super();
		this.id = id;
		this.titulo = titulo;
		this.origem = origem;
		this.data_saida = data_saida;
		this.hora_saida = hora_saida;
		this.destino = destino;
		this.data_retorno = data_retorno;
		this.hora_retorno = hora_retorno;
		this.hora_chegada = hora_chegada;
		this.embarque = embarque;
		this.visitacoes = visitacoes;
		this.inclusos = inclusos;
		this.valor = valor;
		this.imagens = imagens;
		this.roteiro = roteiro;
		this.passageiros = passageiros;
	}

	public Viagem(String titulo) {
		super();
		this.titulo = titulo;
	}

	public Viagem() {
		super();
	}
}
