package com.ust.emr.model.history;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "ih_present_medications")
public class PresentMedications {
	private Long id;
	private String drugAllergies;
	private String drugAllergyDetails;
	private String reaction;

	List<PresentMedication> presentMedications;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@Column(name = "drugAllergies")
	public String getDrugAllergies() {
		return drugAllergies;
	}

	@Column(name = "drugAllergyDetails")
	public String getDrugAllergyDetails() {
		return drugAllergyDetails;
	}

	@Column(name = "reaction")
	public String getReaction() {
		return reaction;
	}

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "ih_presmeds", joinColumns = { @JoinColumn(name = "pres_id") }, inverseJoinColumns = { @JoinColumn(name = "meds_id") })
	@Fetch(value = FetchMode.SUBSELECT)
	public List<PresentMedication> getPresentMedications() {
		return presentMedications;
	}

	/**
	 * setters
	 * */

	public void setId(Long id) {
		this.id = id;
	}

	public void setDrugAllergies(String drugAllergies) {
		this.drugAllergies = drugAllergies;
	}

	public void setDrugAllergyDetails(String drugAllergyDetails) {
		this.drugAllergyDetails = drugAllergyDetails;
	}

	public void setReaction(String reaction) {
		this.reaction = reaction;
	}

	public void setPresentMedications(List<PresentMedication> presentMedications) {
		this.presentMedications = presentMedications;
	}

}
