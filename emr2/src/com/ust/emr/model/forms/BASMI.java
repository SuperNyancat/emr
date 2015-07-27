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

import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;

@Entity
@Table(name = "form_basmi")
public class BASMI {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;
	// questions
	private String q1;
	private String q2;
	private String q3;
	private String q4;
	private String q5;
	private String score;
	
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

	public String getQ1() {
		return q1;
	}

	public String getQ2() {
		return q2;
	}

	public String getQ3() {
		return q3;
	}

	public String getQ4() {
		return q4;
	}

	public String getQ5() {
		return q5;
	}

	public String getScore() {
		return score;
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

	public void setQ1(String q1) {
		this.q1 = q1;
	}

	public void setQ2(String q2) {
		this.q2 = q2;
	}

	public void setQ3(String q3) {
		this.q3 = q3;
	}

	public void setQ4(String q4) {
		this.q4 = q4;
	}

	public void setQ5(String q5) {
		this.q5 = q5;
	}

	public void setScore(String score) {
		this.score = score;
	}
	
	
}
