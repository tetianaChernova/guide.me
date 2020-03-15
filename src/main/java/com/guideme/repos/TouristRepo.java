package com.guideme.repos;

import com.guideme.model.Tourist;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TouristRepo extends CrudRepository<Tourist, Long> {
	List<Tourist> findByEmail(String email);
}
