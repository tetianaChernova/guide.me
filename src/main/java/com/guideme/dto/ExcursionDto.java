package com.guideme.dto;

import com.guideme.model.Guide;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ExcursionDto extends FileConsistingDto {
	private String title;
	@Length(max = 2048, message = "Description is too long")
	@Length(min = 500, message = "Description is too short, it must contains minimum 500 symbols")
	private String description;
	@Positive
	private Integer amount;
	@Min(value = 0, message = "Duration hours should not be less than 0 hours")
	@Max(value = 24, message = "Duration hours should not be greater than 24 hours")
	private Integer durationHours;
	@Min(value = 0, message = "Duration minutes should not be less than 0")
	@Max(value = 60, message = "Duration minutes should not be greater than 60")
	private Integer durationMinutes;
	@Positive
	private Integer price;
	private String city;
	private Guide guide;
	private String meetingPoint;
}
