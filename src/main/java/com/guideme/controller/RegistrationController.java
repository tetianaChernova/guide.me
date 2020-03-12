package com.guideme.controller;

import com.guideme.dto.GuideDto;
import com.guideme.dto.TouristDto;
import com.guideme.service.GuideService;
import com.guideme.service.TouristService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/registration")
public class RegistrationController {

	@Resource
	private GuideService guideService;
	@Resource
	private TouristService touristService;


	@GetMapping("/tourist")
	public String registrationTourist() {
		return "registrationTourist";
	}

	@PostMapping("/tourist")
	public String addTourist(TouristDto touristDto, Model model) {

		if (!touristService.addTourist(touristDto)) {
			model.addAttribute("message", "User exists!");
			return "registration";
		}
		return "redirect:/login";
	}

	@GetMapping("/guide")
	public String registrationGuide() {
		return "registrationGuide";
	}

	@PostMapping("/guide")
	public String addGuide(GuideDto guideDto, Model model) {
		if (!guideService.addGuide(guideDto)) {
			model.addAttribute("message", "User exists!");
			return "registration";
		}
		return "redirect:/login";
	}
}
