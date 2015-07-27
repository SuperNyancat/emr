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

import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;

@Entity
@Table(name = "form_pasi")
public class PASI {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;
	
	private List<PASIDetail> pasiDetails;
	private int hospitalNumber;
	private String score;
	
	private String totals_head;
	private String totals_upperLimbs;
	private String totals_lowerLimbs;
	private String totals_trunk;
	
	
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
	@JoinTable(name = "pasi_pasiDetails", joinColumns = { @JoinColumn(name = "pasi_id") }, inverseJoinColumns = { @JoinColumn(name = "details_id") })
	@Fetch(value = FetchMode.SUBSELECT)
	public List<PASIDetail> getPasiDetails() {
		return pasiDetails;
	}

	public int getHospitalNumber() {
		return hospitalNumber;
	}

	public String getScore() {
		return score;
	}

	public String getTotals_head() {
		return totals_head;
	}

	public String getTotals_upperLimbs() {
		return totals_upperLimbs;
	}

	public String getTotals_lowerLimbs() {
		return totals_lowerLimbs;
	}

	public String getTotals_trunk() {
		return totals_trunk;
	}

	/**
	 * setters
	 * */
	
	public void setTotals_head(String totals_head) {
		this.totals_head = totals_head;
	}

	public void setTotals_upperLimbs(String totals_upperLimbs) {
		this.totals_upperLimbs = totals_upperLimbs;
	}

	public void setTotals_lowerLimbs(String totals_lowerLimbs) {
		this.totals_lowerLimbs = totals_lowerLimbs;
	}

	public void setTotals_trunk(String totals_trunk) {
		this.totals_trunk = totals_trunk;
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

	public void setPasiDetails(List<PASIDetail> pasiDetails) {
		this.pasiDetails = pasiDetails;
	}

	public void setHospitalNumber(int hospitalNumber) {
		this.hospitalNumber = hospitalNumber;
	}

	public void setScore(String score) {
		this.score = score;
	}

	
	
}
