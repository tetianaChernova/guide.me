package com.guideme.repos;

import com.guideme.model.Tourist;
import org.springframework.data.repository.CrudRepository;

public interface TouristRepo extends CrudRepository<Tourist, String> {
}
