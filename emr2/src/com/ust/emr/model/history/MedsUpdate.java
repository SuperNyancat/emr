package com.ust.emr.model.history;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "uh_meds_update")
public class MedsUpdate {
	private Long id;
	private String name;
	private String status; // new changed stop
	private String changes; // if change
	private String prescriber;
	private String reason;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@Column(name = "name")
	public String getName() {
		return name;
	}

	@Column(name = "status")
	public String getStatus() {
		return status;
	}

	@Column(name = "changes")
	public String getChanges() {
		return changes;
	}

	@Column(name = "prescriber")
	public String getPrescriber() {
		return prescriber;
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

	public void setName(String name) {
		this.name = name;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setChanges(String changes) {
		this.changes = changes;
	}

	public void setPrescriber(String prescriber) {
		this.prescriber = prescriber;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}
