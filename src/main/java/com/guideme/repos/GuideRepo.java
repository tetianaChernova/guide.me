package com.guideme.repos;

import com.guideme.model.Guide;
import org.springframework.data.repository.CrudRepository;


public interface GuideRepo extends CrudRepository<Guide, Long> {
	Guide findByEmail(String email);
	Guide findByGuideId(Long id);
}
