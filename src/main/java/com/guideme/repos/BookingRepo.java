package com.guideme.repos;

import com.guideme.model.Booking;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BookingRepo extends CrudRepository<Booking, Long> {

	List<Booking> findByExcursion_GuideGuideId(Long id);
}
