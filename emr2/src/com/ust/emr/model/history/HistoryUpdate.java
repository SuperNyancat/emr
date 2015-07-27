package com.ust.emr.model.history;

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
@Table(name = "uh_histo_update")
public class HistoryUpdate {
	private Long id;
	private RevisionHistory revisionHistory;
	private Patient patient;
	// since last visit
	private String illness;
	private String illness_specify;
	private String healthCare;
	private String healthCare_specify;
	private String xrayLab;
	private String xrayLab_specify;
	private String familyHistoChange;
	private String familyHistoChange_specify;
	private String socialHistoChange;
	private String socialHistoChange_specify;
	private String newAllergies;
	private String newAllergies_specify;
	private String medsChange;
	private String medsChange_specify;
	// 1st table
	private String relativesDiseases;
	private String socialChanges;
	private String allergiesOrReactions;
	// 2nd table
	private List<MedsUpdate> medsUpdates;
	// how do you feel today
	private String pain;
	private String swelling;
	private String fatigue;
	private String ringingInEars;
	private String stomachUpset;
	private String skinRash;
	private String bruising;
	private String difficultySleeping;
	private String cough;
	private String eyesRed;
	private String chestPain;
	private String fever;
	private String oralUlcers;
	private String diarrhea;
	private String skinUlcers;
	private String swollenGlands;
	private String headache;
	private String shortnessOfBreath;
	private String eyesDry;
	private String heartPalpitations;
	private String weightLoss;
	private String overallAssessment;

	private int morningStiffness;
	private String worstJoint;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "revisionHistory_id")
	public RevisionHistory getRevisionHistory() {
		return revisionHistory;
	}

	@ManyToOne
	@JoinColumn(name = "patient_id", nullable = false)
	public Patient getPatient() {
		return patient;
	}

	@Column(name = "illness")
	public String getIllness() {
		return illness;
	}

	@Column(name = "illness_specify")
	public String getIllness_specify() {
		return illness_specify;
	}

	@Column(name = "healthCare")
	public String getHealthCare() {
		return healthCare;
	}

	@Column(name = "healthCare_specify")
	public String getHealthCare_specify() {
		return healthCare_specify;
	}

	@Column(name = "xrayLab")
	public String getXrayLab() {
		return xrayLab;
	}

	@Column(name = "xrayLab_specify")
	public String getXrayLab_specify() {
		return xrayLab_specify;
	}

	@Column(name = "familyHistoChange")
	public String getFamilyHistoChange() {
		return familyHistoChange;
	}

	@Column(name = "familyHistoChange_specify")
	public String getFamilyHistoChange_specify() {
		return familyHistoChange_specify;
	}

	@Column(name = "socialHistoChange")
	public String getSocialHistoChange() {
		return socialHistoChange;
	}

	@Column(name = "socialHistoChange_specify")
	public String getSocialHistoChange_specify() {
		return socialHistoChange_specify;
	}

	@Column(name = "newAllergies")
	public String getNewAllergies() {
		return newAllergies;
	}

	@Column(name = "newAllergies_specify")
	public String getNewAllergies_specify() {
		return newAllergies_specify;
	}

	@Column(name = "medsChange")
	public String getMedsChange() {
		return medsChange;
	}

	@Column(name = "medsChange_specify")
	public String getMedsChange_specify() {
		return medsChange_specify;
	}

	@Column(name = "relativesDiseases")
	public String getRelativesDiseases() {
		return relativesDiseases;
	}

	@Column(name = "socialChanges")
	public String getSocialChanges() {
		return socialChanges;
	}

	@Column(name = "allergiesOrReactions")
	public String getAllergiesOrReactions() {
		return allergiesOrReactions;
	}

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "uh_meds", joinColumns = { @JoinColumn(name = "histo_update_id") }, inverseJoinColumns = { @JoinColumn(name = "meds_id") })
	@Fetch(value = FetchMode.SUBSELECT)
	public List<MedsUpdate> getMedsUpdates() {
		return medsUpdates;
	}

	@Column(name = "pain")
	public String getPain() {
		return pain;
	}

	@Column(name = "swelling")
	public String getSwelling() {
		return swelling;
	}

	@Column(name = "fatigue")
	public String getFatigue() {
		return fatigue;
	}

	@Column(name = "ringingInEars")
	public String getRingingInEars() {
		return ringingInEars;
	}

	@Column(name = "stomachUpset")
	public String getStomachUpset() {
		return stomachUpset;
	}

	@Column(name = "skinRash")
	public String getSkinRash() {
		return skinRash;
	}

	@Column(name = "bruising")
	public String getBruising() {
		return bruising;
	}

	@Column(name = "difficultySleeping")
	public String getDifficultySleeping() {
		return difficultySleeping;
	}

	@Column(name = "cough")
	public String getCough() {
		return cough;
	}

	@Column(name = "eyesRed")
	public String getEyesRed() {
		return eyesRed;
	}

	@Column(name = "chestPain")
	public String getChestPain() {
		return chestPain;
	}

	@Column(name = "fever")
	public String getFever() {
		return fever;
	}

	@Column(name = "oralUlcers")
	public String getOralUlcers() {
		return oralUlcers;
	}

	@Column(name = "diarrhea")
	public String getDiarrhea() {
		return diarrhea;
	}

	@Column(name = "skinUlcers")
	public String getSkinUlcers() {
		return skinUlcers;
	}

	@Column(name = "swollenGlands")
	public String getSwollenGlands() {
		return swollenGlands;
	}

	@Column(name = "headache")
	public String getHeadache() {
		return headache;
	}

	@Column(name = "shortnessOfBreath")
	public String getShortnessOfBreath() {
		return shortnessOfBreath;
	}

	@Column(name = "eyesDry")
	public String getEyesDry() {
		return eyesDry;
	}

	@Column(name = "heartPalpitations")
	public String getHeartPalpitations() {
		return heartPalpitations;
	}

	@Column(name = "weightLoss")
	public String getWeightLoss() {
		return weightLoss;
	}

	@Column(name = "overallAssessment")
	public String getOverallAssessment() {
		return overallAssessment;
	}

	@Column(name = "morningStiffness")
	public int getMorningStiffness() {
		return morningStiffness;
	}

	@Column(name = "worstJoint")
	public String getWorstJoint() {
		return worstJoint;
	}

	/**
	 * setters
	 * */

	public void setId(Long id) {
		this.id = id;
	}

	public void setRevisionHistory(RevisionHistory revisionHistory) {
		this.revisionHistory = revisionHistory;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public void setIllness(String illness) {
		this.illness = illness;
	}

	public void setIllness_specify(String illness_specify) {
		this.illness_specify = illness_specify;
	}

	public void setHealthCare(String healthCare) {
		this.healthCare = healthCare;
	}

	public void setHealthCare_specify(String healthCare_specify) {
		this.healthCare_specify = healthCare_specify;
	}

	public void setXrayLab(String xrayLab) {
		this.xrayLab = xrayLab;
	}

	public void setXrayLab_specify(String xrayLab_specify) {
		this.xrayLab_specify = xrayLab_specify;
	}

	public void setFamilyHistoChange(String familyHistoChange) {
		this.familyHistoChange = familyHistoChange;
	}

	public void setFamilyHistoChange_specify(String familyHistoChange_specify) {
		this.familyHistoChange_specify = familyHistoChange_specify;
	}

	public void setSocialHistoChange(String socialHistoChange) {
		this.socialHistoChange = socialHistoChange;
	}

	public void setSocialHistoChange_specify(String socialHistoChange_specify) {
		this.socialHistoChange_specify = socialHistoChange_specify;
	}

	public void setNewAllergies(String newAllergies) {
		this.newAllergies = newAllergies;
	}

	public void setNewAllergies_specify(String newAllergies_specify) {
		this.newAllergies_specify = newAllergies_specify;
	}

	public void setMedsChange(String medsChange) {
		this.medsChange = medsChange;
	}

	public void setMedsChange_specify(String medsChange_specify) {
		this.medsChange_specify = medsChange_specify;
	}

	public void setRelativesDiseases(String relativesDiseases) {
		this.relativesDiseases = relativesDiseases;
	}

	public void setSocialChanges(String socialChanges) {
		this.socialChanges = socialChanges;
	}

	public void setAllergiesOrReactions(String allergiesOrReactions) {
		this.allergiesOrReactions = allergiesOrReactions;
	}

	public void setMedsUpdates(List<MedsUpdate> medsUpdates) {
		this.medsUpdates = medsUpdates;
	}

	public void setPain(String pain) {
		this.pain = pain;
	}

	public void setSwelling(String swelling) {
		this.swelling = swelling;
	}

	public void setFatigue(String fatigue) {
		this.fatigue = fatigue;
	}

	public void setRingingInEars(String ringingInEars) {
		this.ringingInEars = ringingInEars;
	}

	public void setStomachUpset(String stomachUpset) {
		this.stomachUpset = stomachUpset;
	}

	public void setSkinRash(String skinRash) {
		this.skinRash = skinRash;
	}

	public void setBruising(String bruising) {
		this.bruising = bruising;
	}

	public void setDifficultySleeping(String difficultySleeping) {
		this.difficultySleeping = difficultySleeping;
	}

	public void setCough(String cough) {
		this.cough = cough;
	}

	public void setEyesRed(String eyesRed) {
		this.eyesRed = eyesRed;
	}

	public void setChestPain(String chestPain) {
		this.chestPain = chestPain;
	}

	public void setFever(String fever) {
		this.fever = fever;
	}

	public void setOralUlcers(String oralUlcers) {
		this.oralUlcers = oralUlcers;
	}

	public void setDiarrhea(String diarrhea) {
		this.diarrhea = diarrhea;
	}

	public void setSkinUlcers(String skinUlcers) {
		this.skinUlcers = skinUlcers;
	}

	public void setSwollenGlands(String swollenGlands) {
		this.swollenGlands = swollenGlands;
	}

	public void setHeadache(String headache) {
		this.headache = headache;
	}

	public void setShortnessOfBreath(String shortnessOfBreath) {
		this.shortnessOfBreath = shortnessOfBreath;
	}

	public void setEyesDry(String eyesDry) {
		this.eyesDry = eyesDry;
	}

	public void setHeartPalpitations(String heartPalpitations) {
		this.heartPalpitations = heartPalpitations;
	}

	public void setWeightLoss(String weightLoss) {
		this.weightLoss = weightLoss;
	}

	public void setOverallAssessment(String overallAssessment) {
		this.overallAssessment = overallAssessment;
	}

	public void setMorningStiffness(int morningStiffness) {
		this.morningStiffness = morningStiffness;
	}

	public void setWorstJoint(String worstJoint) {
		this.worstJoint = worstJoint;
	}

}
