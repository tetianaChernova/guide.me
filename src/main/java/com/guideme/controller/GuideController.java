package com.guideme.controller;

import com.guideme.dto.ProfileEditDto;
import com.guideme.model.Excursion;
import com.guideme.model.Guide;
import com.guideme.model.User;
import com.guideme.service.ExcursionService;
import com.guideme.service.GuideService;
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
@RequestMapping("/guide")
public class GuideController {

	@Resource
	private ExcursionService excursionService;
	@Resource
	private GuideService guideService;
	@Value("${upload.path}")
	private String uploadPath;

	@GetMapping("/{guideId}")
	public String guideProfile(@AuthenticationPrincipal User user,
							   @PathVariable Long guideId, Model model) {
		Guide foundedGuide = guideService.findByGuideId(guideId);
		setGuidesExcursionsListsToTheModel(user, model, foundedGuide);
		return "guideProfile";
	}

	@GetMapping("/profile")
	public String getGuideProfile(
			@AuthenticationPrincipal User user,
			Model model) {
		Guide foundedGuide = guideService.findByEmail(user.getEmail());
		setGuidesExcursionsListsToTheModel(user, model, foundedGuide);
		return "guideProfile";
	}

	@GetMapping("/profile/edit")
	public String editGuideProfile(@AuthenticationPrincipal User user, Model model) {
		Guide guide = guideService.findByEmail(user.getEmail());
		model.addAttribute("usr", guide);
		model.addAttribute("user", user);
		return "guideEditProfile";
	}

	@PostMapping("/profile/edit")
	public String editGuideProfile(@AuthenticationPrincipal User user,
								   @RequestParam("file") MultipartFile file,
								   @ModelAttribute("userDto") @Valid ProfileEditDto profileEditDto,
								   BindingResult bindingResult,
								   Model model) throws IOException {
		Guide guide = guideService.findByEmail(user.getEmail());
		if (!isNull(file) && !file.getOriginalFilename().isEmpty()) {
			FileUploadUtils.setUploadedFile(file, profileEditDto, uploadPath);
		} else {
			profileEditDto.setFilename(guide.getFilename());
		}

		if (bindingResult.hasErrors()) {
			Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
			model.mergeAttributes(errorsMap);
			return editGuideProfile(user, model);
		}
		guideService.updateGuide(profileEditDto, guide);
		return "redirect:/guide/profile";
	}

	public void setGuidesExcursionsListsToTheModel(@AuthenticationPrincipal User user, Model model, Guide foundedGuide) {
		Iterable<Excursion> allExcursions = excursionService.findByGuide(foundedGuide);
		Iterable<Excursion> personalExcursions = excursionService.findPersonalExcursionsByGuide(foundedGuide);
		Iterable<Excursion> mostVisitedExcursions = excursionService.getMostVisitedExcursions(foundedGuide);
		model.addAttribute("allExcursionList", allExcursions);
		model.addAttribute("personalExcursionList", personalExcursions);
		model.addAttribute("mostVisitedExcursionList", mostVisitedExcursions);
		model.addAttribute("guide", foundedGuide);
		model.addAttribute("user", user);

	}
}
