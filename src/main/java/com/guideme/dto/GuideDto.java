package com.guideme.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Transient;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class GuideDto {
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
	@Transient
	private String password2;
}
