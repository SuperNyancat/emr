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
@Table(name = "form_BASFI")
public class BASFI {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;

	private String question1;
	private String question2;
	private String question3;
	private String question4;
	private String question5;
	private String question6;
	private String question7;
	private String question8;
	private String question9;
	private String question10;

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

	@Column(name = "question3")
	public String getQuestion3() {
		return question3;
	}

	@Column(name = "question4")
	public String getQuestion4() {
		return question4;
	}

	@Column(name = "question5")
	public String getQuestion5() {
		return question5;
	}

	@Column(name = "question6")
	public String getQuestion6() {
		return question6;
	}

	@Column(name = "question7")
	public String getQuestion7() {
		return question7;
	}

	@Column(name = "question8")
	public String getQuestion8() {
		return question8;
	}

	@Column(name = "question9")
	public String getQuestion9() {
		return question9;
	}

	@Column(name = "question10")
	public String getQuestion10() {
		return question10;
	}

	@Column(name = "total")
	public String getTotal() {
		return total;
	}

	@Column(name = "score")
	public String getBASFIScore() {
		return score;
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

	public void setQuestion3(String question3) {
		this.question3 = question3;
	}

	public void setQuestion4(String question4) {
		this.question4 = question4;
	}

	public void setQuestion5(String question5) {
		this.question5 = question5;
	}

	public void setQuestion6(String question6) {
		this.question6 = question6;
	}

	public void setQuestion7(String question7) {
		this.question7 = question7;
	}

	public void setQuestion8(String question8) {
		this.question8 = question8;
	}

	public void setQuestion9(String question9) {
		this.question9 = question9;
	}

	public void setQuestion10(String question10) {
		this.question10 = question10;
	}

	public void setTotal(String total) {
		this.total = total;
	}

	public void setBASFIScore(String bASFIScore) {
		score = bASFIScore;
	}

}
