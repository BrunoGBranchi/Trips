package br.com.trips.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import br.com.trips.model.Roles;
import br.com.trips.model.Usuario;
import br.com.trips.repository.UsuarioRepository;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

	@Autowired
	private UsuarioRepository usuarioDao;
	private boolean salvo = false;
	@RequestMapping(path = { "/cadastro", "/", "" })
	public String cadastro(Model model) {
		if (salvo == true) {
			model.addAttribute("aviso", "Alterações salvas com sucesso!");
		}
		return "usuarios/cadastro";
	}
	
	@GetMapping(path = { "/perfil"})
	public String perfil(Model model, Authentication auth) {
		Usuario u = usuarioDao.findByLogin(auth.getName());
		Optional<Usuario> user = usuarioDao.findById(u.getId());
		model.addAttribute("usuario", user.get());
		return "usuarios/perfil";
	}
	
	@RequestMapping(path = { "/mostrar" })
	public String mostrar(Model model) {
		model.addAttribute("usuarios", usuarioDao.findAll());
		return "usuarios/mostrar";
	}

	@RequestMapping(path = "/enviar", method = RequestMethod.POST)
	public String salvar(Model model, Usuario usuario, MultipartFile file) throws IOException {
		// Salva usuario;
		List<Roles> roles = new ArrayList<Roles>();
		if (usuarioDao.count() == 0) {
			roles.add(Roles.ADM_SISTEMA);
		} else {
			roles.add(Roles.CLIENTE);
		}
		usuario.setRoles(roles);
		usuario.setAtivo(true);
		usuario.criptografarSenha();
		usuario.calculaIdade();
		
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
	
	@RequestMapping(path = "/salvarEditado", method = RequestMethod.POST)
	public String editando(Usuario usuario, Model model) {
		//usuario.setRoles(usuario.getRoles());
		//usuario.setAtivo(true);
		//usuario.criptografarSenha();
		//usuario.calculaIdade();
		//salvo = true;
		//usuarioDao.saveAndFlush(usuario);
		return "redirect:/usuarios/perfil";
	}

	

}
