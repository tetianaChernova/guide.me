package com.guideme.controller;

import com.guideme.dto.BookingDto;
import com.guideme.service.BookingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/booking")
public class BookingController {

	@Resource
	private BookingService bookingService;

	@PostMapping
	public String saveExcursion(
			@ModelAttribute("booking") BookingDto bookingDto,
			BindingResult bindingResult,
			Model model) {
//		if (bindingResult.hasErrors()) {
//			Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
//			model.mergeAttributes(errorsMap);
//			return "redirect: /excursions/" + bookingDto.getExcursionId();
//		}
		bookingService.addBooking(bookingDto);
		return "redirect:/excursions/" + bookingDto.getExcursionId();
	}
}
