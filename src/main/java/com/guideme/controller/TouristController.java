package com.guideme.controller;

import com.guideme.dto.ProfileEditDto;
import com.guideme.model.Tourist;
import com.guideme.model.User;
import com.guideme.service.TouristService;
import com.guideme.utils.FileUploadUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
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

import static java.util.Objects.isNull;

@Controller
@RequestMapping("/tourist")
public class TouristController {
	@Resource
	private TouristService touristService;
	@Value("${upload.path}")
	private String uploadPath;

	@GetMapping("/{touristId}")
	public String touristProfile(@AuthenticationPrincipal User user,
								 @PathVariable Long touristId, Model model) {
		Tourist foundedTourist = touristService.findByTouristId(touristId);
		Integer bookingsNumber = touristService.getConfirmedBookingsNum(foundedTourist);
		model.addAttribute("tourist", foundedTourist);
		model.addAttribute("bookingsNumber", bookingsNumber);
		model.addAttribute("user", user);
		return "touristProfile";
	}

	@GetMapping("/profile")
	public String getTouristProfile(
			@AuthenticationPrincipal User user,
			Model model) {
		Tourist foundedTourist = touristService.findByEmail(user.getEmail());
		Integer bookingsNumber = touristService.getConfirmedBookingsNum(foundedTourist);
		model.addAttribute("tourist", foundedTourist);
		model.addAttribute("bookingsNumber", bookingsNumber);
		model.addAttribute("user", user);
		return "touristProfile";
	}

	@GetMapping("/profile/edit")
	public String editTouristProfile(@AuthenticationPrincipal User user, Model model) {
		Tourist tourist = touristService.findByEmail(user.getEmail());
		model.addAttribute("usr", tourist);
		model.addAttribute("user", user);
		return "touristEditProfile";
	}

	@PostMapping("/profile/edit")
	public String editTouristProfile(@AuthenticationPrincipal User user,
									 @RequestParam("file") MultipartFile file,
									 @ModelAttribute("userDto") @Valid ProfileEditDto profileEditDto,
									 BindingResult bindingResult,
									 Model model) throws IOException {
		Tourist tourist = touristService.findByEmail(user.getEmail());
		if (!isNull(file) && !file.getOriginalFilename().isEmpty()) {
			FileUploadUtils.setUploadedFile(file, profileEditDto, uploadPath);
		} else {
			profileEditDto.setFilename(tourist.getFilename());
		}

		if (bindingResult.hasErrors()) {
			Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
			model.mergeAttributes(errorsMap);
			return editTouristProfile(user, model);
		}
		touristService.updateTourist(profileEditDto, tourist);
		return "redirect:/tourist/profile";
	}

}
