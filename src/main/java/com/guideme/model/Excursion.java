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
import javax.persistence.OneToMany;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Excursion {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long excursionId;
	@Column(nullable = false)
	private String title;
	@Column(nullable = false)
	private String city;
	@Column(nullable = false)
	private Integer duration;
	@Column(nullable = false)
	private Integer priceForOne;
	@Column(nullable = false, length = 2048)
	private String description;
	@Column(nullable = false)
	private Integer amount;
	@Column(nullable = false)
	private String meetingPoint;
	private String filename;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "guide_id", nullable = false)
	private Guide guide;

	@OneToMany(mappedBy = "excursion")
	private Set<Booking> bookings;
}
