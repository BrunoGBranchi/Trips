package br.com.trips.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import br.com.trips.model.Imagens;
import br.com.trips.model.Viagem;
import br.com.trips.repository.ViagemRepository;
import br.com.trips.service.ConverteArquivoService;
import br.com.trips.service.HeaderService;

@Controller
@RequestMapping("/viagens")
public class ViagemController {
	
	@Autowired
	private ViagemRepository viagemDao;
	
	@Autowired
	private ConverteArquivoService converteArquivo;
	
	@GetMapping({"/", "/listar", ""})
	public String listar() {
		return "viagens/listar";
	}
	
	@GetMapping("/adicionar")
	public String adicionar() {
		return "viagens/adicionar";
	}
	
	@PostMapping({"/salvar"})
	public String salvar(MultipartFile[] imagens, MultipartFile roteiro, Model model, Viagem viagem) throws IOException {
		viagem.setRoteiro(converteArquivo.converter(roteiro));
		List<Imagens> listaImagens = new ArrayList<Imagens>();
		for (int i = 0; i < imagens.length; i++) {
			MultipartFile multipartFile = imagens[i];
			String stArquivo = Base64.getEncoder().encodeToString(multipartFile.getBytes());
			System.out.println(stArquivo);
		}
		
		
		System.out.println(imagens);
		viagem.setImagens(listaImagens);
		viagemDao.saveAndFlush(viagem);
		
		return "redirect:viagens/adicionar";
	}
}
