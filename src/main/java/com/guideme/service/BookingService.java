package com.guideme.service;

import com.guideme.dto.BookingDto;
import com.guideme.model.Booking;
import com.guideme.model.Tourist;

import java.util.List;

public interface BookingService {
	void addBooking(BookingDto bookingDto);

	List<Booking> getByGuide(Long id);

	List<Booking> getGuidePastBookings(Long id);

	List<Booking> getGuideFutureBookings(Long id);

	List<Booking> getGuideNotConfirmedBookings(Long id);

	List<Booking> getGuideExpiredBookings(Long id);

	void confirmBooking(Tourist tourist, String messageDetails, Long id);

	void cancelBooking(Tourist tourist, String messageDetails, Long id);


}
