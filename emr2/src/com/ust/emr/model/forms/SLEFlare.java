package com.ust.emr.model.forms;

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

import com.ust.emr.model.Comment;
import com.ust.emr.model.Patient;
import com.ust.emr.model.RevisionHistory;

@Entity
@Table(name = "form_SLE_flare")
public class SLEFlare {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;

	private String[] checkbox;

	private boolean mildOrMod_row1;
	private boolean mildOrMod_row2;
	private boolean mildOrMod_row3;
	private boolean mildOrMod_row4;
	private boolean mildOrMod_row5;

	private boolean severe_row1;
	private boolean severe_row2;
	private boolean severe_row3;
	private boolean severe_row4;
	private boolean severe_row5;



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

	@Column(name = "checkbox")
	public String[] getCheckbox() {
		return checkbox;
	}

	@Column(name = "mildOrMod_row1")
	public boolean isMildOrMod_row1() {
		return mildOrMod_row1;
	}

	@Column(name = "mildOrMod_row2")
	public boolean isMildOrMod_row2() {
		return mildOrMod_row2;
	}

	@Column(name = "mildOrMod_row3")
	public boolean isMildOrMod_row3() {
		return mildOrMod_row3;
	}

	@Column(name = "mildOrMod_row4")
	public boolean isMildOrMod_row4() {
		return mildOrMod_row4;
	}

	@Column(name = "mildOrMod_row5")
	public boolean isMildOrMod_row5() {
		return mildOrMod_row5;
	}

	@Column(name = "severe_row1")
	public boolean isSevere_row1() {
		return severe_row1;
	}

	@Column(name = "severe_row2")
	public boolean isSevere_row2() {
		return severe_row2;
	}

	@Column(name = "severe_row3")
	public boolean isSevere_row3() {
		return severe_row3;
	}

	@Column(name = "severe_row4")
	public boolean isSevere_row4() {
		return severe_row4;
	}

	@Column(name = "severe_row5")
	public boolean isSevere_row5() {
		return severe_row5;
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

	public void setCheckbox(String[] checkbox) {
		this.checkbox = checkbox;
	}

	public void setMildOrMod_row1(boolean mildOrMod_row1) {
		this.mildOrMod_row1 = mildOrMod_row1;
	}

	public void setMildOrMod_row2(boolean mildOrMod_row2) {
		this.mildOrMod_row2 = mildOrMod_row2;
	}

	public void setMildOrMod_row3(boolean mildOrMod_row3) {
		this.mildOrMod_row3 = mildOrMod_row3;
	}

	public void setMildOrMod_row4(boolean mildOrMod_row4) {
		this.mildOrMod_row4 = mildOrMod_row4;
	}

	public void setMildOrMod_row5(boolean mildOrMod_row5) {
		this.mildOrMod_row5 = mildOrMod_row5;
	}

	public void setSevere_row1(boolean severe_row1) {
		this.severe_row1 = severe_row1;
	}

	public void setSevere_row2(boolean severe_row2) {
		this.severe_row2 = severe_row2;
	}

	public void setSevere_row3(boolean severe_row3) {
		this.severe_row3 = severe_row3;
	}

	public void setSevere_row4(boolean severe_row4) {
		this.severe_row4 = severe_row4;
	}

	public void setSevere_row5(boolean severe_row5) {
		this.severe_row5 = severe_row5;
	}

}
