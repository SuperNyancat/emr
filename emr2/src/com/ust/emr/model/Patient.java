package com.ust.emr.model;

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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.ust.emr.model.forms.InflammatoryMyopathFlowSheet;
import com.ust.emr.model.forms.SLEDAACaseReportForm;

@Entity
@Table(name = "tbl_patient")
public class Patient {
	private Long id;
	private Doctor currentDoctor;
	private Doctor previousDoctor;
	private PersonInfo personInfo;
	private boolean isEnabled = true;

	private String maritalStatus;
	// spouse
	private String aliveOrdead;
	private String aliveAge;
	private String deadAge;
	private String majorIllnesses;

	private String birthPlace;
	// education
	private String gradeSchool;
	private String college;
	private String graduateSchool;
	private String hoursWorked;

	private String healthInsurance;
	private String diagnosis;
	private String stage;
	private String relativePath;
	private String fileName;

	// lists
	private List<Appointment> appointments;

	public Patient() {
		super();
		currentDoctor = new Doctor();
		personInfo = new PersonInfo();
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_patient")
	public Long getId() {
		return id;
	}

	@ManyToOne
	@JoinColumn(name = "key_curr_doctor", nullable = false)
	public Doctor getCurrentDoctor() {
		return currentDoctor;
	}

	@Column(name = "fld_is_enabled")
	public boolean isEnabled() {
		return isEnabled;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "key_person_info")
	public PersonInfo getPersonInfo() {
		return personInfo;
	}

	@ManyToOne
	@JoinColumn(name = "key_prev_doctor", nullable = true)
	public Doctor getPreviousDoctor() {
		return previousDoctor;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "patient")
	public List<Appointment> getAppointments() {
		return appointments;
	}

	@Column(name = "fld_health_insurance")
	public String getHealthInsurance() {
		return healthInsurance;
	}

	@Column(name = "fld_diagnosis")
	public String getDiagnosis() {
		return diagnosis;
	}

	@Column(name = "fld_relative_path")
	public String getRelativePath() {
		return relativePath;
	}

	@Column(name = "fld_filename")
	public String getFileName() {
		return fileName;
	}

	@Column(name = "fld_stage")
	public String getStage() {
		return stage;
	}

	public String getAliveAge() {
		return aliveAge;
	}

	public String getDeadAge() {
		return deadAge;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public String getAliveOrdead() {
		return aliveOrdead;
	}

	public String getMajorIllnesses() {
		return majorIllnesses;
	}

	public String getBirthPlace() {
		return birthPlace;
	}

	public String getGradeSchool() {
		return gradeSchool;
	}

	public String getCollege() {
		return college;
	}

	public String getGraduateSchool() {
		return graduateSchool;
	}

	public String getHoursWorked() {
		return hoursWorked;
	}

	/**
	 * SETTERS
	 * */

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public void setAliveOrdead(String aliveOrdead) {
		this.aliveOrdead = aliveOrdead;
	}

	
	public void setMajorIllnesses(String majorIllnesses) {
		this.majorIllnesses = majorIllnesses;
	}

	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}

	public void setGradeSchool(String gradeSchool) {
		this.gradeSchool = gradeSchool;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public void setGraduateSchool(String graduateSchool) {
		this.graduateSchool = graduateSchool;
	}

	public void setHoursWorked(String hoursWorked) {
		this.hoursWorked = hoursWorked;
	}

	public void setPersonInfo(PersonInfo personInfo) {
		this.personInfo = personInfo;
	}

	public void setStage(String stage) {
		this.stage = stage;
	}

	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	public void setRelativePath(String relativePath) {
		this.relativePath = relativePath;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setHealthInsurance(String healthInsurance) {
		this.healthInsurance = healthInsurance;
	}

	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setCurrentDoctor(Doctor doctor) {
		this.currentDoctor = doctor;
	}

	public void setPreviousDoctor(Doctor previousDoctor) {
		this.previousDoctor = previousDoctor;
	}

	public void setAppointments(List<Appointment> appointments) {
		this.appointments = appointments;
	}

	public void setAliveAge(String aliveAge) {
		this.aliveAge = aliveAge;
	}

	public void setDeadAge(String deadAge) {
		this.deadAge = deadAge;
	}
}
