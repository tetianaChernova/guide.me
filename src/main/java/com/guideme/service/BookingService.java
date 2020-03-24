package com.guideme.service;

import com.guideme.dto.BookingDto;
import com.guideme.model.Booking;
import com.guideme.repos.BookingRepo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class BookingService {

	@Resource
	private BookingRepo bookingRepo;
	@Resource
	private ExcursionService excursionService;
	@Resource
	private TouristService touristService;

	public void addBooking(BookingDto bookingDto) {
		Booking booking = Booking.builder()
				.excursion(excursionService.findByExcursionId(bookingDto.getExcursionId()))
				.tourist(touristService.findByTouristId(bookingDto.getTouristId()))
				.bookingDate(bookingDto.getBookingDate())
				.isConfirmed(false)
				.totalPrice(bookingDto.getTotalPrice())
				.touristAmount(bookingDto.getPeopleAmount())
				.build();
		bookingRepo.save(booking);
	}

	public List<Booking> getByGuide(Long id) {
		return bookingRepo.findByExcursion_GuideGuideId(id);
	}

	public List<Booking> getGuideFutureBookings(Long id) {
		return bookingRepo.findByExcursion_GuideGuideIdAndIsConfirmedIsTrueAndBookingDateGreaterThan(id, new Date());
	}

	public List<Booking> getGuidePastBookings(Long id) {
		return bookingRepo.findByExcursion_GuideGuideIdAndIsConfirmedIsTrueAndBookingDateLessThan(id, new Date());
	}

	public List<Booking> getGuideNotConfirmedBookings(Long id) {
		return bookingRepo.findByExcursion_GuideGuideIdAndIsConfirmedIsFalse(id);
	}

	public List<Booking> getGuideNotConfirmedFutureBookings(Long id) {
		return bookingRepo.findByExcursion_GuideGuideIdAndIsConfirmedIsFalseAndBookingDateGreaterThan(id, new Date());
	}
}
