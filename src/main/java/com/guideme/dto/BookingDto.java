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
public class BookingDto {
	private Integer peopleAmount;
	private Integer totalPrice;
	private Date bookingDate;
	private Long excursionId;
	private Long touristId;
}
