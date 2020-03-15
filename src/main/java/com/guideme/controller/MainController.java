package com.guideme.controller;

import com.guideme.model.Excursion;
import com.guideme.service.ExcursionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

@Controller
public class MainController {

	@Resource
	private ExcursionService excursionService;

	@GetMapping("/")
	public String greeting(Model model) {
		return "greeting";
	}

	@GetMapping("/main")
	public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
		Iterable<Excursion> excursions;
		if (filter != null && !filter.isEmpty()) {
			excursions = excursionService.findByCityLike(filter);
		} else {
			excursions = excursionService.findAll();
		}
		model.addAttribute("excursionList", excursions);
		model.addAttribute("filter", filter);
		return "main";
	}

}
