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
@Table(name = "form_das28")
public class DAS28 {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;
	
	private double PGA;
	private List<Joint> joints;
	
	//scores
	private String vas;
	private String tjc28;
	private String sjc28;
	private String esr;
	private String das28;
	private String interpretation;
	
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
	@JoinTable(name = "das_joint", joinColumns = { @JoinColumn(name = "das_id") }, inverseJoinColumns = { @JoinColumn(name = "joint_id") })
	@Fetch(value = FetchMode.SUBSELECT)
	public List<Joint> getJoints() {
		return joints;
	}

	public double getPGA() {
		return PGA;
	}

	public String getVas() {
		return vas;
	}

	public String getTjc28() {
		return tjc28;
	}

	public String getSjc28() {
		return sjc28;
	}

	public String getEsr() {
		return esr;
	}

	public String getDas28() {
		return das28;
	}

	public String getInterpretation() {
		return interpretation;
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

	public void setPGA(double pGA) {
		PGA = pGA;
	}

	public void setJoints(List<Joint> joints) {
		this.joints = joints;
	}

	public void setVas(String vas) {
		this.vas = vas;
	}

	public void setTjc28(String tjc28) {
		this.tjc28 = tjc28;
	}

	public void setSjc28(String sjc28) {
		this.sjc28 = sjc28;
	}

	public void setEsr(String esr) {
		this.esr = esr;
	}

	public void setDas28(String das28) {
		this.das28 = das28;
	}

	public void setInterpretation(String interpretation) {
		this.interpretation = interpretation;
	}
	
	
}
