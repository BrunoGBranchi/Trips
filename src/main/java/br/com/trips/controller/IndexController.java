package br.com.trips.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import br.com.trips.repository.UsuarioRepository;

@Controller
@RequestMapping(path = {"/index", "/"})
public class IndexController {
	
	@Autowired
	private UsuarioRepository usuarioDao;
	
	@RequestMapping(path = { "", "/" })
	public String index(Model model, Principal principal, Authentication auth) {
		model.addAttribute("IDusuario", usuarioDao.findByLogin(principal.getName()));
		return "index/index";
	}
	
	@RequestMapping(value = "/delete")
    public String testAction(@RequestParam String login, Model model) {
		model.addAttribute("usuario", usuarioDao.findByLogin(login));
        return "index/index";
    }
}
