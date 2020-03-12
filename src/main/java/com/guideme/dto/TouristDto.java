package com.guideme.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Transient;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TouristDto {
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String city;
	private String nationality;
	private String password;
	@Transient
	private String password2;
}

