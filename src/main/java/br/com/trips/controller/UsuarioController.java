package br.com.trips.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.trips.model.Roles;
import br.com.trips.model.Usuario;
import br.com.trips.repository.UsuarioRepository;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {
	
	@Autowired
	private UsuarioRepository usuarioDao;
	
	@RequestMapping(path= {"/cadastro", "/", ""})
	public String cadastro() {
		return "usuarios/cadastro";
	}
	
	@RequestMapping(path= {"/mostrar"})
	public String mostrar(Model model) {
		model.addAttribute("usuarios", usuarioDao.findAll());
		return "usuarios/mostrar";
	}
	
	@RequestMapping(path = "/enviar", method = RequestMethod.POST)
	public String salvar(Model model, Usuario usuario) {
		//TODO Setar grupo de usuario novo;
		List<Roles> roles = new ArrayList<Roles>();
		roles.add(Roles.ADM_SISTEMA);
		usuario.setRoles(roles);
		usuario.setAtivo(true);
		usuario.criptografarSenha();
		usuarioDao.save(usuario);
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
