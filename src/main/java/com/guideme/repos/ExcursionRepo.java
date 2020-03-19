package com.guideme.repos;

import com.guideme.model.Excursion;
import com.guideme.model.Guide;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ExcursionRepo extends CrudRepository<Excursion, String> {
	Excursion findByExcursionId(Long id);

	List<Excursion> findByCityContainingIgnoreCase(String city);

	List<Excursion> findByGuide(Guide guide);
}
