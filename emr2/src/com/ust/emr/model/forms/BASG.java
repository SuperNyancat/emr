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
@Table(name = "form_BASG")
public class BASG {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;

	private String question1;
	private String question2;

	private String total;
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

	@Column(name = "question1")
	public String getQuestion1() {
		return question1;
	}

	@Column(name = "question2")
	public String getQuestion2() {
		return question2;
	}

	@Column(name = "total")
	public String getTotal() {
		return total;
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

	public void setQuestion1(String question1) {
		this.question1 = question1;
	}

	public void setQuestion2(String question2) {
		this.question2 = question2;
	}

	public void setTotal(String total) {
		this.total = total;
	}
	
	@Column(name = "score")
	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "BASG [id=" + id + ", patient=" + patient + ", revisionHistory="
				+ revisionHistory + ", question1=" + question1 + ", question2="
				+ question2 + ", total=" + total + ", score=" + score + "]";
	}

	
}
