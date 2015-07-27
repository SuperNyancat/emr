package com.ust.emr.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_medications")
public class Medication {
	private Long id;
//	private MedicationsAndPrescriptions medicationsAndPrescriptions;

	private String genericName;
	private String brandName;
	private String dosage;
	private String duration;
	private String otherDetails;
	
	public Medication(){}

	public Medication(String genericName, String brandName, String dosage,
			String duration, String otherDetails) {
		super();
		this.genericName = genericName;
		this.brandName = brandName;
		this.dosage = dosage;
		this.duration = duration;
		this.otherDetails = otherDetails;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_medication")
	public Long getId() {
		return id;
	}

	@Column(name = "fld_generic_name")
	public String getGenericName() {
		return genericName;
	}

	@Column(name = "fld_brand_name")
	public String getBrandName() {
		return brandName;
	}

	@Column(name = "fld_dosage")
	public String getDosage() {
		return dosage;
	}

	@Column(name = "fld_duration")
	public String getDuration() {
		return duration;
	}

	@Column(name = "fld_other_details")
	public String getOtherDetails() {
		return otherDetails;
	}

	
//	@ManyToMany(mappedBy = "medications")
////	@JoinColumn(name = "key_med_pres_form", nullable = false)
//	public MedicationsAndPrescriptions getMedicationsAndPrescriptions() {
//		return medicationsAndPrescriptions;
//	}
//
//	/**
//	 * SETTERS
//	 * */
//	public void setMedicationsAndPrescriptions(
//			MedicationsAndPrescriptions medicationsAndPrescriptions) {
//		this.medicationsAndPrescriptions = medicationsAndPrescriptions;
//	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setGenericName(String genericName) {
		this.genericName = genericName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public void setDosage(String dosage) {
		this.dosage = dosage;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public void setOtherDetails(String otherDetails) {
		this.otherDetails = otherDetails;
	}



}
