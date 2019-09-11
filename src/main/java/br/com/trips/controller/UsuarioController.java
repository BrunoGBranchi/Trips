package br.com.trips.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import br.com.trips.model.Imagens;
import br.com.trips.model.Roles;
import br.com.trips.model.Usuario;
import br.com.trips.repository.UsuarioRepository;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

	@Autowired
	private UsuarioRepository usuarioDao;

	@RequestMapping(path = { "/cadastro", "/", "" })
	public String cadastro() {
		return "usuarios/cadastro";
	}

	@RequestMapping(path = { "/mostrar" })
	public String mostrar(Model model) {
		model.addAttribute("usuarios", usuarioDao.findAll());
		return "usuarios/mostrar";
	}

	// Testar
	@RequestMapping(path = "/enviar", method = RequestMethod.POST)
	public String salvar(Model model, Usuario usuario, MultipartFile file) throws IOException {
		// Salva usuario;
		List<Roles> roles = new ArrayList<Roles>();
		List<Imagens> imagens = new ArrayList<Imagens>();
		roles.add(Roles.ADM_SISTEMA);
		usuario.setRoles(roles);
		usuario.setAtivo(true);
		usuario.criptografarSenha();

		String img = Base64.getEncoder().encodeToString(file.getBytes());
		Imagens imagem = new Imagens(img);
		imagens.add(imagem);
		usuario.setImgPerfil(imagens);
		
		usuarioDao.saveAndFlush(usuario);
		model.addAttribute("usuarios", usuarioDao.findAll());

		return "redirect:/login";
	}

	@RequestMapping(path = "/excluir/{id}")
	public String excluir(@PathVariable(value = "id") Long id, Usuario usuario) {
		List<Roles> roles = new ArrayList<Roles>(usuario.getRoles());
		roles.remove(Roles.ADM_SISTEMA);
		usuario.setRoles(roles);
		usuarioDao.deleteById(id);
		return "redirect:/index/index";

	}

}
