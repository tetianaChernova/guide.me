package com.guideme.service.impl;

import com.guideme.dto.ExcursionDto;
import com.guideme.model.Excursion;
import com.guideme.model.Guide;
import com.guideme.repos.ExcursionRepo;
import com.guideme.service.ExcursionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DefaultExcursionService implements ExcursionService {

	@Resource
	private ExcursionRepo excursionRepo;

	@Override
	public Excursion save(ExcursionDto excursionDto) {
		Excursion excursion = Excursion.builder()
				.title(excursionDto.getTitle())
				.guide(excursionDto.getGuide())
				.description(excursionDto.getDescription())
				.amount(excursionDto.getAmount())
				.city(excursionDto.getCity())
				.priceForOne(excursionDto.getPrice())
				.duration(excursionDto.getDurationHours() * 60 + excursionDto.getDurationMinutes())
				.filename(excursionDto.getFilename())
				.meetingPoint(excursionDto.getMeetingPoint())
				.build();
		return excursionRepo.save(excursion);
	}

	@Override
	public Iterable<Excursion> findAll() {
		return excursionRepo.findAll();
	}

	@Override
	public Excursion findByExcursionId(Long id) {
		return excursionRepo.findByExcursionId(id);
	}

	@Override
	public Iterable<Excursion> findByCityLike(String city) {
		return excursionRepo.findByCityContainingIgnoreCase(city);
	}

	@Override
	public List<Excursion> findByGuide(Guide guide) {
		return excursionRepo.findByGuide(guide);
	}

	@Override
	public List<Excursion> findPersonalExcursionsByGuide(Guide guide) {
		return excursionRepo.findByGuideAndAmountEquals(guide, 1);
	}

	@Override
	public List<Excursion> getMostVisitedExcursions(Guide guide) {
		return excursionRepo.getMostVisitedExcursions(guide.getGuideId());
	}

	@Override
	public void updateExcursion(ExcursionDto excursionDto, Excursion excursionFound) {
		Excursion excursion = Excursion.builder()
				.excursionId(excursionFound.getExcursionId())
				.title(excursionDto.getTitle())
				.guide(excursionFound.getGuide())
				.description(excursionDto.getDescription())
				.amount(excursionDto.getAmount())
				.city(excursionDto.getCity())
				.priceForOne(excursionDto.getPrice())
				.duration(excursionDto.getDurationHours() * 60 + excursionDto.getDurationMinutes())
				.filename(excursionDto.getFilename())
				.meetingPoint(excursionDto.getMeetingPoint())
				.build();
		excursionRepo.save(excursion);
	}

	@Transactional
	@Override
	public void deleteExcursionByExcursionId(Long excursionId) {
		excursionRepo.deleteByExcursionId(excursionId);
	}
}
