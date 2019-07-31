package br.com.trips.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = {"/index", "/"})
public class IndexController {

	@RequestMapping(path = { "", "/" })
	public String index() {
		return "index/index";
	}
}
