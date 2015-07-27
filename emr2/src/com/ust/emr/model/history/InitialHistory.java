package com.ust.emr.model.history;

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

import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;

@Entity
@Table(name = "ih_initial_history")
public class InitialHistory {
	private Long id;
	private RevisionHistory revisionHistory;
	private Patient patient;

	private GeneralInfo generalInfo;
	private RheumaHistory rheumaHistory;
	private SystemsReview systemsReview;
	private SocialHistory socialHistory;
	private MedicalHistory medicalHistory;
	private PreviousOperations previousOperations;
	private FamilyHistory familyHistory;
	private PresentMedications presentMedications;
	private PastMedications pastMedications;
	private Activities activities;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "revisionHistory_id")
	public RevisionHistory getRevisionHistory() {
		return revisionHistory;
	}

	@ManyToOne
	@JoinColumn(name = "patient_id", nullable = false)
	public Patient getPatient() {
		return patient;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "generalInfo_id")
	public GeneralInfo getGeneralInfo() {
		return generalInfo;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "rheumaHistory_id")
	public RheumaHistory getRheumaHistory() {
		return rheumaHistory;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "systemsReview_id")
	public SystemsReview getSystemsReview() {
		return systemsReview;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "socialHistory_id")
	public SocialHistory getSocialHistory() {
		return socialHistory;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "medicalHistory_id")
	public MedicalHistory getMedicalHistory() {
		return medicalHistory;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "previousOperations_id")
	public PreviousOperations getPreviousOperations() {
		return previousOperations;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "familyHistory_id")
	public FamilyHistory getFamilyHistory() {
		return familyHistory;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "medication_id")
	public PresentMedications getPresentMedications() {
		return presentMedications;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "pastMedications_id")
	public PastMedications getPastMedications() {
		return pastMedications;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "activities_id")
	public Activities getActivities() {
		return activities;
	}

	/**
	 * setters
	 * */

	public void setId(Long id) {
		this.id = id;
	}

	public void setRevisionHistory(RevisionHistory revisionHistory) {
		this.revisionHistory = revisionHistory;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public void setGeneralInfo(GeneralInfo generalInfo) {
		this.generalInfo = generalInfo;
	}

	public void setRheumaHistory(RheumaHistory rheumaHistory) {
		this.rheumaHistory = rheumaHistory;
	}

	public void setSystemsReview(SystemsReview systemsReview) {
		this.systemsReview = systemsReview;
	}

	public void setSocialHistory(SocialHistory socialHistory) {
		this.socialHistory = socialHistory;
	}

	public void setMedicalHistory(MedicalHistory medicalHistory) {
		this.medicalHistory = medicalHistory;
	}

	public void setPreviousOperations(PreviousOperations previousOperations) {
		this.previousOperations = previousOperations;
	}

	public void setFamilyHistory(FamilyHistory familyHistory) {
		this.familyHistory = familyHistory;
	}

	public void setPresentMedications(PresentMedications presentMedications) {
		this.presentMedications = presentMedications;
	}

	public void setPastMedications(PastMedications pastMedications) {
		this.pastMedications = pastMedications;
	}

	public void setActivities(Activities activities) {
		this.activities = activities;
	}

}
