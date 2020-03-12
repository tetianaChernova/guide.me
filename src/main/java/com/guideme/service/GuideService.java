package com.guideme.service;

import com.guideme.dto.GuideDto;
import com.guideme.model.Guide;
import com.guideme.repos.GuideRepo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class GuideService {
	@Resource
	private UserService userService;
	@Resource
	private GuideRepo guideRepo;

	public boolean addGuide(GuideDto guideDto) {
		Guide guide = Guide.builder()
				.email(guideDto.getEmail())
				.phone(guideDto.getPhone())
				.firstName(guideDto.getFirstName())
				.lastName(guideDto.getLastName())
				.birthDate(guideDto.getBirthDate())
				.gender(guideDto.getGender())
				.experience(guideDto.getExperience())
				.rating((double) 0)
				.city(guideDto.getCity())
				.nationality(guideDto.getNationality())
				.build();
		if (!userService.addGuide(guideDto)) {
			return false;
		}
		guideRepo.save(guide);
		return true;
	}
}
