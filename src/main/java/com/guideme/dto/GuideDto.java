package com.guideme.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GuideDto extends FileConsistingDto{
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String gender;
	private Date birthDate;
	private String city;
	private String nationality;
	private Integer experience;
	private String password;
	private String password2;
}
