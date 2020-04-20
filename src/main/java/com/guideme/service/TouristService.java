package com.guideme.service;

import com.guideme.dto.ProfileEditDto;
import com.guideme.dto.TouristDto;
import com.guideme.model.Tourist;
import com.guideme.repos.TouristRepo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class TouristService {

	@Resource
	private UserService userService;
	@Resource
	private TouristRepo touristRepo;

	public boolean addTourist(TouristDto touristDto) {
		Tourist tourist = Tourist.builder()
				.email(touristDto.getEmail())
				.phone(touristDto.getPhone())
				.firstName(touristDto.getFirstName())
				.lastName(touristDto.getLastName())
				.city(touristDto.getCity())
				.nationality(touristDto.getNationality())
				.filename(touristDto.getFilename())
				.build();
		if (!userService.addTourist(touristDto)) {
			return false;
		}
		touristRepo.save(tourist);
		return true;
	}

	public Tourist findByTouristId(Long id) {
		return touristRepo.findByTouristId(id);
	}

	public Tourist findByEmail(String email) {
		return touristRepo.findByEmail(email);
	}

	public void updateTourist(ProfileEditDto profileEditDto, Tourist tourist) {
		tourist.setFirstName(profileEditDto.getFirstName());
		tourist.setLastName(profileEditDto.getLastName());
		tourist.setPhone(profileEditDto.getPhone());
		tourist.setCity(profileEditDto.getCity());
		tourist.setNationality(profileEditDto.getNationality());
		tourist.setFilename(profileEditDto.getFilename());
		touristRepo.save(tourist);
	}
}
