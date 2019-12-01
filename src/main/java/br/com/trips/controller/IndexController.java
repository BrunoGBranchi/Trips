package br.com.trips.controller;

import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import br.com.trips.model.Viagem;
import br.com.trips.repository.UsuarioRepository;
import br.com.trips.repository.ViagemRepository;

@Controller
@RequestMapping(path = {"/index", "/", ""})
public class IndexController {
	
	@Autowired
	private UsuarioRepository usuarioDao;
	
	@Autowired
	private ViagemRepository viagemRepository;
	
	@GetMapping(path = { "", "/" })
	public String index(Model model, Principal principal, Authentication auth) {
		List<Viagem> v = viagemRepository.findAll();
		model.addAttribute("viagens", v);
		return "index/index";
	}
	
	@GetMapping(path = "/delete/{id}")
	public String delete(@PathVariable(value = "id") Long id) {
		usuarioDao.deleteById(id);
		return "redirect:/login/entrar";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request,
			HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout=true";
	}
	
	
	
}
