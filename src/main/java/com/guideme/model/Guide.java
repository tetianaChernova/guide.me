package com.guideme.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import java.util.Date;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
public class Guide {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long guideId;
	@Column(nullable = false)
	private String email;
	@Column(nullable = false)
	private String phone;
	@Column(nullable = false)
	private String firstName;
	@Column(nullable = false)
	private String lastName;
	@Column(nullable = false)
	private Date birthDate;
	@Column(nullable = false)
	private String gender;
	@Column(nullable = false)
	private Integer experience;
	@Column(nullable = false)
	private Double rating;
	@Column(nullable = false)
	private String nationality;
	@Column(nullable = false)
	private String city;
	private String filename;
	@Column(nullable = false, length = 2048)
	private String description;
	@OneToMany(mappedBy = "guide")
	private Set<Excursion> excursions;
}
