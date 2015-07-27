package com.ust.emr.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

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

}
