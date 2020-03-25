package com.guideme.repos;

import com.guideme.model.Booking;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

public interface BookingRepo extends CrudRepository<Booking, Long> {

	List<Booking> findByExcursion_GuideGuideId(Long id);

	List<Booking> findByExcursion_GuideGuideIdAndIsConfirmedIsTrueAndBookingDateGreaterThan(Long id, Date date);

	List<Booking> findByExcursion_GuideGuideIdAndIsConfirmedIsTrueAndBookingDateLessThan(Long id, Date date);

	List<Booking> findByExcursion_GuideGuideIdAndIsConfirmedIsFalseAndBookingDateGreaterThan(Long id, Date date);

	List<Booking> findByExcursion_GuideGuideIdAndIsConfirmedIsFalse(Long id);

	@Modifying
	@Query(value = "update Booking b set b.isConfirmed = true where b.bookingId = :id")
	void confirmBooking(@Param("id") Long id);

}
