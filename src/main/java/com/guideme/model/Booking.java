package com.guideme.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Booking {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long bookingId;
	@Column(nullable = false)
	private Integer touristAmount;
	@Column(nullable = false)
	private Integer totalPrice;
	@Column(nullable = false)
	private Date bookingDate;
	@Column (nullable = false)
	private Boolean isConfirmed;
	private Boolean isCanceled;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "excursion_id", nullable = false)
	private Excursion excursion;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "tourist_id", nullable = false)
	private Tourist tourist;
}
