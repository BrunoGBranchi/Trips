package br.com.trips.controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Optional;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import br.com.trips.model.Imagens;
import br.com.trips.model.QR;
import br.com.trips.model.Usuario;
import br.com.trips.model.Viagem;
import br.com.trips.repository.UsuarioRepository;
import br.com.trips.repository.ViagemRepository;
import br.com.trips.service.ViagemService;
import net.sf.jasperreports.engine.JRException;

@Controller
@RequestMapping("/viagens")
public class ViagemController {
	
	@Autowired
	private ViagemRepository viagemDao;
	
	@Autowired
	private ViagemService viagemService;
	
	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@GetMapping({"/", "/listar", ""})
	public String listar(Model model, Authentication auth) {
		Usuario u = usuarioRepository.findByLogin(auth.getName());
		model.addAttribute("viagensPassageiro", viagemDao.findByPassageiro(u.getId()));
		return "viagens/listar";
	}
	
	@GetMapping("/adicionar")
	public String adicionar() {
		return "viagens/adicionar";
	}
	
	@RequestMapping(path = "/lerQR")
	public String lerQR() {
		return "viagens/leituraQRcode";
	}
	
	@RequestMapping(path = "/mostrarQR")
	public String mostrarQR() {
		return "viagens/mostrarQRcode";
	}
	
	@RequestMapping(path = "/confirmado")
	public String confirmadoQR() {
		return "viagens/confirmado";
	}
	
	@RequestMapping(path = "/naoConfirmado")
	public String naoConfirmadoQR() {
		return "viagens/naoConfirmado";
	}
	
	@RequestMapping(path = "/dashboard")
	public String dashboard(Model model) {
		model.addAttribute("viagens", viagemDao.findAll());
		return "viagens/dashboard";
	}
	
	@PostMapping({"/salvar"})
	public String salvar(MultipartFile[] imagensFile, MultipartFile roteiroFile, Model model, Viagem viagem) throws IOException {
		List<Imagens> listaImagens = new ArrayList<Imagens>();
		for (MultipartFile f : imagensFile) {
			System.out.println(f);
			 String stArquivo = Base64.getEncoder().encodeToString(f.getBytes());
			 Imagens img = new Imagens(stArquivo);
			 listaImagens.add(img);
			 
		}
		String roteiro = Base64.getEncoder().encodeToString(roteiroFile.getBytes());
		viagem.setRoteiro(roteiro);
		viagem.setImagens(listaImagens);
		viagemDao.saveAndFlush(viagem);
		
		return "redirect:adicionar";
	}
	
	@RequestMapping(path = "/excluir/{id}")
	public String excluir(@PathVariable(value = "id") Long id, Authentication auth, Viagem viagem) {
		viagemDao.deleteById(id);
		return "viagens/listar";
	}
	
	@RequestMapping(path = "/excluirPassageiro/{id}")
	public String excluirPassageiro(@PathVariable(value = "id") Long id, Authentication auth, Viagem viagem) {
		Usuario u = usuarioRepository.findByLogin(auth.getName());
		Optional<Viagem> v = viagemDao.findById(id);
		List<Usuario> passageiros = new ArrayList<Usuario>(v.get().getPassageiros());
		passageiros.remove(u);
		return "viagens/listar";
	}
	
	@RequestMapping(path = "/detalhes/{id}")
	public String recebeDetalhes(@PathVariable(value = "id") Long id, Model model) {
		Optional <Viagem> v = viagemDao.findById(id);
		model.addAttribute("detalhes", v.get());
		return "viagens/detalhes";
	}
	
	//esse colosso aqui adiciona o passageiro na viagem e gera o comprovante
	@RequestMapping(path = "/adicionaPassageiro/{id}")
	public String adicionaPassageiro(@PathVariable(value = "id") Long id, Model model, Principal principal, Viagem viagem, HttpServletResponse response) throws JRException, SQLException, IOException  {
		Usuario u = usuarioRepository.findByLogin(principal.getName());
		Optional<Viagem> v = viagemDao.findById(id);
		List<Usuario> passageiros = new ArrayList<Usuario>();
		passageiros.add(u);
		viagem.setData_retorno(v.get().getData_retorno());
		viagem.setData_saida(v.get().getData_saida());
		viagem.setDestino(v.get().getDestino());
		viagem.setEmbarque(v.get().getEmbarque());
		viagem.setHora_chegada(v.get().getHora_chegada());
		viagem.setHora_retorno(v.get().getHora_retorno());
		viagem.setHora_saida(v.get().getHora_saida());
		viagem.setId(v.get().getId());
		viagem.setImagens(v.get().getImagens());
		viagem.setInclusos(v.get().getInclusos());
		viagem.setOrigem(v.get().getOrigem());
		viagem.setRoteiro(v.get().getRoteiro());
		viagem.setTitulo(v.get().getTitulo());
		viagem.setValor(v.get().getValor());
		viagem.setVisitacoes(v.get().getVisitacoes());
		viagem.setPassageiros(passageiros);
		viagemDao.saveAndFlush(viagem);
		viagemService.geraComprovantePassageiro(id, response, principal);
		return "redirect:viagens/detalhes";
	}
	
	@PostMapping({"/validaQR"})
	public String submitQR(QR qr) {
		String[] s = qr.getValores().split(Pattern.quote(","));
		String valor1;
		String valor2;
		valor1 = s[0];
		valor2 = s[1];
	
		if (viagemDao.validaQR(Long.valueOf(valor1), Long.valueOf(valor2)) != null) {
			return "viagens/confirmado";
		} else {
			return "viagens/naoConfirmado";
		}
	}
	
	@RequestMapping(path="/downloadRoteiro/{id}")
	public String downloadRoteiro(@PathVariable(value = "id") Long id, HttpServletResponse response) throws JRException, IOException {
		viagemService.downloadRoteiro(id, response);
		return "viagens/listar";
	}
	
	@RequestMapping(path = "/emitirLista/{id}")
	public String emitirLista(@PathVariable(value = "id") Long id, HttpServletResponse response, Viagem viagem) throws JRException, IOException {
		viagemService.geraListaPassageiros(id, response);
		return "viagens/listar";
	}
	
}
