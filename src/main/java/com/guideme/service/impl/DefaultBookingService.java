package com.guideme.service.impl;

import com.guideme.dto.BookingDto;
import com.guideme.model.Booking;
import com.guideme.model.Tourist;
import com.guideme.repos.BookingRepo;
import com.guideme.service.BookingService;
import com.guideme.service.ExcursionService;
import com.guideme.service.MailSender;
import com.guideme.service.TouristService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class DefaultBookingService implements BookingService {

	public static final String BOOKING = "Booking";
	private static final String BOOKING_EMAIL = "Hello, %s %s\n%s";
	public static final String CREATING_BOOKING_MESSAGE_DETAILS = "Thank you for choosing this excursion!\n" +
			"The guide will send you further information after processing your booking";
	@Resource
	private BookingRepo bookingRepo;
	@Resource
	private ExcursionService excursionService;
	@Resource
	private TouristService touristService;
	@Resource
	private MailSender mailSender;

	@Override
	public void addBooking(BookingDto bookingDto) {
		Booking booking = Booking.builder()
				.excursion(excursionService.findByExcursionId(bookingDto.getExcursionId()))
				.tourist(touristService.findByTouristId(bookingDto.getTouristId()))
				.bookingDate(bookingDto.getBookingDate())
				.isConfirmed(false)
				.isCanceled(false)
				.totalPrice(bookingDto.getTotalPrice())
				.touristAmount(bookingDto.getPeopleAmount())
				.build();
		sendMessage(booking.getTourist(), CREATING_BOOKING_MESSAGE_DETAILS);
		bookingRepo.save(booking);
	}

	@Override
	public List<Booking> getByGuide(Long id) {
		return bookingRepo.findByExcursion_GuideGuideId(id);
	}

	@Override
	public List<Booking> getGuideFutureBookings(Long id) {
		return bookingRepo.findByExcursion_GuideGuideIdAndIsConfirmedIsTrueAndBookingDateIsGreaterThanEqual(id, new Date());
	}

	@Override
	public List<Booking> getGuidePastBookings(Long id) {
		return bookingRepo.findByExcursion_GuideGuideIdAndIsConfirmedIsTrueAndBookingDateIsLessThan(id, new Date());
	}

	@Override
	public List<Booking> getGuideNotConfirmedBookings(Long id) {
		return bookingRepo.findByExcursion_GuideGuideIdAndIsConfirmedIsFalseAndIsCanceledIsFalseAndBookingDateIsGreaterThanEqual(id, removeTime(new Date()));
	}

	@Override
	public List<Booking> getGuideExpiredBookings(Long id) {
		return bookingRepo.findByExcursion_GuideGuideIdAndIsConfirmedIsFalseAndIsCanceledIsFalseAndBookingDateIsLessThan(id, new Date());
	}

	@Transactional
	@Override
	public void confirmBooking(Tourist tourist, String messageDetails, Long id) {
		bookingRepo.confirmBooking(id);
		sendMessage(tourist, messageDetails);
	}

	@Transactional
	@Override
	public void cancelBooking(Tourist tourist, String messageDetails, Long id) {
		bookingRepo.cancelBooking(id);
		sendMessage(tourist, messageDetails);
	}

	private void sendMessage(Tourist tourist, String messageDetails) {
		String message = String.format(BOOKING_EMAIL,
				tourist.getFirstName(),
				tourist.getLastName(),
				messageDetails);
		mailSender.send(tourist.getEmail(), BOOKING, message);
	}

	private Date removeTime(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}

}
