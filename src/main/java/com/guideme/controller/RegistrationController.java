package com.guideme.controller;

import com.guideme.dto.GuideDto;
import com.guideme.dto.TouristDto;
import com.guideme.model.User;
import com.guideme.service.GuideService;
import com.guideme.service.TouristService;
import com.guideme.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.Map;

import static java.util.Objects.isNull;
import static java.util.Objects.nonNull;

@Controller
@RequestMapping("/registration")
public class RegistrationController {

	@Resource
	private GuideService guideService;
	@Resource
	private TouristService touristService;
	@Resource
	private UserService userService;


	@GetMapping("/tourist")
	public String registrationTourist() {
		return "registrationTourist";
	}

	@PostMapping("/tourist")
	public String addTourist(@ModelAttribute("user") @Valid TouristDto user, BindingResult bindingResult, Model model) {
		User foundUser = userService.findByEmail(user.getEmail());
		boolean notValidPassword = nonNull(user.getPassword()) && !user.getPassword().equals(user.getPassword2());
		if (notValidPassword) {
			model.addAttribute("passwordError", "Passwords are different!");
		}
		if (bindingResult.hasErrors()) {
			Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
			model.mergeAttributes(errorsMap);
			return "registrationTourist";
		}

		if (nonNull(foundUser)){
			model.addAttribute("emailError", "User exists!");
		}
		if (notValidPassword || nonNull(foundUser)){
			return "registrationTourist";
		}
		touristService.addTourist(user);
		return "redirect:/login";
	}

	@GetMapping("/guide")
	public String registrationGuide() {
		return "registrationGuide";
	}

	@PostMapping("/guide")
	public String addGuide(@ModelAttribute("user") @Valid GuideDto user, BindingResult bindingResult, Model model) {
		User foundUser = userService.findByEmail(user.getEmail());
		boolean notValidPassword = nonNull(user.getPassword()) && !user.getPassword().equals(user.getPassword2());
		if (notValidPassword) {
			model.addAttribute("passwordError", "Passwords are different!");
		}
		if (bindingResult.hasErrors()) {
			Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
			model.mergeAttributes(errorsMap);
			return "registrationGuide";
		}
		if (nonNull(foundUser)){
			model.addAttribute("emailError", "User exists!");
		}
		if (notValidPassword || nonNull(foundUser)){
			return "registrationGuide";
		}
		guideService.addGuide(user);
		return "redirect:/login";
	}
}
