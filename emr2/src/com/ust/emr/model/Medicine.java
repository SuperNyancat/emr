package com.ust.emr.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.ust.emr.util1.encryption;

@Entity
@Table(name = "tbl_medicines")
public class Medicine {
	private Long id;
	private String brandName;
	private String genericName;
	private String uses;
	private String sideEffects;
	

	// Revision History
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_medicine")
	public Long getId() {
		return id;
	}

	@Column(name = "fld_brand_name")
	public String getBrandName() {
		return brandName;
	}

	@Column(name = "fld_generic_name")
	public String getGenericName() {
		return genericName;
	}

	@Column(name = "fld_uses")
	public String getUses() {
		return uses;
	}

	@Column(name = "fld_side_effects")
	public String getSideEffects() {
		return sideEffects;
	}
	
	
	
	

	@Override
	public String toString() {
		return "Medicine [id=" + id + ", brandName=" + brandName
				+ ", genericName=" + genericName + ", uses=" + uses
				+ ", sideEffects=" + sideEffects + "]";
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public void setGenericName(String genericName) {
		this.genericName = genericName;
	}

	public void setUses(String uses) {
		this.uses = uses;
	}

	public void setSideEffects(String sideEffects) {
		this.sideEffects = sideEffects;
	}
	
	Medicine encrypt(){
		encryption aes = new encryption();
		Medicine medicine = new Medicine();
		medicine.setId(id);
		medicine.setBrandName(aes.encrypt(brandName));
		medicine.setGenericName(aes.encrypt(genericName));
		medicine.setSideEffects(aes.encrypt(sideEffects));
		medicine.setUses(aes.encrypt(uses));
		return medicine;
	}
	Medicine decrypt(){
		encryption aes = new encryption();
		Medicine medicine = new Medicine();
		medicine.setId(id);
		medicine.setBrandName(aes.decrypt(brandName));
		medicine.setGenericName(aes.decrypt(genericName));
		medicine.setSideEffects(aes.decrypt(sideEffects));
		medicine.setUses(aes.decrypt(uses));
		return medicine;
	}
}
