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
import java.util.UUID;

import static java.util.Objects.isNull;
import static java.util.Objects.nonNull;

@Service
public class UserService implements UserDetailsService {

	public static final String ACTIVATION_CODE = "Activation code";
	public static final String ACTIVATION_EMAIL = "Hello, %s \n" +
			"Welcome to GuideMe. Please, visit next link: " +
			"http://localhost:8081/registration/activate/%s";
	@Resource
	private UserRepo userRepo;
	@Resource
	private PasswordEncoder passwordEncoder;
	@Resource
	private MailSender mailSender;

	public User findByEmail(String email) {
		return userRepo.findByEmail(email);
	}

//	;

//	public User save(String email) {
//		return userRepo.findByEmail(email);
//	}
//
//	;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		User foundCreds = userRepo.findByEmail(email);
		if (isNull(foundCreds)) {
			throw new UsernameNotFoundException(email);
		}
		return new User(foundCreds.getEmail(), foundCreds.getPassword(), foundCreds.isActive(),
				foundCreds.getActivationCode(), foundCreds.getRole());
	}

	public boolean addTourist(TouristDto touristDto) {
		User foundUser = userRepo.findByEmail(touristDto.getEmail());
		if (nonNull(foundUser)) {
			return false;
		}
		User user = saveUser(touristDto.getEmail(), Role.TOURIST, touristDto.getPassword());
		userRepo.save(user);
		sendMessage(user);

		return true;
	}

	public boolean addGuide(GuideDto guideDto) {
		User foundUser = userRepo.findByEmail(guideDto.getEmail());
		if (nonNull(foundUser)) {
			return false;
		}
		User user = saveUser(guideDto.getEmail(), Role.GUIDE, guideDto.getPassword());
		sendMessage(user);
		return true;
	}

	public User saveUser(String email, Role role, String password) {
		User user = User.builder()
				.email(email)
				.active(false)
				.activationCode(UUID.randomUUID().toString())
				.role(role)
				.password(passwordEncoder.encode(password))
				.build();
		 return userRepo.save(user);
	}

	public boolean activateUser(String code) {

		User user = userRepo.findByActivationCode(code);
		if (isNull(user)) {
			return false;
		}
		user.setActive(true);
		user.setActivationCode(null);
		userRepo.save(user);
		return true;
	}

	private void sendMessage(User user) {
		String message = String.format(ACTIVATION_EMAIL,
				user.getUsername(),
				user.getActivationCode());
		mailSender.send(user.getEmail(), ACTIVATION_CODE, message);
	}
}
