package com.ust.emr.model.forms;

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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.ust.emr.model.Joint;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;

@Entity
@Table(name = "form_sdai")
public class SDAI {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;
	// table
	private List<Joint> joints; // pain is tender
	private int tenderScore;
	private int swollenScore;
	// scores
	private double patientGlobalAssessment;
	private double providerGlobalAssessment;
	private double cReactiveProtein;
	private double SDAIScore;
	private String SDAIScoreInterpretation;

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

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "sdai_joint", joinColumns = { @JoinColumn(name = "sdai_id") }, inverseJoinColumns = { @JoinColumn(name = "joint_id") })
	@Fetch(value = FetchMode.SUBSELECT)
	public List<Joint> getJoints() {
		return joints;
	}

	public int getTenderScore() {
		return tenderScore;
	}

	public int getSwollenScore() {
		return swollenScore;
	}

	public double getPatientGlobalAssessment() {
		return patientGlobalAssessment;
	}

	public double getProviderGlobalAssessment() {
		return providerGlobalAssessment;
	}

	public double getSDAIScore() {
		return SDAIScore;
	}

	public String getSDAIScoreInterpretation() {
		return SDAIScoreInterpretation;
	}

	public double getcReactiveProtein() {
		return cReactiveProtein;
	}

	/**
	 * setters
	 * */
	public void setcReactiveProtein(double cReactiveProtein) {
		this.cReactiveProtein = cReactiveProtein;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public void setRevisionHistory(RevisionHistory revisionHistory) {
		this.revisionHistory = revisionHistory;
	}

	public void setJoints(List<Joint> joints) {
		this.joints = joints;
	}

	public void setTenderScore(int tenderScore) {
		this.tenderScore = tenderScore;
	}

	public void setSwollenScore(int swollenScore) {
		this.swollenScore = swollenScore;
	}

	public void setPatientGlobalAssessment(double patientGlobalAssessment) {
		this.patientGlobalAssessment = patientGlobalAssessment;
	}

	public void setProviderGlobalAssessment(double providerGlobalAssessment) {
		this.providerGlobalAssessment = providerGlobalAssessment;
	}

	public void setSDAIScore(double cDAIScore) {
		SDAIScore = cDAIScore;
	}

	public void setSDAIScoreInterpretation(String cDAIScoreInterpretation) {
		SDAIScoreInterpretation = cDAIScoreInterpretation;
	}

}
