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

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.ust.emr.model.Comment;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;

@Entity
@Table(name = "form_SLEDAA_case_report")
public class SLEDAACaseReportForm {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;

	// Baseline SLE data
	private int ageAtSLEDiagnosis;
	private LocalDate dateSLEDiagnosis;
	private int SLEDuration;

	private String[] ACRCriteria; // CHECKBOX 1

	private String currentSLEData; // RB1 - no flare, mild-mod S-S flare, severe
									// S-S flare
	private String ORFlare; // RB2 - mild, moderate, severe, very severe

	// SLE activity involvement
	private String SLEActivityInvolvement;
	private String[] SLEActivity;
	private String other;

	// lab test
	private String hgb;
	private String WBC;
	private String lympho;
	private String platelet;
	private String urine_alb;
	private String urine_wbc;
	private String urine_rbc;
	private String urine_casts;
	private String UProt;
	private String UCR;
	private String UPCR;
	private String otherLabs;

	// Physician's Global Assessment
	private String PGA;
	private String PGA_rating; // RB3 - none, mild, moderate, severe

	// SLEDAI
	private String SSscore;
	private String antiDsDNA_status; // RB4 - positive, negative, not done
	private String antiDsDNA_positive_titer;
	private String C3;
	private String C3_status; // RB5 - low, normal, not done

	// MEX SLEDAI
	private String MEXSLEDAIScore;
	private String MEXSLEDAI_status; // RB6 - complete+labs, CBC only,
										// Urinalysis only, No labs

	// SLICC
	private String SLICCDamageScore;
	private String involvement;

	// treatment
	private String treatment; // RB7 - hospitalization, emergency, infusion
								// out-patient

	// SLE Medications
	private String prednisoneOrMethylprednisolone;
	private String hydroxychloroquine;
	private String iv_cyclophosphamideInduction;
	private String iv_cyclophosphamideMaintenance;
	private String medications_other;

	// notes
	private String notes;

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

	// Baseine SLE Data
	@Column(name = "AgeAtSLEDiagnosis")
	public int getAgeAtSLEDiagnosis() {
		return ageAtSLEDiagnosis;
	}

	@Column(name = "DateSLEDiagnosis")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalDate")
	@DateTimeFormat(iso = ISO.DATE)
	public LocalDate getDateSLEDiagnosis() {
		return dateSLEDiagnosis;
	}

	@Column(name = "SLEDuration")
	public int getSLEDuration() {
		return SLEDuration;
	}

	// ACR CRITERIA AT SLE DIAGNOSIS
	@Column(name = "ACRCriteria_checkbox")
	public String[] getACRCriteria() {
		return ACRCriteria;
	}

	// Current SLE data
	@Column(name = "CurrentSLEData")
	public String getCurrentSLEData() {
		return currentSLEData;
	}

	@Column(name = "ORFlare")
	public String getORFlare() {
		return ORFlare;
	}

	// SLE activity involvement
	@Column(name = "SLEActivityInvolvement")
	public String getSLEActivityInvolvement() {
		return SLEActivityInvolvement;
	}

	@Column(name = "SLEActivity_checkbox")
	public String[] getSLEActivity() {
		return SLEActivity;
	}

	@Column(name = "Other")
	public String getOther() {
		return other;
	}

	// lab shit
	@Column(name = "Hgb")
	public String getHgb() {
		return hgb;
	}

	@Column(name = "WBC")
	public String getWBC() {
		return WBC;
	}

	@Column(name = "Lympho")
	public String getLympho() {
		return lympho;
	}

	@Column(name = "Platelet")
	public String getPlatelet() {
		return platelet;
	}

	@Column(name = "Urine_alb")
	public String getUrine_alb() {
		return urine_alb;
	}

	@Column(name = "Urine_wbc")
	public String getUrine_wbc() {
		return urine_wbc;
	}

	@Column(name = "Urine_rbc")
	public String getUrine_rbc() {
		return urine_rbc;
	}

	@Column(name = "Urine_casts")
	public String getUrine_casts() {
		return urine_casts;
	}

	@Column(name = "UProt")
	public String getUProt() {
		return UProt;
	}

	@Column(name = "UCR")
	public String getUCR() {
		return UCR;
	}

	@Column(name = "UPCR")
	public String getUPCR() {
		return UPCR;
	}

	@Column(name = "OtherLabs")
	public String getOtherLabs() {
		return otherLabs;
	}

	// physician's global assessment
	@Column(name = "PGA")
	public String getPGA() {
		return PGA;
	}

	@Column(name = "PGA_rating")
	public String getPGA_rating() {
		return PGA_rating;
	}

	// SLEDAI
	@Column(name = "SSscore")
	public String getSSscore() {
		return SSscore;
	}

	@Column(name = "AntiDsDNA_status")
	public String getAntiDsDNA_status() {
		return antiDsDNA_status;
	}

	@Column(name = "AntiDsDNA_positive_titer")
	public String getAntiDsDNA_positive_titer() {
		return antiDsDNA_positive_titer;
	}

	@Column(name = "C3")
	public String getC3() {
		return C3;
	}

	@Column(name = "C3_status")
	public String getC3_status() {
		return C3_status;
	}

	// MEX SLEDAI
	@Column(name = "MEXSLEDAIScore")
	public String getMEXSLEDAIScore() {
		return MEXSLEDAIScore;
	}

	@Column(name = "MEXSLEDAI_status")
	public String getMEXSLEDAI_status() {
		return MEXSLEDAI_status;
	}

	// SLICC DAMAGE SCORE
	@Column(name = "SLICCDamageScore")
	public String getSLICCDamageScore() {
		return SLICCDamageScore;
	}

	@Column(name = "Involvement")
	public String getInvolvement() {
		return involvement;
	}

	// TREATMENT OF LUPUS
	@Column(name = "Treatment")
	public String getTreatment() {
		return treatment;
	}

	// SLE MEDICATIONS
	@Column(name = "PrednisoneOrMethylprednisolone")
	public String getPrednisoneOrMethylprednisolone() {
		return prednisoneOrMethylprednisolone;
	}

	@Column(name = "Hydroxychloroquine")
	public String getHydroxychloroquine() {
		return hydroxychloroquine;
	}

	@Column(name = "Iv_cyclophosphamideInduction")
	public String getIv_cyclophosphamideInduction() {
		return iv_cyclophosphamideInduction;
	}

	@Column(name = "Iv_cyclophosphamideMaintenance")
	public String getIv_cyclophosphamideMaintenance() {
		return iv_cyclophosphamideMaintenance;
	}

	@Column(name = "Medications_other")
	public String getMedications_other() {
		return medications_other;
	}

	@Column(name = "Notes")
	public String getNotes() {
		return notes;
	}

	/**
	 * SETTERS
	 * **/

	public void setId(Long id) {
		this.id = id;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public void setRevisionHistory(RevisionHistory revisionHistory) {
		this.revisionHistory = revisionHistory;
	}

	public void setAgeAtSLEDiagnosis(int ageAtSLEDiagnosis) {
		this.ageAtSLEDiagnosis = ageAtSLEDiagnosis;
	}

	public void setDateSLEDiagnosis(LocalDate dateSLEDiagnosis) {
		this.dateSLEDiagnosis = dateSLEDiagnosis;
	}

	public void setSLEDuration(int SLEDuration) {
		this.SLEDuration = SLEDuration;
	}

	public void setCurrentSLEData(String currentSLEData) {
		this.currentSLEData = currentSLEData;
	}

	public void setORFlare(String oRFlare) {
		ORFlare = oRFlare;
	}

	public void setSLEActivityInvolvement(String sLEActivityInvolvement) {
		SLEActivityInvolvement = sLEActivityInvolvement;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public void setHgb(String hgb) {
		this.hgb = hgb;
	}

	public void setWBC(String wBC) {
		WBC = wBC;
	}

	public void setLympho(String lympho) {
		this.lympho = lympho;
	}

	public void setPlatelet(String platelet) {
		this.platelet = platelet;
	}

	public void setUrine_alb(String urine_alb) {
		this.urine_alb = urine_alb;
	}

	public void setUrine_wbc(String urine_wbc) {
		this.urine_wbc = urine_wbc;
	}

	public void setUrine_rbc(String urine_rbc) {
		this.urine_rbc = urine_rbc;
	}

	public void setUrine_casts(String urine_casts) {
		this.urine_casts = urine_casts;
	}

	public void setUProt(String uProt) {
		UProt = uProt;
	}

	public void setUCR(String uCR) {
		UCR = uCR;
	}

	public void setUPCR(String uPCR) {
		UPCR = uPCR;
	}

	public void setOtherLabs(String otherLabs) {
		this.otherLabs = otherLabs;
	}

	public void setPGA(String pGA) {
		PGA = pGA;
	}

	public void setPGA_rating(String pGA_rating) {
		PGA_rating = pGA_rating;
	}

	public void setSSscore(String sSscore) {
		SSscore = sSscore;
	}

	public void setAntiDsDNA_status(String antiDsDNA_status) {
		this.antiDsDNA_status = antiDsDNA_status;
	}

	public void setAntiDsDNA_positive_titer(String antiDsDNA_positive_titer) {
		this.antiDsDNA_positive_titer = antiDsDNA_positive_titer;
	}

	public void setC3(String c3) {
		C3 = c3;
	}

	public void setC3_status(String c3_status) {
		C3_status = c3_status;
	}

	public void setMEXSLEDAIScore(String mEXSLEDAIScore) {
		MEXSLEDAIScore = mEXSLEDAIScore;
	}

	public void setMEXSLEDAI_status(String mEXSLEDAI_status) {
		MEXSLEDAI_status = mEXSLEDAI_status;
	}

	public void setSLICCDamageScore(String sLICCDamageScore) {
		SLICCDamageScore = sLICCDamageScore;
	}

	public void setInvolvement(String involvement) {
		this.involvement = involvement;
	}

	public void setTreatment(String treatment) {
		this.treatment = treatment;
	}

	public void setPrednisoneOrMethylprednisolone(
			String prednisoneOrMethylprednisolone) {
		this.prednisoneOrMethylprednisolone = prednisoneOrMethylprednisolone;
	}

	public void setHydroxychloroquine(String hydroxychloroquine) {
		this.hydroxychloroquine = hydroxychloroquine;
	}

	public void setIv_cyclophosphamideInduction(
			String iv_cyclophosphamideInduction) {
		this.iv_cyclophosphamideInduction = iv_cyclophosphamideInduction;
	}

	public void setIv_cyclophosphamideMaintenance(
			String iv_cyclophosphamideMaintenance) {
		this.iv_cyclophosphamideMaintenance = iv_cyclophosphamideMaintenance;
	}

	public void setMedications_other(String medications_other) {
		this.medications_other = medications_other;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public void setACRCriteria(String[] aCRCriteria) {
		ACRCriteria = aCRCriteria;
	}

	public void setSLEActivity(String[] sLEActivity) {
		SLEActivity = sLEActivity;
	}
}
