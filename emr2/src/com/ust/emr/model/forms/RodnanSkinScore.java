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
@Table(name = "form_rodnan")
public class RodnanSkinScore {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;
	
	private String faceScore;
	private String score;
	private List<PartsOfBody> bodyParts;
	
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

	public String getScore() {
		return score;
	}
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "rodnan_bodyparts", joinColumns = { @JoinColumn(name = "rodnan_id") }, inverseJoinColumns = { @JoinColumn(name = "bodyparts_id") })
	@Fetch(value = FetchMode.SUBSELECT)
	public List<PartsOfBody> getBodyParts() {
		return bodyParts;
	}

	public String getFaceScore() {
		return faceScore;
	}
	
	/**
	 * setters
	 * */
	
	public void setFaceScore(String faceScore) {
		this.faceScore = faceScore;
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

	public void setScore(String score) {
		this.score = score;
	}

	public void setBodyParts(List<PartsOfBody> bodyParts) {
		this.bodyParts = bodyParts;
	}
	
	
}
