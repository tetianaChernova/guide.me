package com.guideme.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.util.Date;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BookingDto {
	@Min(value = 0, message = "Duration minutes should not be less than 0")
	@Max(value = 6, message = "Duration minutes should not be greater than 60")
	private Integer peopleAmount;
	private Integer totalPrice;
	private Date bookingDate;
	private Long excursionId;
	private Long touristId;
}
