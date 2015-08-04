package com.ust.emr.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ust.emr.util1.encryption;

@Entity
@Table(name = "tbl_disease")
public class Disease {
	private Long id;
	private String name;
	private String description;
	private String type;
	private String stage0Desc;
	private String stage1Desc;
	private String stage2Desc;
	private String stage3Desc;
	private String stage4Desc;
	
	public Disease(){}
	public Disease(Disease disease){
		this.setDescription(disease.description);
		this.setId(disease.id);
		this.setName(disease.name);
		this.setStage0Desc(disease.stage0Desc);
		this.setStage1Desc(disease.stage1Desc);
		this.setStage2Desc(disease.stage2Desc);
		this.setStage3Desc(disease.stage3Desc);
		this.setStage4Desc(disease.stage4Desc);
		this.setType(disease.type);
	}
	
	

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_disease")
	public Long getId() {
		return id;
	}

	@Column(name = "fld_name")
	public String getName() {
		return name;
	}

	@Column(name = "fld_description")
	public String getDescription() {
		return description;
	}

	@Column(name = "fld_type")
	public String getType() {
		return type;
	}

	@Column(name = "fld_stage0_desc")
	public String getStage0Desc() {
		return stage0Desc;
	}

	@Column(name = "fld_stage1_desc")
	public String getStage1Desc() {
		return stage1Desc;
	}

	@Column(name = "fld_stage2_desc")
	public String getStage2Desc() {
		return stage2Desc;
	}

	@Column(name = "fld_stage3_desc")
	public String getStage3Desc() {
		return stage3Desc;
	}

	@Column(name = "fld_stage4_desc")
	public String getStage4Desc() {
		return stage4Desc;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setStage0Desc(String stage0Desc) {
		this.stage0Desc = stage0Desc;
	}

	public void setStage1Desc(String stage1Desc) {
		this.stage1Desc = stage1Desc;
	}

	public void setStage2Desc(String stage2Desc) {
		this.stage2Desc = stage2Desc;
	}

	public void setStage3Desc(String stage3Desc) {
		this.stage3Desc = stage3Desc;
	}

	public void setStage4Desc(String stage4Desc) {
		this.stage4Desc = stage4Desc;
	}
	public Disease encrypt(){
		encryption aes = new encryption();
		Disease disease = new Disease();
		disease.setId(id);
		disease.setDescription(aes.encrypt(description));
		disease.setName(aes.encrypt(name));
		disease.setStage0Desc(aes.encrypt(stage0Desc));
		disease.setStage1Desc(aes.encrypt(stage1Desc));
		disease.setStage2Desc(aes.encrypt(stage2Desc));
		disease.setStage3Desc(aes.encrypt(stage3Desc));
		disease.setStage4Desc(aes.encrypt(stage4Desc));
		disease.setType(aes.encrypt(type));
		return disease;
	}
	public Disease decrypt(){
		encryption aes = new encryption();
		Disease disease = new Disease();
		disease.setId(id);
		disease.setDescription(aes.decrypt(description));
		disease.setName(aes.decrypt(name));
		disease.setStage0Desc(aes.decrypt(stage0Desc));
		disease.setStage1Desc(aes.decrypt(stage1Desc));
		disease.setStage2Desc(aes.decrypt(stage2Desc));
		disease.setStage3Desc(aes.decrypt(stage3Desc));
		disease.setStage4Desc(aes.decrypt(stage4Desc));
		disease.setType(aes.decrypt(type));
		return disease;
	}
}
