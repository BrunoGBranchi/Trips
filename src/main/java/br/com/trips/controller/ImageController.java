package br.com.trips.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import br.com.trips.service.ArmazenamentoImagemService;

@Controller
@RequestMapping("/imagens")
public class ImageController {
	
	@Autowired
	private ArmazenamentoImagemService armazenamentoImagemService;
	
	@RequestMapping({"/up", "/", ""})
	public String up() {
		return "imagens/up";
	}
	
	@RequestMapping(path = "/upa", method = RequestMethod.POST)
	public String upaimg(@RequestParam MultipartFile arquivo) {
		try {
			armazenamentoImagemService.armazenaArquivo(arquivo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "imagens/up";
	}
	
}
