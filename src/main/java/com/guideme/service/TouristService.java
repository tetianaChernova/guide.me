package com.guideme.service;

import com.guideme.dto.ProfileEditDto;
import com.guideme.dto.TouristDto;
import com.guideme.model.Tourist;

public interface TouristService {
	boolean addTourist(TouristDto touristDto);

	Tourist findByTouristId(Long id);

	Tourist findByEmail(String email);

	void updateTourist(ProfileEditDto profileEditDto, Tourist tourist);
}
