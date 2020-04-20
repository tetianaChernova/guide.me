package com.guideme.service.impl;

import com.guideme.dto.ProfileEditDto;
import com.guideme.dto.TouristDto;
import com.guideme.model.Tourist;
import com.guideme.repos.TouristRepo;
import com.guideme.service.TouristService;
import com.guideme.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class DefaultTouristService implements TouristService {

	@Resource
	private UserService userService;
	@Resource
	private TouristRepo touristRepo;

	@Override
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

	@Override
	public Tourist findByTouristId(Long id) {
		return touristRepo.findByTouristId(id);
	}

	@Override
	public Tourist findByEmail(String email) {
		return touristRepo.findByEmail(email);
	}

	@Override
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
