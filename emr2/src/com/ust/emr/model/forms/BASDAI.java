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

import com.ust.emr.model.Medication;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;

@Entity
@Table(name = "form_BASDAI")
public class BASDAI {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;

	private Medication ASMedication;
	private String medicationEffectiveness;

	private String question1;
	private String question2;
	private String question3;
	private String question4;
	private String question5;
	private String question6;

	private String total; // 1-4 + mean(5,6)
	private String score;

	public BASDAI() {
		ASMedication = new Medication();
	}

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

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "medication_id")
	public Medication getASMedication() {
		return ASMedication;
	}

	@Column(name = "effectiveness")
	public String getMedicationEffectiveness() {
		return medicationEffectiveness;
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

	@Column(name = "total")
	public String getTotal() {
		return total;
	}

	@Column(name = "score")
	public String getScore() {
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

	public void setASMedication(Medication aSMedication) {
		ASMedication = aSMedication;
	}

	public void setMedicationEffectiveness(String medicationEffectiveness) {
		this.medicationEffectiveness = medicationEffectiveness;
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

	public void setTotal(String total) {
		this.total = total;
	}

	public void setScore(String score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "BASDAI [id=" + id + ", patient=" + patient
				+ ", revisionHistory=" + revisionHistory + ", ASMedication="
				+ ASMedication + ", medicationEffectiveness="
				+ medicationEffectiveness + ", question1=" + question1
				+ ", question2=" + question2 + ", question3=" + question3
				+ ", question4=" + question4 + ", question5=" + question5
				+ ", question6=" + question6 + ", total=" + total + ", score="
				+ score + "]";
	}

}
