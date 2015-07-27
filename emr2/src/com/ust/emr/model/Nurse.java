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
@Table(name = "tbl_nurse")
public class Nurse {
	private Long id;
	private User user;
	private PersonInfo personInfo;
	private String employeeId;
	private String relativePath;
	private String fileName;
	private String licenseNumber;
	
	
	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
	}
	
	public String getLicenseNumber() {
		return licenseNumber;
	}
	
	public Nurse() {
		personInfo = new PersonInfo();
	}

	public Nurse(User user) {
		super();
		this.user = user;
	}

	@Override
	public String toString() {
		return "Nurse [id=" + id + ", user=" + user + ", personInfo="
				+ personInfo + "]";
	}

	public Nurse(User user, PersonInfo personInfo) {
		super();
		this.user = user;
		this.personInfo = personInfo;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "key_user")
	public User getUser() {
		return user;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_nurse")
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

	public void setPersonInfo(PersonInfo personInfo) {
		this.personInfo = personInfo;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public void setRelativePath(String relativePath) {
		this.relativePath = relativePath;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	

}