package com.guideme.service;

import com.guideme.dto.GuideDto;
import com.guideme.dto.TouristDto;
import com.guideme.model.Role;
import com.guideme.model.User;
import com.guideme.repos.UserRepo;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import static java.util.Objects.isNull;
import static java.util.Objects.nonNull;

@Service
public class UserService implements UserDetailsService {

	@Resource
	private UserRepo userRepo;
	@Resource
	private PasswordEncoder passwordEncoder;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		User foundCreds = userRepo.findByEmail(email);
		if (isNull(foundCreds)) {
			throw new UsernameNotFoundException(email);
		}
		return new User(foundCreds.getEmail(), foundCreds.getPassword(), foundCreds.isActive(), foundCreds.getRole());
	}

	public boolean addTourist(TouristDto touristDto) {
		User foundUser = userRepo.findByEmail(touristDto.getEmail());
		if (nonNull(foundUser)) {
			return false;
		}
		User user = User.builder()
				.email(touristDto.getEmail())
				.active(true)
				.role(Role.TOURIST)
				.password(passwordEncoder.encode(touristDto.getPassword()))
				.build();
		userRepo.save(user);
//		sendMessage(user);
		return true;
	}

	public boolean addGuide(GuideDto guideDto) {
		User foundUser = userRepo.findByEmail(guideDto.getEmail());
		if (nonNull(foundUser)) {
			return false;
		}
		User user = User.builder()
				.email(guideDto.getEmail())
				.active(true)
				.role(Role.GUIDE)
				.password(passwordEncoder.encode(guideDto.getPassword()))
				.build();
		userRepo.save(user);
//		sendMessage(user);
		return true;
	}

}
