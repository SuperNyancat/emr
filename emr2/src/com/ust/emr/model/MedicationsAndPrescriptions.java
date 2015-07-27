package com.ust.emr.model;

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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "tbl_presc_med")
public class MedicationsAndPrescriptions {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;
	private List<Medication> medications;

	private String PTRNumber;
	private String prescriptionDetails;

	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_pres_med")
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

	@Column(name = "fld_ptr_num")
	public String getPTRNumber() {
		return PTRNumber;
	}

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "tbl_presMed_medicines", joinColumns = { @JoinColumn(name = "presMed_id") }, inverseJoinColumns = { @JoinColumn(name = "medications_id") })
	@Fetch(value = FetchMode.SUBSELECT)
	public List<Medication> getMedications() {
		return medications;
	}

	@Column(name = "fld_prescription_details")
	public String getPrescriptionDetails() {
		return prescriptionDetails;
	}

	/**
	 * SETTERS
	 * */

	public void setMedications(List<Medication> medications) {
		this.medications = medications;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setPTRNumber(String pTRNumber) {
		PTRNumber = pTRNumber;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public void setRevisionHistory(RevisionHistory revisionHistory) {
		this.revisionHistory = revisionHistory;
	}

	public void setPrescriptionDetails(String prescriptionDetails) {
		this.prescriptionDetails = prescriptionDetails;
	}
}
