package com.guideme.service;

import com.guideme.dto.ExcursionDto;
import com.guideme.model.Excursion;
import com.guideme.model.Guide;

import java.util.List;

public interface ExcursionService {
	Excursion save(ExcursionDto excursionDto);

	Iterable<Excursion> findAll();

	Excursion findByExcursionId(Long id);

	Iterable<Excursion> findByCityLike(String city);

	List<Excursion> findByGuide(Guide guide);

	List<Excursion> findPersonalExcursionsByGuide(Guide guide);

	List<Excursion> getMostVisitedExcursions(Guide guide);

	void updateExcursion(ExcursionDto excursionDto, Excursion excursionFound);

	void deleteExcursionByExcursionId(Long excursionId);

}
