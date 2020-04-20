package com.guideme.controller;

import com.guideme.dto.GuideDto;
import com.guideme.dto.TouristDto;
import com.guideme.model.User;
import com.guideme.service.GuideService;
import com.guideme.service.TouristService;
import com.guideme.service.UserService;
import com.guideme.utils.FileUploadUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Map;

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

	@Value("${upload.path}")
	private String uploadPath;


	@GetMapping("/tourist")
	public String registrationTourist() {
		return "registrationTourist";
	}

	@PostMapping("/tourist")
	public String addTourist(
			@RequestParam("file") MultipartFile file,
			@ModelAttribute("user") @Valid TouristDto tourist,
			BindingResult bindingResult,
			Model model) throws IOException {
		FileUploadUtils.setUploadedFile(file, tourist, uploadPath);
		User foundUser = userService.findByEmail(tourist.getEmail());
		boolean notValidPassword = nonNull(tourist.getPassword()) && !tourist.getPassword().equals(tourist.getPassword2());
		if (notValidPassword) {
			model.addAttribute("passwordError", "Passwords are different!");
		}
		if (bindingResult.hasErrors()) {
			Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
			model.mergeAttributes(errorsMap);
			return "registrationTourist";
		}

		if (nonNull(foundUser)) {
			model.addAttribute("emailError", "User exists!");
		}
		if (notValidPassword || nonNull(foundUser)) {
			return "registrationTourist";
		}
		touristService.addTourist(tourist);
		return "redirect:/login";
	}

	@GetMapping("/guide")
	public String registrationGuide() {
		return "registrationGuide";
	}

	@PostMapping("/guide")
	public String addGuide(@RequestParam("file") MultipartFile file,
						   @ModelAttribute("user") @Valid GuideDto guide,
						   BindingResult bindingResult,
						   Model model) throws IOException {
		FileUploadUtils.setUploadedFile(file, guide, uploadPath);

		User foundUser = userService.findByEmail(guide.getEmail());
		boolean notValidPassword = nonNull(guide.getPassword()) && !guide.getPassword().equals(guide.getPassword2());
		if (notValidPassword) {
			model.addAttribute("passwordError", "Passwords are different!");
		}
		if (bindingResult.hasErrors()) {
			Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
			model.mergeAttributes(errorsMap);
			return "registrationGuide";
		}
		if (nonNull(foundUser)) {
			model.addAttribute("emailError", "User exists!");
		}
		if (notValidPassword || nonNull(foundUser)) {
			return "registrationGuide";
		}
		guideService.addGuide(guide);
		return "redirect:/login";
	}

	@GetMapping("/activate/{code}")
	public String activate(Model model, @PathVariable String code) {
		boolean isActivated = userService.activateUser(code);
		if (isActivated) {
			model.addAttribute("message", "User is successfully activated");
		} else {
			model.addAttribute("message", "Activation code is not found");
		}
		return "login";
	}
}
