package com.guideme.dto;

import com.guideme.model.Guide;
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
public class ExcursionDto extends FileConsistingDto {

	private String title;
	@Length(max = 2048, message = "Description is too long")
	private String description;
	private Integer amount;
	private Integer durationHours;
	private Integer durationMinutes;
	private Integer price;
	private String city;
	private Guide guide;
	private String meetingPoint;
}
