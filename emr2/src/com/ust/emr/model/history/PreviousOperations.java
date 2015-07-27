package com.ust.emr.model.history;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "ih_previous_operations")
public class PreviousOperations {
	private Long id;
	private List<Operation> previousOperations;
	private String fractures;
	private String fracturesDescriptions;
	private String injuries;
	private String injuriesDescriptions;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "ih_prevoperations", joinColumns = { @JoinColumn(name = "prevop_id") }, inverseJoinColumns = { @JoinColumn(name = "operations_id") })
	@Fetch(value = FetchMode.SUBSELECT)
	public List<Operation> getPreviousOperations() {
		return previousOperations;
	}

	@Column(name = "fractures")
	public String getFractures() {
		return fractures;
	}

	@Column(name = "fracturesDescriptions")
	public String getFracturesDescriptions() {
		return fracturesDescriptions;
	}

	@Column(name = "injuries")
	public String getInjuries() {
		return injuries;
	}

	@Column(name = "injuriesDescriptions")
	public String getInjuriesDescriptions() {
		return injuriesDescriptions;
	}

	/**
	 * setters
	 * */
	
	public void setId(Long id) {
		this.id = id;
	}

	public void setPreviousOperations(List<Operation> previousOperations) {
		this.previousOperations = previousOperations;
	}

	public void setFractures(String fractures) {
		this.fractures = fractures;
	}

	public void setFracturesDescriptions(String fracturesDescriptions) {
		this.fracturesDescriptions = fracturesDescriptions;
	}

	public void setInjuries(String injuries) {
		this.injuries = injuries;
	}

	public void setInjuriesDescriptions(String injuriesDescriptions) {
		this.injuriesDescriptions = injuriesDescriptions;
	}

}
