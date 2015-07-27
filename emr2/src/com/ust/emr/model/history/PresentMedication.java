package com.ust.emr.model.history;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ih_present_meds_details")
public class PresentMedication {
	private Long id;
	private String name;
	private String dose;
	private String duration;
	private String isHelpful;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@Column(name = "name")
	public String getName() {
		return name;
	}

	@Column(name = "dose")
	public String getDose() {
		return dose;
	}

	@Column(name = "duration")
	public String getDuration() {
		return duration;
	}

	@Column(name = "isHelpful")
	public String getIsHelpful() {
		return isHelpful;
	}

	/**
	 * SETTERS
	 * */
	public void setId(Long id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setDose(String dose) {
		this.dose = dose;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public void setIsHelpful(String isHelpful) {
		this.isHelpful = isHelpful;
	}

}
