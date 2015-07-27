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
@Table(name = "form_damage_index_sledai")
public class DamageIndexSLE {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;

	// ocular
	private String ocular1;
	private String ocular2;

	// neuro
	private String neuropsychiatric1;
	private String neuropsychiatric2;
	private String neuropsychiatric3;
	private String neuropsychiatric4;
	private String neuropsychiatric5;

	// renal
	private String renal1;
	private String renal2;
	private String renal3;

	// pulmonary
	private String pulmonary1;
	private String pulmonary2;
	private String pulmonary3;
	private String pulmonary4;
	private String pulmonary5;

	// cardiovascular
	private String cardiovascular1;
	private String cardiovascular2;
	private String cardiovascular3;
	private String cardiovascular4;
	private String cardiovascular5;

	// peripheralVascular
	private String peripheralVascular1;
	private String peripheralVascular2;
	private String peripheralVascular3;
	private String peripheralVascular4;

	// gastrointestinal
	private String gastrointestinal1;
	private String gastrointestinal2;
	private String gastrointestinal3;
	private String gastrointestinal4;

	// musculoskeletal
	private String musculoskeletal1;
	private String musculoskeletal2;
	private String musculoskeletal3;
	private String musculoskeletal4;
	private String musculoskeletal5;

	// skin
	private String skin1;
	private String skin2;
	private String skin3;

	private String premature;
	private String diabetes;
	private String malignancy;

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

	@Column(name = "ocular1")
	public String getOcular1() {
		return ocular1;
	}

	@Column(name = "ocular2")
	public String getOcular2() {
		return ocular2;
	}

	@Column(name = "neuropsychiatric1")
	public String getNeuropsychiatric1() {
		return neuropsychiatric1;
	}

	@Column(name = "neuropsychiatric2")
	public String getNeuropsychiatric2() {
		return neuropsychiatric2;
	}

	@Column(name = "neuropsychiatric3")
	public String getNeuropsychiatric3() {
		return neuropsychiatric3;
	}

	@Column(name = "neuropsychiatric4")
	public String getNeuropsychiatric4() {
		return neuropsychiatric4;
	}

	@Column(name = "neuropsychiatric5")
	public String getNeuropsychiatric5() {
		return neuropsychiatric5;
	}

	@Column(name = "renal1")
	public String getRenal1() {
		return renal1;
	}

	@Column(name = "renal2")
	public String getRenal2() {
		return renal2;
	}

	@Column(name = "renal3")
	public String getRenal3() {
		return renal3;
	}

	@Column(name = "pulmonary1")
	public String getPulmonary1() {
		return pulmonary1;
	}

	@Column(name = "pulmonary2")
	public String getPulmonary2() {
		return pulmonary2;
	}

	@Column(name = "pulmonary3")
	public String getPulmonary3() {
		return pulmonary3;
	}

	@Column(name = "pulmonary4")
	public String getPulmonary4() {
		return pulmonary4;
	}

	@Column(name = "pulmonary5")
	public String getPulmonary5() {
		return pulmonary5;
	}

	@Column(name = "cardiovascular1")
	public String getCardiovascular1() {
		return cardiovascular1;
	}

	@Column(name = "cardiovascular2")
	public String getCardiovascular2() {
		return cardiovascular2;
	}

	@Column(name = "cardiovascular3")
	public String getCardiovascular3() {
		return cardiovascular3;
	}

	@Column(name = "cardiovascular4")
	public String getCardiovascular4() {
		return cardiovascular4;
	}

	@Column(name = "cardiovascular5")
	public String getCardiovascular5() {
		return cardiovascular5;
	}

	@Column(name = "peripheralVascular1")
	public String getPeripheralVascular1() {
		return peripheralVascular1;
	}

	@Column(name = "peripheralVascular2")
	public String getPeripheralVascular2() {
		return peripheralVascular2;
	}

	@Column(name = "peripheralVascular3")
	public String getPeripheralVascular3() {
		return peripheralVascular3;
	}

	@Column(name = "peripheralVascular4")
	public String getPeripheralVascular4() {
		return peripheralVascular4;
	}

	@Column(name = "gastrointestinal1")
	public String getGastrointestinal1() {
		return gastrointestinal1;
	}

	@Column(name = "gastrointestinal2")
	public String getGastrointestinal2() {
		return gastrointestinal2;
	}

	@Column(name = "gastrointestinal3")
	public String getGastrointestinal3() {
		return gastrointestinal3;
	}

	@Column(name = "gastrointestinal4")
	public String getGastrointestinal4() {
		return gastrointestinal4;
	}

	@Column(name = "musculoskeletal1")
	public String getMusculoskeletal1() {
		return musculoskeletal1;
	}

	@Column(name = "musculoskeletal2")
	public String getMusculoskeletal2() {
		return musculoskeletal2;
	}

	@Column(name = "musculoskeletal3")
	public String getMusculoskeletal3() {
		return musculoskeletal3;
	}

	@Column(name = "musculoskeletal4")
	public String getMusculoskeletal4() {
		return musculoskeletal4;
	}

	@Column(name = "musculoskeletal5")
	public String getMusculoskeletal5() {
		return musculoskeletal5;
	}

	@Column(name = "skin1")
	public String getSkin1() {
		return skin1;
	}

	@Column(name = "skin2")
	public String getSkin2() {
		return skin2;
	}

	@Column(name = "skin3")
	public String getSkin3() {
		return skin3;
	}

	@Column(name = "premature")
	public String getPremature() {
		return premature;
	}

	@Column(name = "diabetes")
	public String getDiabetes() {
		return diabetes;
	}

	@Column(name = "malignancy")
	public String getMalignancy() {
		return malignancy;
	}

	@Column(name = "score")
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

	public void setOcular1(String ocular1) {
		this.ocular1 = ocular1;
	}

	public void setOcular2(String ocular2) {
		this.ocular2 = ocular2;
	}

	public void setNeuropsychiatric1(String neuropsychiatric1) {
		this.neuropsychiatric1 = neuropsychiatric1;
	}

	public void setNeuropsychiatric2(String neuropsychiatric2) {
		this.neuropsychiatric2 = neuropsychiatric2;
	}

	public void setNeuropsychiatric3(String neuropsychiatric3) {
		this.neuropsychiatric3 = neuropsychiatric3;
	}

	public void setNeuropsychiatric4(String neuropsychiatric4) {
		this.neuropsychiatric4 = neuropsychiatric4;
	}

	public void setNeuropsychiatric5(String neuropsychiatric5) {
		this.neuropsychiatric5 = neuropsychiatric5;
	}

	public void setRenal1(String renal1) {
		this.renal1 = renal1;
	}

	public void setRenal2(String renal2) {
		this.renal2 = renal2;
	}

	public void setRenal3(String renal3) {
		this.renal3 = renal3;
	}

	public void setPulmonary1(String pulmonary1) {
		this.pulmonary1 = pulmonary1;
	}

	public void setPulmonary2(String pulmonary2) {
		this.pulmonary2 = pulmonary2;
	}

	public void setPulmonary3(String pulmonary3) {
		this.pulmonary3 = pulmonary3;
	}

	public void setPulmonary4(String pulmonary4) {
		this.pulmonary4 = pulmonary4;
	}

	public void setPulmonary5(String pulmonary5) {
		this.pulmonary5 = pulmonary5;
	}

	public void setCardiovascular1(String cardiovascular1) {
		this.cardiovascular1 = cardiovascular1;
	}

	public void setCardiovascular2(String cardiovascular2) {
		this.cardiovascular2 = cardiovascular2;
	}

	public void setCardiovascular3(String cardiovascular3) {
		this.cardiovascular3 = cardiovascular3;
	}

	public void setCardiovascular4(String cardiovascular4) {
		this.cardiovascular4 = cardiovascular4;
	}

	public void setCardiovascular5(String cardiovascular5) {
		this.cardiovascular5 = cardiovascular5;
	}

	public void setPeripheralVascular1(String peripheralVascular1) {
		this.peripheralVascular1 = peripheralVascular1;
	}

	public void setPeripheralVascular2(String peripheralVascular2) {
		this.peripheralVascular2 = peripheralVascular2;
	}

	public void setPeripheralVascular3(String peripheralVascular3) {
		this.peripheralVascular3 = peripheralVascular3;
	}

	public void setPeripheralVascular4(String peripheralVascular4) {
		this.peripheralVascular4 = peripheralVascular4;
	}

	public void setGastrointestinal1(String gastrointestinal1) {
		this.gastrointestinal1 = gastrointestinal1;
	}

	public void setGastrointestinal2(String gastrointestinal2) {
		this.gastrointestinal2 = gastrointestinal2;
	}

	public void setGastrointestinal3(String gastrointestinal3) {
		this.gastrointestinal3 = gastrointestinal3;
	}

	public void setGastrointestinal4(String gastrointestinal4) {
		this.gastrointestinal4 = gastrointestinal4;
	}

	public void setMusculoskeletal1(String musculoskeletal1) {
		this.musculoskeletal1 = musculoskeletal1;
	}

	public void setMusculoskeletal2(String musculoskeletal2) {
		this.musculoskeletal2 = musculoskeletal2;
	}

	public void setMusculoskeletal3(String musculoskeletal3) {
		this.musculoskeletal3 = musculoskeletal3;
	}

	public void setMusculoskeletal4(String musculoskeletal4) {
		this.musculoskeletal4 = musculoskeletal4;
	}

	public void setMusculoskeletal5(String musculoskeletal5) {
		this.musculoskeletal5 = musculoskeletal5;
	}

	public void setSkin1(String skin1) {
		this.skin1 = skin1;
	}

	public void setSkin2(String skin2) {
		this.skin2 = skin2;
	}

	public void setSkin3(String skin3) {
		this.skin3 = skin3;
	}

	public void setPremature(String premature) {
		this.premature = premature;
	}

	public void setDiabetes(String diabetes) {
		this.diabetes = diabetes;
	}

	public void setMalignancy(String malignancy) {
		this.malignancy = malignancy;
	}

	public void setScore(String score) {
		this.score = score;
	}

}
