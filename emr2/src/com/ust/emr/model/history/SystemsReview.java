package com.ust.emr.model.history;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.joda.time.LocalDate;

@Entity
@Table(name = "ih_systems_review")
public class SystemsReview {
	private Long id;
	private LocalDate mammogram;
	private LocalDate eyeExam;
	private LocalDate chestXRay;
	private LocalDate tuberculosis;
	private LocalDate boneDensitometry;

	private String[] constitutional;
	private int weightGain;
	private int weightLoss;

	private String[] eyes;
	private String[] earsNoseMouthThroat;
	private String[] cardiovascular;
	private String[] respiratory;
	private String[] gastrointestinal;

	private String[] genitourinary;
	private int agePeriod;
	private String regular;
	private int daysApart;
	private LocalDate lastPeriod;
	private LocalDate lastPap;
	private String bleedingAfterMenopause;
	private int pregnancies;
	private int miscarriages;

	private String[] musculoskeletal;
	private int min;
	private int hours;
	private String joints;

	private String[] integumentary;
	private String[] neurologicalSystem;
	private String[] psychiatric;
	private String[] endocrine;

	private String[] hematologic;
	private String when;
	private String[] allergic;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}
	@Column(name = "mammogram")
	public LocalDate getMammogram() {
		return mammogram;
	}
	@Column(name = "eyeExam")
	public LocalDate getEyeExam() {
		return eyeExam;
	}
	@Column(name = "chestXRay")
	public LocalDate getChestXRay() {
		return chestXRay;
	}
	@Column(name = "tuberculosis")
	public LocalDate getTuberculosis() {
		return tuberculosis;
	}
	@Column(name = "boneDensitometry")
	public LocalDate getBoneDensitometry() {
		return boneDensitometry;
	}
	@Column(name = "constitutional")
	public String[] getConstitutional() {
		return constitutional;
	}
	@Column(name = "weightGain")
	public int getWeightGain() {
		return weightGain;
	}
	@Column(name = "weightLoss")
	public int getWeightLoss() {
		return weightLoss;
	}
	@Column(name = "eyes")
	public String[] getEyes() {
		return eyes;
	}
	@Column(name = "earsNoseMouthThroat")
	public String[] getEarsNoseMouthThroat() {
		return earsNoseMouthThroat;
	}
	@Column(name = "cardiovascular")
	public String[] getCardiovascular() {
		return cardiovascular;
	}
	@Column(name = "respiratory")
	public String[] getRespiratory() {
		return respiratory;
	}
	@Column(name = "gastrointestinal")
	public String[] getGastrointestinal() {
		return gastrointestinal;
	}
	@Column(name = "genitourinary")
	public String[] getGenitourinary() {
		return genitourinary;
	}
	@Column(name = "agePeriod")
	public int getAgePeriod() {
		return agePeriod;
	}
	@Column(name = "regular")
	public String getRegular() {
		return regular;
	}
	@Column(name = "daysApart")
	public int getDaysApart() {
		return daysApart;
	}
	@Column(name = "lastPeriod")
	public LocalDate getLastPeriod() {
		return lastPeriod;
	}
	@Column(name = "lastPap")
	public LocalDate getLastPap() {
		return lastPap;
	}
	@Column(name = "bleedingAfterMenopause")
	public String getBleedingAfterMenopause() {
		return bleedingAfterMenopause;
	}
	@Column(name = "pregnancies")
	public int getPregnancies() {
		return pregnancies;
	}
	@Column(name = "miscarriages")
	public int getMiscarriages() {
		return miscarriages;
	}
	@Column(name = "musculoskeletal")
	public String[] getMusculoskeletal() {
		return musculoskeletal;
	}
	@Column(name = "min")
	public int getMin() {
		return min;
	}
	@Column(name = "hours")
	public int getHours() {
		return hours;
	}
	@Column(name = "joints")
	public String getJoints() {
		return joints;
	}
	@Column(name = "integumentary")
	public String[] getIntegumentary() {
		return integumentary;
	}
	@Column(name = "neurologicalSystem")
	public String[] getNeurologicalSystem() {
		return neurologicalSystem;
	}
	@Column(name = "psychiatric")
	public String[] getPsychiatric() {
		return psychiatric;
	}
	@Column(name = "endocrine")
	public String[] getEndocrine() {
		return endocrine;
	}
	@Column(name = "hematologic")
	public String[] getHematologic() {
		return hematologic;
	}
	@Column(name = "when_fld")
	public String getWhen() {
		return when;
	}
	@Column(name = "allergic")
	public String[] getAllergic() {
		return allergic;
	}
	
	/**
	 * setters
	 * */

	public void setId(Long id) {
		this.id = id;
	}

	public void setMammogram(LocalDate mammogram) {
		this.mammogram = mammogram;
	}

	public void setEyeExam(LocalDate eyeExam) {
		this.eyeExam = eyeExam;
	}

	public void setChestXRay(LocalDate chestXRay) {
		this.chestXRay = chestXRay;
	}

	public void setTuberculosis(LocalDate tuberculosis) {
		this.tuberculosis = tuberculosis;
	}

	public void setBoneDensitometry(LocalDate boneDensitometry) {
		this.boneDensitometry = boneDensitometry;
	}

	public void setConstitutional(String[] constitutional) {
		this.constitutional = constitutional;
	}

	public void setWeightGain(int weightGain) {
		this.weightGain = weightGain;
	}

	public void setWeightLoss(int weightLoss) {
		this.weightLoss = weightLoss;
	}

	public void setEyes(String[] eyes) {
		this.eyes = eyes;
	}

	public void setEarsNoseMouthThroat(String[] earsNoseMouthThroat) {
		this.earsNoseMouthThroat = earsNoseMouthThroat;
	}

	public void setCardiovascular(String[] cardiovascular) {
		this.cardiovascular = cardiovascular;
	}

	public void setRespiratory(String[] respiratory) {
		this.respiratory = respiratory;
	}

	public void setGastrointestinal(String[] gastrointestinal) {
		this.gastrointestinal = gastrointestinal;
	}

	public void setGenitourinary(String[] genitourinary) {
		this.genitourinary = genitourinary;
	}

	public void setAgePeriod(int agePeriod) {
		this.agePeriod = agePeriod;
	}

	public void setRegular(String regular) {
		this.regular = regular;
	}

	public void setDaysApart(int daysApart) {
		this.daysApart = daysApart;
	}

	public void setLastPeriod(LocalDate lastPeriod) {
		this.lastPeriod = lastPeriod;
	}

	public void setLastPap(LocalDate lastPap) {
		this.lastPap = lastPap;
	}

	public void setBleedingAfterMenopause(String bleedingAfterMenopause) {
		this.bleedingAfterMenopause = bleedingAfterMenopause;
	}

	public void setPregnancies(int pregnancies) {
		this.pregnancies = pregnancies;
	}

	public void setMiscarriages(int miscarriages) {
		this.miscarriages = miscarriages;
	}

	public void setMusculoskeletal(String[] musculoskeletal) {
		this.musculoskeletal = musculoskeletal;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public void setHours(int hours) {
		this.hours = hours;
	}

	public void setJoints(String joints) {
		this.joints = joints;
	}

	public void setIntegumentary(String[] integumentary) {
		this.integumentary = integumentary;
	}

	public void setNeurologicalSystem(String[] neurologicalSystem) {
		this.neurologicalSystem = neurologicalSystem;
	}

	public void setPsychiatric(String[] psychiatric) {
		this.psychiatric = psychiatric;
	}

	public void setEndocrine(String[] endocrine) {
		this.endocrine = endocrine;
	}

	public void setHematologic(String[] hematologic) {
		this.hematologic = hematologic;
	}

	public void setWhen(String when) {
		this.when = when;
	}

	public void setAllergic(String[] allergic) {
		this.allergic = allergic;
	}

}
