package br.com.trips.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.trips.model.Grupo;
import br.com.trips.model.Usuario;
import br.com.trips.repository.GrupoRepository;
import br.com.trips.repository.UsuarioRepository;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {
	
	@Autowired
	private UsuarioRepository usuarioDao;
	
	@Autowired
	private GrupoRepository grupoDao;
	
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
		//Set<Grupo> grupo = new HashSet<Grupo>();
		//usuario.setGrupos(grupo);
		usuarioDao.saveAndFlush(usuario);
		model.addAttribute("usuarios", usuarioDao.findAll());
		return "redirect:/login/entrar";
	}
}
