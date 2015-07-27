package com.ust.emr.model.history;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ih_medical_history")
public class MedicalHistory {
	private Long id;
	private String[] pastProblems;
	private String others;
	private String therapies;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@Column(name = "pastProblems")
	public String[] getPastProblems() {
		return pastProblems;
	}

	@Column(name = "others")
	public String getOthers() {
		return others;
	}

	@Column(name = "therapies")
	public String getTherapies() {
		return therapies;
	}

	/**
	 * setters
	 * */
	public void setId(Long id) {
		this.id = id;
	}

	public void setPastProblems(String[] pastProblems) {
		this.pastProblems = pastProblems;
	}

	public void setOthers(String others) {
		this.others = others;
	}

	public void setTherapies(String therapies) {
		this.therapies = therapies;
	}

}
