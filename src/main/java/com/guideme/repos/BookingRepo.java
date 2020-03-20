package com.guideme.repos;

import com.guideme.model.Booking;
import org.springframework.data.repository.CrudRepository;

public interface BookingRepo extends CrudRepository<Booking, Long> {
}
