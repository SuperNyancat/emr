package com.ust.emr.model.forms;

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

import com.ust.emr.model.Comment;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;

@Entity
@Table(name = "form_inflammatory_myopath_flow_sheet")
public class InflammatoryMyopathFlowSheet {

	private Long id;
	private Patient patient; // name, age
	private RevisionHistory revisionHistory; // date

	// general fields
	private String weight;
	private String bloodPressure;

	// Labs or other data
	private String HgbOrHct;
	private String WBCOPlatelet;
	private String ESR;
	private String ALTOrAST;
	private String SLDH;
	private String TCKorCKMM;
	private String otherData;

	// clinical data
	private String clinicalData;

	// self assessment
	private String VAS;

	// meds/plans
	private String plans;

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

	@Column(name = "Weight")
	public String getWeight() {
		return weight;
	}

	@Column(name = "BloodPressure")
	public String getBloodPressure() {
		return bloodPressure;
	}

	@Column(name = "HgbOrHct")
	public String getHgbOrHct() {
		return HgbOrHct;
	}

	@Column(name = "WBCOPlatelet")
	public String getWBCOPlatelet() {
		return WBCOPlatelet;
	}

	@Column(name = "ESR")
	public String getESR() {
		return ESR;
	}

	@Column(name = "ALTOrAST")
	public String getALTOrAST() {
		return ALTOrAST;
	}

	@Column(name = "SLDH")
	public String getSLDH() {
		return SLDH;
	}

	@Column(name = "TCKorCKMM")
	public String getTCKorCKMM() {
		return TCKorCKMM;
	}

	@Column(name = "OtherData")
	public String getOtherData() {
		return otherData;
	}

	@Column(name = "ClinicalData")
	public String getClinicalData() {
		return clinicalData;
	}

	@Column(name = "VAS")
	public String getVAS() {
		return VAS;
	}

	@Column(name = "Plans")
	public String getPlans() {
		return plans;
	}

	// @OneToMany(fetch = FetchType.LAZY)
	// @JoinTable(name = "meds_inflammatoryMyopath", joinColumns = {
	// @JoinColumn(name
	// = "inflammatoryMyopath_id") }, inverseJoinColumns = { @JoinColumn(name =
	// "medicine_id")
	// })
	// public List<Medication> getMedicines() {
	// return medicines;
	// }

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

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public void setBloodPressure(String bloodPressure) {
		this.bloodPressure = bloodPressure;
	}

	public void setHgbOrHct(String hgbOrHct) {
		HgbOrHct = hgbOrHct;
	}

	public void setWBCOPlatelet(String wBCOPlatelet) {
		WBCOPlatelet = wBCOPlatelet;
	}

	public void setESR(String eSR) {
		ESR = eSR;
	}

	public void setALTOrAST(String aLTOrAST) {
		ALTOrAST = aLTOrAST;
	}

	public void setSLDH(String sLDH) {
		SLDH = sLDH;
	}

	public void setTCKorCKMM(String TCKorCKMM) {
		this.TCKorCKMM = TCKorCKMM;
	}

	public void setOtherData(String otherData) {
		this.otherData = otherData;
	}

	public void setClinicalData(String clinicalData) {
		this.clinicalData = clinicalData;
	}

	public void setVAS(String vAS) {
		VAS = vAS;
	}

	public void setPlans(String plans) {
		this.plans = plans;
	}

}