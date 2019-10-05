package br.com.trips.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/imagens")
public class ImageController {
	/*
	 * @Autowired private ArmazenamentoImagemService armazenamentoImagemService;
	 * 
	 * @RequestMapping({"/up", "/", ""}) public String up() { return "imagens/up"; }
	 * 
	 * @RequestMapping(path = "/upa", method = RequestMethod.POST) public String
	 * upaimg(@RequestParam MultipartFile file, ModelMap modelMap) { try {
	 * armazenamentoImagemService.armazenaArquivo(file);
	 * modelMap.addAttribute("file", file); } catch (Exception e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } return "imagens/up"; }
	 * 
	 * @RequestMapping({"/show"}) public String show(HttpServletResponse response)
	 * throws IOException { Imagens img = armazenamentoImagemService.getImagem(1l);
	 * response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
	 * response.getOutputStream().write(img.getData());
	 * response.getOutputStream().close(); return "imagens/show"; }
	 * 
	 * @RequestMapping({"/load"}) public String carregaImg() throws IOException {
	 * 
	 * return "imagens/load"; }
	 */	
}
