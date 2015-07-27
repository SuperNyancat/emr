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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "tbl_doctor")
public class Doctor {

	private Long id;
	private String employeeId;
	private PersonInfo personInfo;
	private String licenseNumber;
	private User user;
	private String specialization;
	private String employmentStatus;
	private String suffix;
	// private List<Patient> patients;
	private String officeStart;
	private String officeEnd;
	private String relativePath;
	private String fileName;

	


	
	public Doctor() {
		super();
		user = new User();
		personInfo = new PersonInfo();
	}

	@Column(name = "fld_license_number")
	public String getLicenseNumber() {
		return licenseNumber;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "key_user")
	public User getUser() {
		return user;
	}

	@Column(name = "fld_specialization")
	public String getSpecialization() {
		return specialization;
	}

	@Column(name = "fld_employment_status")
	public String getEmploymentStatus() {
		return employmentStatus;
	}

	@Column(name = "fld_suffix")
	public String getSuffix() {
		return suffix;
	}

	// @OneToMany(fetch = FetchType.LAZY, mappedBy = "currentDoctor")
	// // @JoinColumn(name = "key_patient")
	// // @Fetch(value = FetchMode.SUBSELECT)
	// public List<Patient> getPatients() {
	// return patients;
	// }

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_doctor")
	public Long getId() {
		return id;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "key_person_info")
	public PersonInfo getPersonInfo() {
		return personInfo;
	}

	@Column(name = "fld_employee_id")
	public String getEmployeeId() {
		return employeeId;
	}

	@Column(name = "fld_office_start")
	public String getOfficeStart() {
		return officeStart;
	}

	@Column(name = "fld_office_end")
	public String getOfficeEnd() {
		return officeEnd;
	}

	// @OneToOne
	// @JoinColumn(name = "pic_id")
	// public Image getProfilePicture() {
	// return profilePicture;
	// }
	
	@Column(name = "fld_relative_path")
	public String getRelativePath() {
		return relativePath;
	}
	@Column(name = "fld_filename")
	public String getFileName() {
		return fileName;
	}

	/**
	 * setters
	 * */

	public void setOfficeStart(String officeStart) {
		this.officeStart = officeStart;
	}

	public void setRelativePath(String relativePath) {
		this.relativePath = relativePath;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public void setOfficeEnd(String officeEnd) {
		this.officeEnd = officeEnd;
	}

	public void setPersonInfo(PersonInfo personInfo) {
		this.personInfo = personInfo;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public void setEmploymentStatus(String employmentStatus) {
		this.employmentStatus = employmentStatus;
	}

	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}

	// public void setPatients(List<Patient> patients) {
	// this.patients = patients;
	// }

	// public List<Appointment> getAppointments() {
	// return appointments;
	// }
	//
	// public void setAppointments(List<Appointment> appointments) {
	// this.appointments = appointments;
	// }
	public Doctor(PersonInfo personInfo, String licenseNumber, User user,
			String specialization, String employmentStatus, String suffix) {
		super();
		this.personInfo = personInfo;
		this.licenseNumber = licenseNumber;
		this.user = user;
		this.specialization = specialization;
		this.employmentStatus = employmentStatus;
		this.suffix = suffix;
	}

}
