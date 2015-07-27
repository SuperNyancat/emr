package com.ust.emr.model;

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

@Entity
@Table(name = "pe_patient_assessment")
public class PatientAssessment {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;
	
	// activity level
	private String dressing;
	private String bed;
	private String liftCup;
	private String walkOutdoors;
	private String washBody;
	private String bendDown;
	private String turnFaucets;
	private String getInVehicle;
	private String walkTwoMiles;
	private String games;
	private String sleep;
	private String anxiety;
	private String depression;
	// scores
	private String GL;
	private String PN;
	private String FN;

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

	

	@Column(name = "dressing")
	public String getDressing() {
		return dressing;
	}

	@Column(name = "bed")
	public String getBed() {
		return bed;
	}

	@Column(name = "liftCup")
	public String getLiftCup() {
		return liftCup;
	}

	@Column(name = "walkOutdoors")
	public String getWalkOutdoors() {
		return walkOutdoors;
	}

	@Column(name = "washBody")
	public String getWashBody() {
		return washBody;
	}

	@Column(name = "bendDown")
	public String getBendDown() {
		return bendDown;
	}

	@Column(name = "turnFaucets")
	public String getTurnFaucets() {
		return turnFaucets;
	}

	@Column(name = "getInVehicle")
	public String getGetInVehicle() {
		return getInVehicle;
	}

	@Column(name = "walkTwoMiles")
	public String getWalkTwoMiles() {
		return walkTwoMiles;
	}

	@Column(name = "games")
	public String getGames() {
		return games;
	}

	@Column(name = "sleep")
	public String getSleep() {
		return sleep;
	}

	@Column(name = "anxiety")
	public String getAnxiety() {
		return anxiety;
	}

	@Column(name = "depression")
	public String getDepression() {
		return depression;
	}

	@Column(name = "GL")
	public String getGL() {
		return GL;
	}

	@Column(name = "PN")
	public String getPN() {
		return PN;
	}

	@Column(name = "FN")
	public String getFN() {
		return FN;
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

	

	public void setDressing(String dressing) {
		this.dressing = dressing;
	}

	public void setBed(String bed) {
		this.bed = bed;
	}

	public void setLiftCup(String liftCup) {
		this.liftCup = liftCup;
	}

	public void setWalkOutdoors(String walkOutdoors) {
		this.walkOutdoors = walkOutdoors;
	}

	public void setWashBody(String washBody) {
		this.washBody = washBody;
	}

	public void setBendDown(String bendDown) {
		this.bendDown = bendDown;
	}

	public void setTurnFaucets(String turnFaucets) {
		this.turnFaucets = turnFaucets;
	}

	public void setGetInVehicle(String getInVehicle) {
		this.getInVehicle = getInVehicle;
	}

	public void setWalkTwoMiles(String walkTwoMiles) {
		this.walkTwoMiles = walkTwoMiles;
	}

	public void setGames(String games) {
		this.games = games;
	}

	public void setSleep(String sleep) {
		this.sleep = sleep;
	}

	public void setAnxiety(String anxiety) {
		this.anxiety = anxiety;
	}

	public void setDepression(String depression) {
		this.depression = depression;
	}

	public void setGL(String gL) {
		GL = gL;
	}

	public void setPN(String pN) {
		PN = pN;
	}

	public void setFN(String fN) {
		FN = fN;
	}

}
