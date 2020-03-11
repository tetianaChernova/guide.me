package com.guideme.controller;

import com.guideme.dto.GuideDto;
import com.guideme.model.Guide;
import com.guideme.model.Role;
import com.guideme.model.User;
import com.guideme.repos.GuideRepo;
import com.guideme.repos.UserRepo;
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
	private UserRepo userRepo;
	@Resource
	private GuideRepo guideRepo;

	@GetMapping("/guide")
	public String registration() {
		return "registration";
	}

	@PostMapping("/guide")
	public String addUser(GuideDto guideDto, Model model) {
		Guide guide = Guide.builder()
				.email(guideDto.getEmail())
				.firstName(guideDto.getFirstName())
				.lastName(guideDto.getLastName())
				.birthDate(guideDto.getBirthDate())
				.gender(guideDto.getGender())
				.experience(guideDto.getExperience())
				.rating((double) 0)
				.city(guideDto.getCity())
				.nationality(guideDto.getNationality())
				.build();
		User foundUser = userRepo.findByEmail(guide.getEmail());
		if (foundUser != null) {
			model.addAttribute("message", "User exists!");
			return "registration";
		}
		User user = User.builder()
				.email(guide.getEmail())
				.active(true)
				.role(Role.GUIDE)
				.password(guideDto.getPassword())
				.build();
		guideRepo.save(guide);
		userRepo.save(user);
		System.out.println("hi");
		return "redirect:/login";
	}
}
