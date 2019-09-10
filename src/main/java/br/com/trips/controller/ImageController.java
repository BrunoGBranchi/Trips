package br.com.trips.controller;

import java.io.IOException;
import java.sql.Blob;

import javax.servlet.http.HttpServletResponse;

import org.hibernate.cache.spi.support.AbstractReadWriteAccess.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import br.com.trips.model.Imagens;
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
	public String upaimg(@RequestParam MultipartFile file, ModelMap modelMap) {
		try {
			armazenamentoImagemService.armazenaArquivo(file);
			modelMap.addAttribute("file", file);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "imagens/up";
	}
	
	@RequestMapping({"/show"})
	public String show(HttpServletResponse response) throws IOException {
		Imagens img = armazenamentoImagemService.getImagem(1l);
		response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
		response.getOutputStream().write(img.getData());
		response.getOutputStream().close();
		return "imagens/show";
	}
	
	@RequestMapping({"/load"})
	public String carregaImg() throws IOException {

		return "imagens/load";
	}
	
}
