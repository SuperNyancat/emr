package com.ust.emr.model.forms;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "form_partsofbody")
public class PartsOfBody {
	private Long id;
	private String bodyPart;
	private String side; //left or right for upperarm, forearm etc.
	private int score;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	public String getBodyPart() {
		return bodyPart;
	}

	public String getSide() {
		return side;
	}

	public int getScore() {
		return score;
	}

	/**
	 * setters
	 * */
	
	public void setId(Long id) {
		this.id = id;
	}

	public void setBodyPart(String bodyPart) {
		this.bodyPart = bodyPart;
	}

	public void setSide(String side) {
		this.side = side;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	
}
