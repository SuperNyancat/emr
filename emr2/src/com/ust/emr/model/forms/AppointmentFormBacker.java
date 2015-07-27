package com.ust.emr.model.forms;

public class AppointmentFormBacker {
	private long id;
	private Long patient;
	private String title;
	private String details;
	private String month;
	private String day;
	private String year;
	private String start_hour;
	private String start_minute;
	private String end_hour;
	private String end_minute;
	private String end_ampm;
	private String start_ampm;
	private Long doctor;
	
	public AppointmentFormBacker() {}

	public AppointmentFormBacker(String title, String details, String month,
			String day, String year, String start_hour, String start_minute,
			String end_hour, String end_minute, String end_ampm,
			String start_ampm, Long doctor) {
		super();
		this.title = title;
		this.details = details;
		this.month = month;
		this.day = day;
		this.year = year;
		this.start_hour = start_hour;
		this.start_minute = start_minute;
		this.end_hour = end_hour;
		this.end_minute = end_minute;
		this.end_ampm = end_ampm;
		this.start_ampm = start_ampm;
		this.doctor = doctor;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public String getDetails() {
		return details;
	}

	public String getMonth() {
		return month;
	}

	public String getDay() {
		return day;
	}

	public String getYear() {
		return year;
	}

	public String getStart_hour() {
		return start_hour;
	}

	public String getStart_minute() {
		return start_minute;
	}

	public String getEnd_hour() {
		return end_hour;
	}

	public String getEnd_minute() {
		return end_minute;
	}

	public String getEnd_ampm() {
		return end_ampm;
	}

	public Long getDoctor() {
		return doctor;
	}

	public void setDoctor(Long doctor) {
		this.doctor = doctor;
	}

	public String getStart_ampm() {
		return start_ampm;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public void setStart_hour(String start_hour) {
		this.start_hour = start_hour;
	}

	public void setStart_minute(String start_minute) {
		this.start_minute = start_minute;
	}

	public void setEnd_hour(String end_hour) {
		this.end_hour = end_hour;
	}

	public void setEnd_minute(String end_minute) {
		this.end_minute = end_minute;
	}

	public void setEnd_ampm(String end_ampm) {
		this.end_ampm = end_ampm;
	}

	public void setStart_ampm(String start_ampm) {
		this.start_ampm = start_ampm;
	}

	public Long getPatient() {
		return patient;
	}

	public void setPatient(Long patient) {
		this.patient = patient;
	}
	
	

}
