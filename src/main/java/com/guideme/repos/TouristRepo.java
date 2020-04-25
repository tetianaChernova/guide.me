package com.guideme.repos;

import com.guideme.model.Tourist;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface TouristRepo extends CrudRepository<Tourist, Long> {

	Tourist findByEmail(String email);

	Tourist findByTouristId(Long id);

	@Query(nativeQuery = true, value = """
			SELECT COUNT(*)
			FROM booking 
			WHERE tourist_id = :touristId
			AND is_confirmed = TRUE 
			""")
	Integer getConfirmedBookingNum(@Param("touristId") Long touristId);
}
