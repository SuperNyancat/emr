package com.ust.emr.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "pe_joint")
public class Joint {
	private Long id;
	private String JointName;
	private boolean pain; // or tender for CDAI and SDAI
	private boolean swelling;
	private String side; // right or left side

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	public String getJointName() {
		return JointName;
	}

	
	public boolean getPain() {
		return pain;
	}

	public boolean getSwelling() {
		return swelling;
	}

	public String getSide() {
		return side;
	}

	/**
	 * setters
	 * */

	public void setId(Long id) {
		this.id = id;
	}

	public void setJointName(String JointName) {
		this.JointName = JointName;
	}

	public void setPain(boolean pain) {
		this.pain = pain;
	}

	public void setSwelling(boolean swelling) {
		this.swelling = swelling;
	}

	public void setSide(String side) {
		this.side = side;
	}

}
