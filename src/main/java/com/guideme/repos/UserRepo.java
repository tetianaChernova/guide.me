package com.guideme.repos;

import com.guideme.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, String> {
	User findByEmail(String email);
}
