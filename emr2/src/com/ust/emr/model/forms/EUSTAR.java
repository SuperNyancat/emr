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
@Table(name = "form_eustar")
public class EUSTAR {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;
	
	private String modifiedRodnan;
	private String scleredema;
	private String skin;
	private String digitalNecrosis;
	private String vascular;
	private String arthritis;
	private String dlco;
	private String heartLung;
	private String ESR;
	private String hypocomplementemia;
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

	public String getModifiedRodnan() {
		return modifiedRodnan;
	}

	public String getScleredema() {
		return scleredema;
	}

	public String getSkin() {
		return skin;
	}

	public String getDigitalNecrosis() {
		return digitalNecrosis;
	}

	public String getVascular() {
		return vascular;
	}

	public String getDlco() {
		return dlco;
	}

	public String getHeartLung() {
		return heartLung;
	}

	public String getESR() {
		return ESR;
	}

	public String getHypocomplementemia() {
		return hypocomplementemia;
	}

	public String getScore() {
		return score;
	}
	
	

	public String getArthritis() {
		return arthritis;
	}

	public void setArthritis(String arthritis) {
		this.arthritis = arthritis;
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

	public void setModifiedRodnan(String modifiedRodnan) {
		this.modifiedRodnan = modifiedRodnan;
	}

	public void setScleredema(String scleredema) {
		this.scleredema = scleredema;
	}

	public void setSkin(String skin) {
		this.skin = skin;
	}

	public void setDigitalNecrosis(String digitalNecrosis) {
		this.digitalNecrosis = digitalNecrosis;
	}

	public void setVascular(String vascular) {
		this.vascular = vascular;
	}

	public void setDlco(String dlco) {
		this.dlco = dlco;
	}

	public void setHeartLung(String heartLung) {
		this.heartLung = heartLung;
	}

	public void setESR(String eSR) {
		ESR = eSR;
	}

	public void setHypocomplementemia(String hypocomplementemia) {
		this.hypocomplementemia = hypocomplementemia;
	}

	public void setScore(String score) {
		this.score = score;
	}
	
	
}
