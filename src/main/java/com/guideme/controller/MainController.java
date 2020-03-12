package com.guideme.controller;

import com.guideme.model.Guide;
import com.guideme.repos.GuideRepo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

@Controller
public class MainController {

	@Resource
	private GuideRepo guideRepo;

	@GetMapping("/")
	public String greeting(Model model) {
		return "landingPade";
	}

	@GetMapping("/main")
	public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
		guideRepo.findAll();
		Iterable<Guide> guides;
		if (filter != null && !filter.isEmpty()) {
			guides = guideRepo.findByEmail(filter);
		} else
			guides = guideRepo.findAll();
		model.addAttribute("guides", guides);
		model.addAttribute("filter", filter);
		return "main";
	}


}
