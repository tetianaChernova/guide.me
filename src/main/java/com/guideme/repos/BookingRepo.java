package com.guideme.repos;

import com.guideme.model.Booking;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;

public interface BookingRepo extends CrudRepository<Booking, Long> {

	Booking findBookingByBookingId(Long id);

	List<Booking> findByExcursion_GuideGuideId(Long id);

	List<Booking> findByExcursion_GuideGuideIdAndIsConfirmedIsTrueAndBookingDateIsGreaterThanEqual(Long id, Date date);

	List<Booking> findByExcursion_GuideGuideIdAndIsConfirmedIsTrueAndBookingDateIsLessThan(Long id, Date date);

	List<Booking> findByExcursion_GuideGuideIdAndIsConfirmedIsFalseAndBookingDateIsGreaterThanEqual(Long id, Date date);

	List<Booking> findByExcursion_GuideGuideIdAndIsConfirmedIsFalseAndBookingDateIsLessThan(Long id, Date date);

	@Modifying
	@Query(value = "update Booking b set b.isConfirmed = true where b.bookingId = :id")
	void confirmBooking(@Param("id") Long id);

}
