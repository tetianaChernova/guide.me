package com.guideme.controller;

import com.guideme.dto.ExcursionDto;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/excursions")
public class ExcursionController {

	@Resource
	private ExcursionService excursionService;
	@Resource
	private GuideService guideService;

	@Value("${upload.path}")
	private String uploadPath;

	@GetMapping
	public String createExcursion() {
		return "createExcursion";
	}

	@PostMapping
	public String createExcursion(
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


}
