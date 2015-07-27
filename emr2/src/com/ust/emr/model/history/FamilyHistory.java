package com.ust.emr.model.history;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ih_family_history")
public class FamilyHistory {
	private Long id;
	private String f_age;
	private String f_health;
	private String f_ageDeath;
	private String f_cause;
	private String m_age;
	private String m_health;
	private String m_ageDeath;
	private String m_cause;

	private int siblings;
	private int s_living;
	private int s_deceased;
	private int childrenNum;
	private int c_living;
	private int c_deceased;
	private String ages;
	private String healthOfChildren;

	 private String[] bloodRelativesDiseases;
	// relationship of relatives who has had the following diseases
	private String cancer;
	private String leukemia;
	private String stroke;
	private String colitis;
	private String heartDisease;
	private String highBloodPressure;
	private String bleedingTendency;
	private String alcoholism;
	private String rheumaticFever;
	private String epilepsy;
	private String asthma;
	private String psoriasis;
	private String tubercolosis;
	private String diabetes;
	private String goiter;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@Column(name = "f_age")
	public String getF_age() {
		return f_age;
	}

	@Column(name = "f_health")
	public String getF_health() {
		return f_health;
	}

	@Column(name = "f_ageDeath")
	public String getF_ageDeath() {
		return f_ageDeath;
	}

	@Column(name = "f_cause")
	public String getF_cause() {
		return f_cause;
	}

	@Column(name = "m_age")
	public String getM_age() {
		return m_age;
	}

	@Column(name = "m_health")
	public String getM_health() {
		return m_health;
	}

	@Column(name = "m_ageDeath")
	public String getM_ageDeath() {
		return m_ageDeath;
	}

	@Column(name = "m_cause")
	public String getM_cause() {
		return m_cause;
	}

	@Column(name = "siblings")
	public int getSiblings() {
		return siblings;
	}

	@Column(name = "s_living")
	public int getS_living() {
		return s_living;
	}

	@Column(name = "s_deceased")
	public int getS_deceased() {
		return s_deceased;
	}

	@Column(name = "children")
	public int getChildrenNum() {
		return childrenNum;
	}

	@Column(name = "c_living")
	public int getC_living() {
		return c_living;
	}

	@Column(name = "c_deceased")
	public int getC_deceased() {
		return c_deceased;
	}

	@Column(name = "ages")
	public String getAges() {
		return ages;
	}

	@Column(name = "healthOfChildren")
	public String getHealthOfChildren() {
		return healthOfChildren;
	}

	@Column(name = "cancer")
	public String getCancer() {
		return cancer;
	}

	@Column(name = "leukemia")
	public String getLeukemia() {
		return leukemia;
	}

	@Column(name = "stroke")
	public String getStroke() {
		return stroke;
	}

	@Column(name = "colitis")
	public String getColitis() {
		return colitis;
	}

	@Column(name = "heartDisease")
	public String getHeartDisease() {
		return heartDisease;
	}

	@Column(name = "highBloodPressure")
	public String getHighBloodPressure() {
		return highBloodPressure;
	}

	@Column(name = "bleedingTendency")
	public String getBleedingTendency() {
		return bleedingTendency;
	}

	@Column(name = "alcoholism")
	public String getAlcoholism() {
		return alcoholism;
	}

	@Column(name = "rheumaticFever")
	public String getRheumaticFever() {
		return rheumaticFever;
	}

	@Column(name = "epilepsy")
	public String getEpilepsy() {
		return epilepsy;
	}

	@Column(name = "asthma")
	public String getAsthma() {
		return asthma;
	}

	@Column(name = "psoriasis")
	public String getPsoriasis() {
		return psoriasis;
	}

	@Column(name = "tubercolosis")
	public String getTubercolosis() {
		return tubercolosis;
	}

	@Column(name = "diabetes")
	public String getDiabetes() {
		return diabetes;
	}

	@Column(name = "goiter")
	public String getGoiter() {
		return goiter;
	}
		
	@Column(name = "bloodRelativesDiseases")
	public String[] getBloodRelativesDiseases() {
		return bloodRelativesDiseases;
	}

	

	/**
	 * setters
	 * */
	public void setBloodRelativesDiseases(String[] bloodRelativesDiseases) {
		this.bloodRelativesDiseases = bloodRelativesDiseases;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public void setF_age(String f_age) {
		this.f_age = f_age;
	}

	public void setF_health(String f_health) {
		this.f_health = f_health;
	}

	public void setF_ageDeath(String f_ageDeath) {
		this.f_ageDeath = f_ageDeath;
	}

	public void setF_cause(String f_cause) {
		this.f_cause = f_cause;
	}

	public void setM_age(String m_age) {
		this.m_age = m_age;
	}

	public void setM_health(String m_health) {
		this.m_health = m_health;
	}

	public void setM_ageDeath(String m_ageDeath) {
		this.m_ageDeath = m_ageDeath;
	}

	public void setM_cause(String m_cuase) {
		this.m_cause = m_cuase;
	}

	public void setSiblings(int siblings) {
		this.siblings = siblings;
	}

	public void setS_living(int s_living) {
		this.s_living = s_living;
	}

	public void setS_deceased(int s_deceased) {
		this.s_deceased = s_deceased;
	}

	public void setChildrenNum(int children) {
		this.childrenNum = children;
	}

	public void setC_living(int c_living) {
		this.c_living = c_living;
	}

	public void setC_deceased(int c_deceased) {
		this.c_deceased = c_deceased;
	}

	public void setAges(String ages) {
		this.ages = ages;
	}

	public void setHealthOfChildren(String healthOfChildren) {
		this.healthOfChildren = healthOfChildren;
	}

	public void setCancer(String cancer) {
		this.cancer = cancer;
	}

	public void setLeukemia(String leukemia) {
		this.leukemia = leukemia;
	}

	public void setStroke(String stroke) {
		this.stroke = stroke;
	}

	public void setColitis(String colitis) {
		this.colitis = colitis;
	}

	public void setHeartDisease(String heartDisease) {
		this.heartDisease = heartDisease;
	}

	public void setHighBloodPressure(String highBloodPressure) {
		this.highBloodPressure = highBloodPressure;
	}

	public void setBleedingTendency(String bleedingTendency) {
		this.bleedingTendency = bleedingTendency;
	}

	public void setAlcoholism(String alcoholism) {
		this.alcoholism = alcoholism;
	}

	public void setRheumaticFever(String rheumaticFever) {
		this.rheumaticFever = rheumaticFever;
	}

	public void setEpilepsy(String epilepsy) {
		this.epilepsy = epilepsy;
	}

	public void setAsthma(String asthma) {
		this.asthma = asthma;
	}

	public void setPsoriasis(String psoriasis) {
		this.psoriasis = psoriasis;
	}

	public void setTubercolosis(String tubercolosis) {
		this.tubercolosis = tubercolosis;
	}

	public void setDiabetes(String diabetes) {
		this.diabetes = diabetes;
	}

	public void setGoiter(String goiter) {
		this.goiter = goiter;
	}

}
