package com.guideme.controller;

import com.guideme.dto.ExcursionDto;
import com.guideme.model.Excursion;
import com.guideme.model.Guide;
import com.guideme.model.Tourist;
import com.guideme.model.User;
import com.guideme.service.ExcursionService;
import com.guideme.service.GuideService;
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
import java.util.Objects;

import static java.util.Objects.isNull;

@Controller
@RequestMapping("/excursions")
public class ExcursionController {

	@Resource
	private ExcursionService excursionService;
	@Resource
	private GuideService guideService;
	@Resource
	private TouristService touristService;

	@Value("${upload.path}")
	private String uploadPath;

	@GetMapping
	public String saveExcursionForm() {
		return "createExcursion";
	}

	@GetMapping("/{excursionId}")
	public String getExcursion(@AuthenticationPrincipal User user,
							   @PathVariable Long excursionId,
							   Model model) {
		Excursion foundExcursion = excursionService.findByExcursionId(excursionId);
		Guide excursionGuide = foundExcursion.getGuide();
		Tourist tourist = touristService.findByEmail(user.getEmail());
		model.addAttribute("excursion", foundExcursion);
		model.addAttribute("user", user);
		model.addAttribute("guide", excursionGuide);
		model.addAttribute("tourist", tourist);
		return "excursionPage";
	}

	@PostMapping
	public String saveExcursion(
			@AuthenticationPrincipal User user,
			@RequestParam("file") MultipartFile file,
			@ModelAttribute("excursion") @Valid ExcursionDto excursionDto,
			BindingResult bindingResult,
			Model model) throws IOException {
		excursionDto.setGuide(guideService.findByEmail(user.getEmail()));
		FileUploadUtils.setUploadedFile(file, excursionDto, uploadPath);
		if (bindingResult.hasErrors()) {
			Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
			model.mergeAttributes(errorsMap);
			return "createExcursion";
		}
		if (!model.containsAttribute("descriptionError")) {
			excursionService.save(excursionDto);
		}
		Long id = excursionDto.getGuide().getGuideId();
		return "redirect:/guide/" + id;
	}

	@PostMapping("/{excursionId}/edit")
	public String editExcursion(
			@AuthenticationPrincipal User user,
			@PathVariable Long excursionId,
			@RequestParam("file") MultipartFile file,
			ExcursionDto excursionDto,
			BindingResult bindingResult,
			Model model) throws IOException {
		Excursion foundExcursion = excursionService.findByExcursionId(excursionId);
		if (!isNull(file) && !Objects.requireNonNull(file.getOriginalFilename()).isEmpty()) {
			FileUploadUtils.setUploadedFile(file, excursionDto, uploadPath);
		} else {
			excursionDto.setFilename(foundExcursion.getFilename());
		}

		if (bindingResult.hasErrors()) {
			Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
			model.mergeAttributes(errorsMap);
			return editExcursion(user, excursionId, model);
		}
		excursionService.updateExcursion(excursionDto, foundExcursion);
		return "redirect:/excursions/" + excursionId;
	}

	@GetMapping("/{excursionId}/edit")
	public String editExcursion(
			@AuthenticationPrincipal User user,
			@PathVariable Long excursionId,
			Model model) {
		Excursion foundExcursion = excursionService.findByExcursionId(excursionId);
		Guide foundGuide = foundExcursion.getGuide();
		model.addAttribute("user", user);
		model.addAttribute("guide", foundGuide);
		model.addAttribute("excursion", foundExcursion);
		return "editExcursion";
	}


}
