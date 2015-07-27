package com.ust.emr.model.history;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "ih_gen_info")
public class GeneralInfo {
	private Long id;
	private String referredBy_RB;
	private String referredBy;
	private String physicianName;
	private String orthoSurgeon_RB;
	private String orthoSurgeonName;
	private String symptoms;
	private LocalDate dateOfSymptoms;
	private String diagnosis;
	private String previousTreatment;
	private String otherPractitioners;
	private String[] pain;
	private String otherPain;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@Column(name = "referredBy_RB")
	public String getReferredBy_RB() {
		return referredBy_RB;
	}

	@Column(name = "referredBy")
	public String getReferredBy() {
		return referredBy;
	}

	@Column(name = "physicianName")
	public String getPhysicianName() {
		return physicianName;
	}

	@Column(name = "orthoSurgeon_RB")
	public String getOrthoSurgeon_RB() {
		return orthoSurgeon_RB;
	}

	@Column(name = "orthoSurgeonName")
	public String getOrthoSurgeonName() {
		return orthoSurgeonName;
	}

	@Column(name = "symptoms")
	public String getSymptoms() {
		return symptoms;
	}

	@Column(name = "dateOfSymptoms")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalDate")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	public LocalDate getDateOfSymptoms() {
		return dateOfSymptoms;
	}

	@Column(name = "diagnosis")
	public String getDiagnosis() {
		return diagnosis;
	}

	@Column(name = "previousTreatment")
	public String getPreviousTreatment() {
		return previousTreatment;
	}

	@Column(name = "otherPractitioners")
	public String getOtherPractitioners() {
		return otherPractitioners;
	}
	
	@Column(name = "pain")
	public String[] getPain() {
		return pain;
	}
	@Column(name = "otherPain")
	public String getOtherPain() {
		return otherPain;
	}

	public void setPain(String[] pain) {
		this.pain = pain;
	}

	public void setOtherPain(String otherPain) {
		this.otherPain = otherPain;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setReferredBy_RB(String referredBy_RB) {
		this.referredBy_RB = referredBy_RB;
	}

	public void setReferredBy(String referredBy) {
		this.referredBy = referredBy;
	}

	public void setPhysicianName(String physicianName) {
		this.physicianName = physicianName;
	}

	public void setOrthoSurgeon_RB(String orthoSurgeon_RB) {
		this.orthoSurgeon_RB = orthoSurgeon_RB;
	}

	public void setOrthoSurgeonName(String orthoSurgeonName) {
		this.orthoSurgeonName = orthoSurgeonName;
	}

	public void setSymptoms(String symptoms) {
		this.symptoms = symptoms;
	}

	public void setDateOfSymptoms(LocalDate dateOfSymptoms) {
		this.dateOfSymptoms = dateOfSymptoms;
	}

	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}

	public void setPreviousTreatment(String previousTreatment) {
		this.previousTreatment = previousTreatment;
	}

	public void setOtherPractitioners(String otherPractitioners) {
		this.otherPractitioners = otherPractitioners;
	}

}
