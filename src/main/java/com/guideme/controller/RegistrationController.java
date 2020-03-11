package com.guideme.controller;

import com.guideme.dto.GuideDto;
import com.guideme.dto.TouristDto;
import com.guideme.model.Guide;
import com.guideme.model.Role;
import com.guideme.model.Tourist;
import com.guideme.model.User;
import com.guideme.repos.GuideRepo;
import com.guideme.repos.TouristRepo;
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
	@Resource
	private TouristRepo touristRepo;

	@GetMapping("/tourist")
	public String registrationTourist() {
		return "registrationTourist";
	}

	@PostMapping("/tourist")
	public String addTourist(TouristDto touristDto, Model model) {
		Tourist to = Tourist.builder()
				.email(touristDto.getEmail())
				.phone(touristDto.getPhone())
				.firstName(touristDto.getFirstName())
				.lastName(touristDto.getLastName())
				.city(touristDto.getCity())
				.nationality(touristDto.getNationality())
				.build();
		User foundUser = userRepo.findByEmail(to.getEmail());
		if (foundUser != null) {
			model.addAttribute("message", "User exists!");
			return "registrationTourist";
		}
		User user = User.builder()
				.email(to.getEmail())
				.active(true)
				.role(Role.TOURIST)
				.password(touristDto.getPassword())
				.build();
		touristRepo.save(to);
		userRepo.save(user);
		System.out.println("hi");
		return "redirect:/login";
	}

	@GetMapping("/guide")
	public String registrationGuide() {
		return "registrationGuide";
	}

	@PostMapping("/guide")
	public String addGuide(GuideDto guideDto, Model model) {
		Guide guide = Guide.builder()
				.email(guideDto.getEmail())
				.phone(guideDto.getPhone())
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
			return "registrationGuide";
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
