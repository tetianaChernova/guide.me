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
public class GuideDto {
	private String firstName;
	private String lastName;
	private String email;
	private String gender;
	private Date birthDate;
	private String city;
	private String nationality;
	private Integer experience;
	private String password;
}

//{
//		"firstName": "tetiana",
//		"lastName": "chernova",
//		"email": "test@gmail.com",
//		"gender": "Female",
//		"birthDate": "23-01-2000",
//		"city": "Kyiv",
//		"nationality": "ukr",
//		"experience": "",
//		"password": "123"
//		}
