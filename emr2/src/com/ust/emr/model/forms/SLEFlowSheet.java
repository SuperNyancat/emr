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

/**
 * form 12
 * */
@Entity
@Table(name = "form_sle_flow_sheet")
public class SLEFlowSheet {
	private Long id;
	private Patient patient; // name, age
	private RevisionHistory revisionHistory; // date

	// general fields
	private String weight;
	private String bloodPressure;

	// Labs or other data
	private String HgbOrHct;
	private String WBC;
	private String PlateletOrESR;
	private String urineProtein;
	private String RBC;
	private String urineWBC;
	private String casts;
	private String urineOthers;
	private String crCl;
	private String c3;

	// clinical data
	private String clinicalData;

	private String SLEDAI;
	private String methylpred;
	private String hydroxychloroquine;
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

	// Labs or other data
	@Column(name = "HgbOrHct")
	public String getHgbOrHct() {
		return HgbOrHct;
	}

	@Column(name = "WBC")
	public String getWBC() {
		return WBC;
	}

	@Column(name = "PlateletOrESR")
	public String getPlateletOrESR() {
		return PlateletOrESR;
	}

	@Column(name = "urineProtein")
	public String getUrineProtein() {
		return urineProtein;
	}

	@Column(name = "RBC")
	public String getRBC() {
		return RBC;
	}

	@Column(name = "urineWBC")
	public String getUrineWBC() {
		return urineWBC;
	}

	@Column(name = "casts")
	public String getCasts() {
		return casts;
	}

	@Column(name = "urineOthers")
	public String getUrineOthers() {
		return urineOthers;
	}

	@Column(name = "crCl")
	public String getCrCl() {
		return crCl;
	}

	@Column(name = "c3")
	public String getC3() {
		return c3;
	}

	@Column(name = "clinicalData")
	public String getClinicalData() {
		return clinicalData;
	}

	@Column(name = "SLEDAI")
	public String getSLEDAI() {
		return SLEDAI;
	}

	@Column(name = "methylpred")
	public String getMethylpred() {
		return methylpred;
	}

	@Column(name = "hydroxychloroquine")
	public String getHydroxychloroquine() {
		return hydroxychloroquine;
	}

	@Column(name = "plans")
	public String getPlans() {
		return plans;
	}

	/**
	 * setters
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

	public void setWBC(String wBC) {
		WBC = wBC;
	}

	public void setPlateletOrESR(String plateletOrESR) {
		PlateletOrESR = plateletOrESR;
	}

	public void setUrineProtein(String urineProtein) {
		this.urineProtein = urineProtein;
	}

	public void setRBC(String rBC) {
		RBC = rBC;
	}

	public void setUrineWBC(String urineWBC) {
		this.urineWBC = urineWBC;
	}

	public void setCasts(String casts) {
		this.casts = casts;
	}

	public void setUrineOthers(String urineOthers) {
		this.urineOthers = urineOthers;
	}

	public void setCrCl(String crCl) {
		this.crCl = crCl;
	}

	public void setC3(String c3) {
		this.c3 = c3;
	}

	public void setClinicalData(String clinicalData) {
		this.clinicalData = clinicalData;
	}

	public void setSLEDAI(String sLEDAI) {
		SLEDAI = sLEDAI;
	}

	public void setMethylpred(String methylpred) {
		this.methylpred = methylpred;
	}

	public void setHydroxychloroquine(String hydroxychloroquine) {
		this.hydroxychloroquine = hydroxychloroquine;
	}

	public void setPlans(String plans) {
		this.plans = plans;
	}

}
