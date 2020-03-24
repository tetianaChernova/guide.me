package com.guideme.repos;

import com.guideme.model.Booking;
import org.springframework.data.repository.CrudRepository;

import java.util.Date;
import java.util.List;

public interface BookingRepo extends CrudRepository<Booking, Long> {

	List<Booking> findByExcursion_GuideGuideId(Long id);

	List<Booking> findByExcursion_GuideGuideIdAndIsConfirmedIsTrueAndBookingDateGreaterThan(Long id, Date date);

	List<Booking> findByExcursion_GuideGuideIdAndIsConfirmedIsTrueAndBookingDateLessThan(Long id, Date date);

	List<Booking> findByExcursion_GuideGuideIdAndIsConfirmedIsFalseAndBookingDateGreaterThan(Long id, Date date);

	List<Booking> findByExcursion_GuideGuideIdAndIsConfirmedIsFalse(Long id);

}
