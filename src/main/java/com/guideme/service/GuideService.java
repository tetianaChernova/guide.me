package com.guideme.service;

import com.guideme.dto.GuideDto;
import com.guideme.dto.ProfileEditDto;
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
				.description(guideDto.getDescription())
				.city(guideDto.getCity())
				.nationality(guideDto.getNationality())
				.filename(guideDto.getFilename())
				.build();
		if (!userService.addGuide(guideDto)) {
			return false;
		}
		guideRepo.save(guide);
		return true;
	}

	public Guide findByGuideId(Long id) {
		return guideRepo.findByGuideId(id);
	}

	public Guide findByEmail(String email) {
		return guideRepo.findByEmail(email);
	}

	public void updateGuide(ProfileEditDto profileEditDto, Guide guide) {
		guide.setFirstName(profileEditDto.getFirstName());
		guide.setLastName(profileEditDto.getLastName());
		guide.setPhone(profileEditDto.getPhone());
		guide.setCity(profileEditDto.getCity());
		guide.setNationality(profileEditDto.getNationality());
		guide.setDescription(profileEditDto.getDescription());
		guide.setExperience(profileEditDto.getExperience());
		guide.setFilename(profileEditDto.getFilename());
		guideRepo.save(guide);
	}
}
