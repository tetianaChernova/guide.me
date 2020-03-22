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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
			@ModelAttribute("booking") BookingDto bookingDto) {
		bookingService.addBooking(bookingDto);
		return "redirect:/excursions/" + bookingDto.getExcursionId();
	}

	@GetMapping
	public String getBookingsOfGuide(
			@AuthenticationPrincipal User user,
			Model model) {
		Guide foundGuide = guideService.findByEmail(user.getEmail());
		List<Booking> bookingList = bookingService.getByGuide(foundGuide.getGuideId());
		model.addAttribute("bookingList", bookingList);
		model.addAttribute("user", user);
		return "bookingPage";
	}
}
