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
@Table(name = "form_MEXSLEDAI")
public class MEXSLEDAI {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;

	private String neurologicalDisorder;
	private String renal;
	private String vasculitis;
	private String hemolysis;
	private String myositis;
	private String arthritis;
	private String cutaneous;
	private String serositis;
	private String fever;
	private String leukopenia;

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

	@Column(name = "neurologicalDisorder")
	public String getNeurologicalDisorder() {
		return neurologicalDisorder;
	}

	@Column(name = "renal")
	public String getRenal() {
		return renal;
	}

	@Column(name = "vasculitis")
	public String getVasculitis() {
		return vasculitis;
	}

	@Column(name = "hemolysis")
	public String getHemolysis() {
		return hemolysis;
	}

	@Column(name = "myositis")
	public String getMyositis() {
		return myositis;
	}

	@Column(name = "arthritis")
	public String getArthritis() {
		return arthritis;
	}

	@Column(name = "cutaneous")
	public String getCutaneous() {
		return cutaneous;
	}

	@Column(name = "serositis")
	public String getSerositis() {
		return serositis;
	}

	@Column(name = "fever")
	public String getFever() {
		return fever;
	}

	@Column(name = "leukopenia")
	public String getLeukopenia() {
		return leukopenia;
	}

	@Column(name = "score")
	public String getScore() {
		return score;
	}

	/**
	 * SETTERS
	 * */
	public void setScore(String score) {
		this.score = score;
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

	public void setNeurologicalDisorder(String neurologicalDisorder) {
		this.neurologicalDisorder = neurologicalDisorder;
	}

	public void setRenal(String renal) {
		this.renal = renal;
	}

	public void setVasculitis(String vasculitis) {
		this.vasculitis = vasculitis;
	}

	public void setHemolysis(String hemolysis) {
		this.hemolysis = hemolysis;
	}

	public void setMyositis(String myositis) {
		this.myositis = myositis;
	}

	public void setArthritis(String arthritis) {
		this.arthritis = arthritis;
	}

	public void setCutaneous(String cutaneous) {
		this.cutaneous = cutaneous;
	}

	public void setSerositis(String serositis) {
		this.serositis = serositis;
	}

	public void setFever(String fever) {
		this.fever = fever;
	}

	public void setLeukopenia(String leukopenia) {
		this.leukopenia = leukopenia;
	}

}
