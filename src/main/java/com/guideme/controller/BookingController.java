package com.guideme.controller;

import com.guideme.dto.BookingDto;
import com.guideme.model.Booking;
import com.guideme.model.Guide;
import com.guideme.model.User;
import com.guideme.service.BookingService;
import com.guideme.service.GuideService;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/booking")
public class BookingController {

	@Resource
	private BookingService bookingService;
	@Resource
	private GuideService guideService;

	@PostMapping
	public String saveExcursion(
			@ModelAttribute("booking") BookingDto bookingDto){
		bookingService.addBooking(bookingDto);
		return "redirect:/excursions/" + bookingDto.getExcursionId();
	}

	@GetMapping("/{guideId}")
	public String getBookingsOfGuide(
			@AuthenticationPrincipal User user,
			@PathVariable Long guideId){
				Guide foundGuide = guideService.findByEmail(user.getEmail());
				List<Booking> bookingList = bookingService.getByGuide(foundGuide.getGuideId());
				return "main";
	}
}
