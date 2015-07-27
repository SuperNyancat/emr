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
@Table(name = "form_SLEDAI_score")
public class SLEDAIScore {

	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;
	private String PGA;

	// weight 8
	private String seizure;
	private String psychosis;
	private String organicBrainSyndrome;
	private String virtualDisturbance;;
	private String cranialNerveDisorder;
	private String lupusHeadache;
	private String CVA;
	private String vasculitis;

	// weight 4
	private String arthritis;
	private String myositis;
	private String urinaryCasts;
	private String hematuria;
	private String proteinuria;
	private String pyuria;

	// weight 2
	private String newRash;
	private String alopecia;
	private String mucosalUlcers;
	private String pleurisy;
	private String pericarditis;
	private String lowComplement;
	private String increasedDNABinding;

	// weight 1
	private String fever;
	private String thrombocytopenia;
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

	@Column(name = "seizure")
	public String getSeizure() {
		return seizure;
	}

	@Column(name = "psychosis")
	public String getPsychosis() {
		return psychosis;
	}

	@Column(name = "organicBrainSyndrome")
	public String getOrganicBrainSyndrome() {
		return organicBrainSyndrome;
	}

	@Column(name = "virtualDisturbance")
	public String getVirtualDisturbance() {
		return virtualDisturbance;
	}

	@Column(name = "cranialNerveDisorder")
	public String getCranialNerveDisorder() {
		return cranialNerveDisorder;
	}

	@Column(name = "lupusHeadache")
	public String getLupusHeadache() {
		return lupusHeadache;
	}

	@Column(name = "CVA")
	public String getCVA() {
		return CVA;
	}

	@Column(name = "vasculitis")
	public String getVasculitis() {
		return vasculitis;
	}

	@Column(name = "arthritis")
	public String getArthritis() {
		return arthritis;
	}

	@Column(name = "myositis")
	public String getMyositis() {
		return myositis;
	}

	@Column(name = "urinaryCasts")
	public String getUrinaryCasts() {
		return urinaryCasts;
	}

	@Column(name = "hematuria")
	public String getHematuria() {
		return hematuria;
	}

	@Column(name = "proteinuria")
	public String getProteinuria() {
		return proteinuria;
	}

	@Column(name = "pyuria")
	public String getPyuria() {
		return pyuria;
	}

	@Column(name = "newRash")
	public String getNewRash() {
		return newRash;
	}

	@Column(name = "alopecia")
	public String getAlopecia() {
		return alopecia;
	}

	@Column(name = "mucosalUlcers")
	public String getMucosalUlcers() {
		return mucosalUlcers;
	}

	@Column(name = "pleurisy")
	public String getPleurisy() {
		return pleurisy;
	}

	@Column(name = "pericarditis")
	public String getPericarditis() {
		return pericarditis;
	}

	@Column(name = "lowComplement")
	public String getLowComplement() {
		return lowComplement;
	}

	@Column(name = "increasedDNABinding")
	public String getIncreasedDNABinding() {
		return increasedDNABinding;
	}

	@Column(name = "fever")
	public String getFever() {
		return fever;
	}

	@Column(name = "thrombocytopenia")
	public String getThrombocytopenia() {
		return thrombocytopenia;
	}

	@Column(name = "leukopenia")
	public String getLeukopenia() {
		return leukopenia;
	}

	@Column(name = "score")
	public String getScore() {
		return score;
	}

	@Column(name = "PGA")
	public String getPGA() {
		return PGA;
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

	public void setSeizure(String seizure) {
		this.seizure = seizure;
	}

	public void setPsychosis(String psychosis) {
		this.psychosis = psychosis;
	}

	public void setOrganicBrainSyndrome(String organicBrainSyndrome) {
		this.organicBrainSyndrome = organicBrainSyndrome;
	}

	public void setVirtualDisturbance(String virtualDisturbance) {
		this.virtualDisturbance = virtualDisturbance;
	}

	public void setCranialNerveDisorder(String cranialNerveDisorder) {
		this.cranialNerveDisorder = cranialNerveDisorder;
	}

	public void setLupusHeadache(String lupusHeadache) {
		this.lupusHeadache = lupusHeadache;
	}

	public void setCVA(String cVA) {
		CVA = cVA;
	}

	public void setVasculitis(String vasculitis) {
		this.vasculitis = vasculitis;
	}

	public void setArthritis(String arthritis) {
		this.arthritis = arthritis;
	}

	public void setMyositis(String myositis) {
		this.myositis = myositis;
	}

	public void setUrinaryCasts(String urinaryCasts) {
		this.urinaryCasts = urinaryCasts;
	}

	public void setHematuria(String hematuria) {
		this.hematuria = hematuria;
	}

	public void setPGA(String pGA) {
		PGA = pGA;
	}

	public void setProteinuria(String proteinuria) {
		this.proteinuria = proteinuria;
	}

	public void setPyuria(String pyuria) {
		this.pyuria = pyuria;
	}

	public void setNewRash(String newRash) {
		this.newRash = newRash;
	}

	public void setAlopecia(String alopecia) {
		this.alopecia = alopecia;
	}

	public void setMucosalUlcers(String mucosalUlcers) {
		this.mucosalUlcers = mucosalUlcers;
	}

	public void setPleurisy(String pleurisy) {
		this.pleurisy = pleurisy;
	}

	public void setPericarditis(String pericarditis) {
		this.pericarditis = pericarditis;
	}

	public void setLowComplement(String lowComplement) {
		this.lowComplement = lowComplement;
	}

	public void setIncreasedDNABinding(String increasedDNABinding) {
		this.increasedDNABinding = increasedDNABinding;
	}

	public void setFever(String fever) {
		this.fever = fever;
	}

	public void setThrombocytopenia(String thrombocytopenia) {
		this.thrombocytopenia = thrombocytopenia;
	}

	public void setLeukopenia(String leukopenia) {
		this.leukopenia = leukopenia;
	}

	public void setScore(String score) {
		this.score = score;
	}

}
