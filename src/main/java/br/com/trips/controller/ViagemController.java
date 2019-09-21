package br.com.trips.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
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

@Controller
@RequestMapping("/viagens")
public class ViagemController {
	
	@Autowired
	private ViagemRepository viagemDao;
	
	@GetMapping({"/", "/listar", ""})
	public String listar() {
		return "viagens/listar";
	}
	
	@GetMapping("/adicionar")
	public String adicionar() {
		return "viagens/adicionar";
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
}
