package com.guideme.controller;

import com.guideme.dto.BookingDto;
import com.guideme.dto.BookingResponseDto;
import com.guideme.model.Booking;
import com.guideme.model.Guide;
import com.guideme.model.Tourist;
import com.guideme.model.User;
import com.guideme.service.BookingService;
import com.guideme.service.GuideService;
import com.guideme.service.TouristService;
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
	@Resource
	private TouristService touristService;

	@PostMapping
	public String saveBooking(
			@ModelAttribute("booking") BookingDto bookingDto) {
		bookingService.addBooking(bookingDto);
		return "redirect:/excursions/" + bookingDto.getExcursionId();
	}

	@GetMapping
	public String getBookingsOfGuide(
			@AuthenticationPrincipal User user,
			Model model) {
		Guide foundGuide = guideService.findByEmail(user.getEmail());
		List<Booking> notConfirmedBookings = bookingService.getGuideNotConfirmedBookings(foundGuide.getGuideId());
		List<Booking> futureBookings = bookingService.getGuideFutureBookings(foundGuide.getGuideId());
		List<Booking> pastBookings = bookingService.getGuidePastBookings(foundGuide.getGuideId());
		List<Booking> expiredBookings = bookingService.getGuideExpiredBookings(foundGuide.getGuideId());
		model.addAttribute("futureBookings", futureBookings);
		model.addAttribute("notConfirmedBookings", notConfirmedBookings);
		model.addAttribute("pastBookings", pastBookings);
		model.addAttribute("expiredBookings", expiredBookings);
		model.addAttribute("user", user);
		return "bookingPage";
	}

	@PostMapping("/confirm")
	public String confirmBooking(
			BookingResponseDto bookingResponseDto) {
		Tourist tourist = touristService.findByTouristId(bookingResponseDto.getTouristId());
		bookingService.confirmBooking(tourist, bookingResponseDto.getMessage(), bookingResponseDto.getBookingId());
		return "redirect:/booking";
	}


	@PostMapping("/cancel")
	public String cancelBooking(
			BookingResponseDto bookingResponseDto) {
		Tourist tourist = touristService.findByTouristId(bookingResponseDto.getTouristId());
		bookingService.cancelBooking(tourist, bookingResponseDto.getMessage(), bookingResponseDto.getBookingId());
		return "redirect:/booking";
	}
}
