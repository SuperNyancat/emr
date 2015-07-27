package com.ust.emr.model;

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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "tbl_archives")
public class Archives {
	private Long id;
//	private List<Images> images;
	private Patient patient;
//	private CommonsM
	
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_archive")
	public Long getId() {
		return id;
	}

	@ManyToOne
	@JoinColumn(name = "key_patient", nullable = false)
	public Patient getPatient() {
		return patient;
	}

//	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
//	@JoinTable(name = "tbl_archive_image", joinColumns = { @JoinColumn(name = "archive_id") }, inverseJoinColumns = { @JoinColumn(name = "image_id") })
//	@Fetch(value = FetchMode.SUBSELECT)
//	@OneToMany(fetch = FetchType.LAZY, mappedBy="currentDoctor")
//	public List<Images> getImages() {
//		return images;
//	}

	


	/**
	 * setters
	 * */

	public void setId(Long id) {
		this.id = id;
	}

//	public void setImages(List<Images> images) {
//		this.images = images;
//	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	
	
}
