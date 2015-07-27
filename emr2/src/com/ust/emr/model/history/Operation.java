package com.ust.emr.model.history;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ih_operation")
public class Operation {
	private Long id;
	private String type;
	private String year;
	private String reason;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@Column(name = "type")
	public String getType() {
		return type;
	}

	@Column(name = "year")
	public String getYear() {
		return year;
	}

	@Column(name = "reason")
	public String getReason() {
		return reason;
	}

	/**
	 * setters
	 * */
	public void setId(Long id) {
		this.id = id;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}
