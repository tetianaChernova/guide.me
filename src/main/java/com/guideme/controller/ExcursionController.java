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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.IOException;

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
			ExcursionDto excursionDto, Model model) throws IOException {
		excursionDto.setGuide(guideService.findByEmail(user.getEmail()));
		FileUploadUtils.setUploadedFile(file, excursionDto, uploadPath);
		excursionService.save(excursionDto);
		return "createExcursion";
	}


}
