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
@Table(name = "ih_past_medications")
public class PastMedications {
	private Long id;
	private String[] NSAIDs;
	private List<PastMedication> pastMedications;
	private String supplements;
	private String clinicalTrials;
	public String clinicalTrials_details;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@Column(name = "NSAIDs")
	public String[] getNSAIDs() {
		return NSAIDs;
	}

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "ih_pastmeds", joinColumns = { @JoinColumn(name = "past_id") }, inverseJoinColumns = { @JoinColumn(name = "meds_id") })
	@Fetch(value = FetchMode.SUBSELECT)
	public List<PastMedication> getPastMedications() {
		return pastMedications;
	}

	@Column(name = "supplements")
	public String getSupplements() {
		return supplements;
	}

	@Column(name = "clinicalTrials")
	public String getClinicalTrials() {
		return clinicalTrials;
	}

	@Column(name = "clinicalTrials_details")
	public String getClinicalTrials_details() {
		return clinicalTrials_details;
	}
	
	/**
	 * SETTERS
	 * */

	public void setClinicalTrials(String clinicalTrials) {
		this.clinicalTrials = clinicalTrials;
	}

	public void setClinicalTrials_details(String clinicalTrials_details) {
		this.clinicalTrials_details = clinicalTrials_details;
	}

	public void setSupplements(String supplements) {
		this.supplements = supplements;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setNSAIDs(String[] nSAIDs) {
		NSAIDs = nSAIDs;
	}

	public void setPastMedications(List<PastMedication> pastMedications) {
		this.pastMedications = pastMedications;
	}

}
