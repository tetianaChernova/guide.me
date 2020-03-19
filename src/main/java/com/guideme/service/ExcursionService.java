package com.guideme.service;

import com.guideme.dto.ExcursionDto;
import com.guideme.model.Excursion;
import com.guideme.model.Guide;
import com.guideme.repos.ExcursionRepo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ExcursionService {

	@Resource
	private ExcursionRepo excursionRepo;

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

	public Iterable<Excursion> findAll() {
		return excursionRepo.findAll();
	}

	public Excursion findByExcursionId(Long id){ return excursionRepo.findByExcursionId(id);}

	public Iterable<Excursion> findByCityLike(String city) {
		return excursionRepo.findByCityContainingIgnoreCase(city);
	}

	public List<Excursion> findByGuide(Guide guide) {
		return excursionRepo.findByGuide(guide);
	}
}
