package com.guideme.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.util.List;

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
	@Column(nullable = false)
	private String description;
	@Column(nullable = false)
	private Integer amount;
	private String filename;

	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name = "excursion_language", joinColumns = @JoinColumn(name = "excursion_id"))
	private List<String> languages;

	@ElementCollection(fetch = FetchType.LAZY)
	@CollectionTable(name = "excursion_sightseeings", joinColumns = @JoinColumn(name = "excursion_id"))
	private List<String> sightseeings;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "guide_id", nullable = false)
	private Guide guide;
}
