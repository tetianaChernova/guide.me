package com.guideme.repos;

import com.guideme.model.Excursion;
import com.guideme.model.Guide;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ExcursionRepo extends CrudRepository<Excursion, String> {
	List<Excursion> findByExcursionId(String id);

	List<Excursion> findByCityContainingIgnoreCase(String city);

	List<Excursion> findByGuide(Guide guide);
}
