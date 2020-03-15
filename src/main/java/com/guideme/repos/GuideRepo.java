package com.guideme.repos;

import com.guideme.model.Guide;
import org.springframework.data.repository.CrudRepository;

import java.util.List;


public interface GuideRepo extends CrudRepository<Guide, Long> {
	List<Guide> findByEmail(String email);
}
