package com.guideme.service;

import com.guideme.dto.ExcursionDto;
import com.guideme.model.Excursion;
import com.guideme.repos.ExcursionRepo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ExcursionService {

	@Resource
	private ExcursionRepo excursionRepo;

	public Excursion save(ExcursionDto excursionDto){
		Excursion excursion = Excursion.builder()
				.title(excursionDto.getTitle())
//				.guide(16)
				.description(excursionDto.getDescription())
				.amount(excursionDto.getAmount())
				.city(excursionDto.getCity())
				.priceForOne(excursionDto.getPrice())
				.duration(excursionDto.getDuration())
				.filename(excursionDto.getFilename())
				.build();
		return excursionRepo.save(excursion);
	}

	public Iterable<Excursion> findAll() {
		return excursionRepo.findAll();
	}

	public Iterable<Excursion> findByCityLike(String city){
		return excursionRepo.findByCityContainingIgnoreCase(city);
	}
}
