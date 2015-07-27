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

/**
 * form 13
 * */
@Entity
@Table(name = "form_ss_flow_sheet")
public class SSFlowSheet {
	private Long id;
	private Patient patient; // name, age
	private RevisionHistory revisionHistory; // date

	// general fields
	private String weight;
	private String bloodPressure;

	// Labs or other data
	private String HgbOrHct;
	private String WBC;
	private String platelet;
	private String ESRorCRP;
	private String ALTorAST;
	private String otherData;

	// Rodnan skin coloring RADIOBUTTON
	private String face;
	private String anteriorChest;
	private String upperArm;
	private String abdomen;
	private String foreArm;
	private String hand;
	private String fingers;
	private String thigh;
	private String leg;
	private String feet;
	private String skinScore;

	// self assessment
	private String cardiacOrPulmonary;
	private String gastrointestinal;
	private String renal;

	private String plans;
	
	
	

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

	@Column(name = "Weight")
	public String getWeight() {
		return weight;
	}

	@Column(name = "BloodPressure")
	public String getBloodPressure() {
		return bloodPressure;
	}

	// Labs or other data
	@Column(name = "HgbOrHct")
	public String getHgbOrHct() {
		return HgbOrHct;
	}

	@Column(name = "WBC")
	public String getWBC() {
		return WBC;
	}

	@Column(name = "platelet")
	public String getPlatelet() {
		return platelet;
	}

	@Column(name = "ESRorCRP")
	public String getESRorCRP() {
		return ESRorCRP;
	}

	@Column(name = "ALTorAST")
	public String getALTorAST() {
		return ALTorAST;
	}

	@Column(name = "otherData")
	public String getOtherData() {
		return otherData;
	}

	// RODNAN SCORE
	@Column(name = "face")
	public String getFace() {
		return face;
	}

	@Column(name = "anteriorChest")
	public String getAnteriorChest() {
		return anteriorChest;
	}

	@Column(name = "upperArm")
	public String getUpperArm() {
		return upperArm;
	}

	@Column(name = "abdomen")
	public String getAbdomen() {
		return abdomen;
	}

	@Column(name = "foreArm")
	public String getForeArm() {
		return foreArm;
	}

	@Column(name = "hand")
	public String getHand() {
		return hand;
	}

	@Column(name = "fingers")
	public String getFingers() {
		return fingers;
	}

	@Column(name = "thigh")
	public String getThigh() {
		return thigh;
	}

	@Column(name = "leg")
	public String getLeg() {
		return leg;
	}

	@Column(name = "feet")
	public String getFeet() {
		return feet;
	}

	@Column(name = "skinScore")
	public String getSkinScore() {
		return skinScore;
	}

	// self assessment
	@Column(name = "cardiacOrPulmonary")
	public String getCardiacOrPulmonary() {
		return cardiacOrPulmonary;
	}

	@Column(name = "gastrointestinal")
	public String getGastrointestinal() {
		return gastrointestinal;
	}

	@Column(name = "renal")
	public String getRenal() {
		return renal;
	}

	@Column(name = "plans")
	public String getPlans() {
		return plans;
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

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public void setBloodPressure(String bloodPressure) {
		this.bloodPressure = bloodPressure;
	}

	public void setHgbOrHct(String hgbOrHct) {
		HgbOrHct = hgbOrHct;
	}

	public void setWBC(String wBC) {
		WBC = wBC;
	}

	public void setPlatelet(String platelet) {
		this.platelet = platelet;
	}

	public void setESRorCRP(String eSRorCRP) {
		ESRorCRP = eSRorCRP;
	}

	public void setALTorAST(String aLTorAST) {
		ALTorAST = aLTorAST;
	}

	public void setOtherData(String otherData) {
		this.otherData = otherData;
	}

	public void setFace(String face) {
		this.face = face;
	}

	public void setAnteriorChest(String anteriorChest) {
		this.anteriorChest = anteriorChest;
	}

	public void setUpperArm(String upperArm) {
		this.upperArm = upperArm;
	}

	public void setAbdomen(String abdomen) {
		this.abdomen = abdomen;
	}

	public void setForeArm(String foreArm) {
		this.foreArm = foreArm;
	}

	public void setHand(String hand) {
		this.hand = hand;
	}

	public void setFingers(String fingers) {
		this.fingers = fingers;
	}

	public void setThigh(String thigh) {
		this.thigh = thigh;
	}

	public void setLeg(String leg) {
		this.leg = leg;
	}

	public void setFeet(String feet) {
		this.feet = feet;
	}

	public void setSkinScore(String skinScore) {
		this.skinScore = skinScore;
	}

	public void setCardiacOrPulmonary(String cardiacOrPulmonary) {
		this.cardiacOrPulmonary = cardiacOrPulmonary;
	}

	public void setGastrointestinal(String gastrointestinal) {
		this.gastrointestinal = gastrointestinal;
	}

	public void setRenal(String renal) {
		this.renal = renal;
	}

	public void setPlans(String plans) {
		this.plans = plans;
	}

}
