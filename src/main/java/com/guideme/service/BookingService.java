package com.guideme.service;

import com.guideme.dto.BookingDto;
import com.guideme.model.Booking;
import com.guideme.repos.BookingRepo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

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
}
