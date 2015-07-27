package com.ust.emr.model.forms;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "form_pasi_detail")
public class PASIDetail {
	private Long id;
	private String identifier; // plaque characteristic, area, sumA, subtotalsC,
								// totalsD
	private int head;
	private int upperLimbs;
	private int trunk;
	private int lowerLimbs;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	public String getIdentifier() {
		return identifier;
	}

	public int getHead() {
		return head;
	}

	public int getUpperLimbs() {
		return upperLimbs;
	}

	public int getTrunk() {
		return trunk;
	}

	public int getLowerLimbs() {
		return lowerLimbs;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setIdentifier(String identifier) {
		this.identifier = identifier;
	}

	public void setHead(int head) {
		this.head = head;
	}

	public void setUpperLimbs(int upperLimbs) {
		this.upperLimbs = upperLimbs;
	}

	public void setTrunk(int trunk) {
		this.trunk = trunk;
	}

	public void setLowerLimbs(int lowerLimbs) {
		this.lowerLimbs = lowerLimbs;
	}

}
