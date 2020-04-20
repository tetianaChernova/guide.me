package com.guideme.service;

import com.guideme.dto.GuideDto;
import com.guideme.dto.ProfileEditDto;
import com.guideme.model.Guide;

public interface GuideService {
	boolean addGuide(GuideDto guideDto);

	Guide findByGuideId(Long id);

	Guide findByEmail(String email);

	void updateGuide(ProfileEditDto profileEditDto, Guide guide);
}
