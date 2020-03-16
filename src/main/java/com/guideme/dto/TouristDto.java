package com.guideme.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TouristDto extends FileConsistingDto{
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String city;
	private String nationality;
	private String password;
	private String password2;
}

