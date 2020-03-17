package com.guideme.dto;

import com.guideme.model.Guide;
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
public class ExcursionDto extends FileConsistingDto {

	private String title;
	private String description;
	private Integer amount;
	private Integer duration;
	private Integer price;
	private String city;
	private Guide guide;
}
