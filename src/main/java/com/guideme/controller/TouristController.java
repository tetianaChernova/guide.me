package com.guideme.controller;

import com.guideme.model.Tourist;
import com.guideme.model.User;
import com.guideme.service.TouristService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/tourist")
public class TouristController {
	@Resource
	private TouristService touristService;

	@GetMapping("/{touristId}")
	public String touristProfile(@AuthenticationPrincipal User user,
								 @PathVariable Long touristId, Model model) {
		Tourist foundedTourist = touristService.findByTouristId(touristId);
		model.addAttribute("tourist", foundedTourist);
		model.addAttribute("user", user);
		return "touristProfile";
	}
}
