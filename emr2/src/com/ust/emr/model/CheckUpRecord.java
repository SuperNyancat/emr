package com.ust.emr.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_checkup_session")
public class CheckUpRecord {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;

	private String heightFeet;
	private String heightInches;
	private String weight;
	private String symptoms;
	private String reviewOfSystems;

	private String BSA;
	private String BMI;
	private String BP;

	private String subjective;
	private String objective;
	private String assessment;
	private String planning;
	
	
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@ManyToOne
	@JoinColumn(name = "patient_id", nullable = false)
	public Patient getPatient() {
		return patient;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "revisionHistory_id")
	public RevisionHistory getRevisionHistory() {
		return revisionHistory;
	}

	@Column(name = "heightFeet")
	public String getHeightFeet() {
		return heightFeet;
	}

	@Column(name = "heightInches")
	public String getHeightInches() {
		return heightInches;
	}

	@Column(name = "weight")
	public String getWeight() {
		return weight;
	}

	@Column(name = "symptoms")
	public String getSymptoms() {
		return symptoms;
	}

	@Column(name = "reviewOfSystems")
	public String getReviewOfSystems() {
		return reviewOfSystems;
	}

	@Column(name = "subjective")
	public String getSubjective() {
		return subjective;
	}

	@Column(name = "objective")
	public String getObjective() {
		return objective;
	}

	@Column(name = "assessment")
	public String getAssessment() {
		return assessment;
	}

	@Column(name = "planning")
	public String getPlanning() {
		return planning;
	}
	@Column(name = "bsa")
	public String getBSA() {
		return BSA;
	}
	@Column(name = "bmi")
	public String getBMI() {
		return BMI;
	}
	@Column(name = "bp")
	public String getBP() {
		return BP;
	}

	/**
	 * SETTERS
	 * */
	public void setId(Long id) {
		this.id = id;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public void setRevisionHistory(RevisionHistory revisionHistory) {
		this.revisionHistory = revisionHistory;
	}

	public void setHeightFeet(String heightFeet) {
		this.heightFeet = heightFeet;
	}

	public void setHeightInches(String heightInches) {
		this.heightInches = heightInches;
	}

	public void setBSA(String bsa) {
		this.BSA = bsa;
	}

	public void setBMI(String bmi) {
		this.BMI = bmi;
	}

	public void setBP(String bp) {
		this.BP = bp;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public void setSymptoms(String symptoms) {
		this.symptoms = symptoms;
	}

	public void setReviewOfSystems(String reviewOfSystems) {
		this.reviewOfSystems = reviewOfSystems;
	}

	public void setSubjective(String subjective) {
		this.subjective = subjective;
	}

	public void setObjective(String objective) {
		this.objective = objective;
	}

	public void setAssessment(String assessment) {
		this.assessment = assessment;
	}

	public void setPlanning(String planning) {
		this.planning = planning;
	}

}