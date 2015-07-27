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

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.joda.time.LocalTime;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "tbl_appointment")
public class Appointment {

	private Long id;
	private String title;
	private String details;
	private Patient patient;
	private Doctor doctor;
	private LocalDate date;
	private LocalTime startTime;
	private LocalTime endTime;
	
	private RevisionHistory revisionHistory;
	
	
	
	public Appointment() {}

	
	

	public Appointment(String title, String details, LocalDate date, LocalTime startTime,
			LocalTime endTime) {
		super();
		this.title = title;
		this.details = details;
		this.date = date;
		this.startTime = startTime;
		this.endTime = endTime;
	}




	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_appointment")
	public Long getId() {
		return id;
	}

	@Column(name = "fld_title")
	public String getTitle() {
		return title;
	}

	@ManyToOne
	@JoinColumn(name = "key_patient", nullable = false)
	public Patient getPatient() {
		return patient;
	}

	@ManyToOne
	@JoinColumn(name = "key_doctor", nullable = false)
	public Doctor getDoctor() {
		return doctor;
	}

	@Column(name = "fld_date")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalDate")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	public LocalDate getDate() {
		return date;
	}

	@Column(name = "fld_start_time")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalTimeAsTime")
	@DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
	public LocalTime getStartTime() {
		return startTime;
	}

	@Column(name = "fld_end_time")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalTimeAsTime")
	@DateTimeFormat(iso = DateTimeFormat.ISO.TIME)
	public LocalTime getEndTime() {
		return endTime;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "revisionHistory_id")
	public RevisionHistory getRevisionHistory() {
		return revisionHistory;
	}

	@Column(name = "fld_details")
	public String getDetails() {
		return details;
	}

	

	/**
	 * SETTERS
	 * */
	public void setDetails(String details) {
		this.details = details;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public void setStartTime(LocalTime startTime) {
		this.startTime = startTime;
	}

	public void setEndTime(LocalTime endTime) {
		this.endTime = endTime;
	}

	public void setRevisionHistory(RevisionHistory revisionHistory) {
		this.revisionHistory = revisionHistory;
	}

}
