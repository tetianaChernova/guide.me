package com.guideme.service;

import com.guideme.model.User;
import com.guideme.repos.UserRepo;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import static java.util.Objects.isNull;

@Service
public class UserService implements UserDetailsService {

	@Resource
	private UserRepo userRepo;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		User foundCreds = userRepo.findByEmail(email);
		if (isNull(foundCreds)) {
			throw new UsernameNotFoundException(email);
		}
		return new User(foundCreds.getEmail(), foundCreds.getPassword(), foundCreds.isActive(), foundCreds.getRole());
	}
}
