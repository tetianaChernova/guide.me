package com.guideme.controller;

import com.guideme.model.Excursion;
import com.guideme.model.Guide;
import com.guideme.model.User;
import com.guideme.service.ExcursionService;
import com.guideme.service.GuideService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/guide")
public class GuideController {

	@Resource
	private ExcursionService excursionService;
	@Resource
	private GuideService guideService;

	@GetMapping("/{guideId}")
	public String guideProfile(@AuthenticationPrincipal User user,
							   @PathVariable Long guideId, Model model) {
		Guide foundedGuide = guideService.findByGuideId(guideId);
		Iterable<Excursion> excursions;
		excursions = excursionService.findByGuide(foundedGuide);
		model.addAttribute("excursionList", excursions);
		model.addAttribute("guide", foundedGuide);
		model.addAttribute("user", user);
		return "guideProfile";
	}

	@GetMapping("/profile")
	public String getGuideProfile(
			@AuthenticationPrincipal User user,
			Model model) {
		Guide foundedGuide = guideService.findByEmail(user.getEmail());
		Iterable<Excursion> excursions;
		excursions = excursionService.findByGuide(foundedGuide);
		model.addAttribute("excursionList", excursions);
		model.addAttribute("guide", foundedGuide);
		model.addAttribute("user", user);
		return "guideProfile";
	}
}
