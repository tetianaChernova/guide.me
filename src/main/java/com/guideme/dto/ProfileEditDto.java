package com.guideme.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProfileEditDto extends FileConsistingDto{
	private String firstName;
	private String lastName;
	private String phone;
	private String city;
	private String nationality;
	private Integer experience;
	@Length(max = 2048, message = "Description is too long")
	private String description;
}
