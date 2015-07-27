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
@Table(name = "tbl_transaction")
public class Transaction {
	private Long id;
	private Patient patient;
	private Doctor doctor;
	private RevisionHistory revisionHistory;

	private boolean hasHMO;
	private String receiptNumber;
	private String balance;
	private String amount;
	private String tinNumber;

	private String[] service = new String[10];

	private String[] charges = new String[10];
	private String[] payment = new String[10];

	public Transaction() {

	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_transaction")
	public Long getId() {
		return id;
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

	@Column(name = "receiptNumber")
	public String getReceiptNumber() {
		return receiptNumber;
	}

	@Column(name = "balance")
	public String getBalance() {
		return balance;
	}

	@Column(name = "service")
	public String[] getService() {
		return service;
	}

	@Column(name = "charges")
	public String[] getCharges() {
		return charges;
	}

	@Column(name = "payment")
	public String[] getPayment() {
		return payment;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "revisionHistory_id")
	public RevisionHistory getRevisionHistory() {
		return revisionHistory;
	}

	@Column(name = "tinNumber")
	public String getTinNumber() {
		return tinNumber;
	}

	@Column(name = "amount")
	public String getAmount() {
		return amount;
	}

	public boolean isHasHMO() {
		return hasHMO;
	}

	/**
	 * setters
	 * */

	public void setHasHMO(boolean hasHMO) {
		this.hasHMO = hasHMO;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public void setTinNumber(String tinNumber) {
		this.tinNumber = tinNumber;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public void setReceiptNumber(String receiptNumber) {
		this.receiptNumber = receiptNumber;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}

	public void setRevisionHistory(RevisionHistory revisionHistory) {
		this.revisionHistory = revisionHistory;
	}

	public void setService(String[] service) {
		this.service = service;
	}

	public void setCharges(String[] charges) {
		this.charges = charges;
	}

	public void setPayment(String[] payment) {
		this.payment = payment;
	}

}
