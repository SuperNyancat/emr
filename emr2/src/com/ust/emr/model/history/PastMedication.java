package com.ust.emr.model.history;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ih_pastmeds_details")
public class PastMedication {
	private Long id;
	private String drug;
	private String length;
	private String isHelpful;
	private String reactions;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@Column(name = "drug")
	public String getDrug() {
		return drug;
	}

	@Column(name = "length")
	public String getLength() {
		return length;
	}

	@Column(name = "isHelpful")
	public String getIsHelpful() {
		return isHelpful;
	}

	@Column(name = "reactions")
	public String getReactions() {
		return reactions;
	}

	/**
	 * setters
	 * */

	public void setId(Long id) {
		this.id = id;
	}

	public void setDrug(String drug) {
		this.drug = drug;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public void setIsHelpful(String isHelpful) {
		this.isHelpful = isHelpful;
	}

	public void setReactions(String reactions) {
		this.reactions = reactions;
	}

}
