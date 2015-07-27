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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name = "pe_physician_assessment")
public class PhysicianAssessment {
	private Long id;
	private Patient patient;
	private RevisionHistory revisionHistory;

	private List<Joint> joint;
	private String PGA;

	private double PGA_today;
	private double PGA_baseline;
	private double PGA_percent;
	private int painfulJoints_today;
	private int painfulJoints_baseline;
	private double painfulJoints_percent;
	private int swollenJoints_today;
	private int swollenJoints_baseline;
	private double swollenJoints_percent;
	private int ESR_today;
	private int ESR_baseline;
	private double ESR_percent;

	private String FN_today;
	private String GL_today;
	private String PN_today;
	private String FN_baseline;
	private String GL_baseline;
	private String PN_baseline;
	private double FN_percent;
	private double PN_percent;
	private double GL_percent;

	private boolean painfulJoint_improvement;
	private boolean swollenJoint_improvement;
	private boolean PN_improvement;
	private boolean GL_improvement;
	private boolean PGA_improvement;
	private boolean FN_improvement;
	private boolean ESR_improvement;

	private boolean ACR20;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@ManyToOne
	@JoinColumn(name = "patient_id", nullable = false)
	public Patient getPatient() {
		return patient;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "revisionHistory_id")
	public RevisionHistory getRevisionHistory() {
		return revisionHistory;
	}

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "pe_assessment_joint", joinColumns = { @JoinColumn(name = "assessment_id") }, inverseJoinColumns = { @JoinColumn(name = "joint_id") })
	@Fetch(value = FetchMode.SUBSELECT)
	public List<Joint> getJoint() {
		return joint;
	}

	@Column(name = "PGA")
	public String getPGA() {
		return PGA;
	}

	@Column(name = "PGA_today")
	public double getPGA_today() {
		return PGA_today;
	}

	@Column(name = "PGA_baseline")
	public double getPGA_baseline() {
		return PGA_baseline;
	}

	@Column(name = "PGA_percent")
	public double getPGA_percent() {
		return PGA_percent;
	}

	@Column(name = "painfulJoints_today")
	public int getPainfulJoints_today() {
		return painfulJoints_today;
	}

	@Column(name = "painfulJoints_baseline")
	public int getPainfulJoints_baseline() {
		return painfulJoints_baseline;
	}

	@Column(name = "painfulJoints_percent")
	public double getPainfulJoints_percent() {
		return painfulJoints_percent;
	}

	@Column(name = "swollenJoints_today")
	public int getSwollenJoints_today() {
		return swollenJoints_today;
	}

	@Column(name = "swollenJoints_baseline")
	public int getSwollenJoints_baseline() {
		return swollenJoints_baseline;
	}

	@Column(name = "swollenJoints_percent")
	public double getSwollenJoints_percent() {
		return swollenJoints_percent;
	}

	@Column(name = "ESR_today")
	public int getESR_today() {
		return ESR_today;
	}

	@Column(name = "ESR_baseline")
	public int getESR_baseline() {
		return ESR_baseline;
	}

	@Column(name = "ESR_percent")
	public double getESR_percent() {
		return ESR_percent;
	}

	@Column(name = "FN_percent")
	public double getFN_percent() {
		return FN_percent;
	}

	@Column(name = "PN_percent")
	public double getPN_percent() {
		return PN_percent;
	}

	@Column(name = "GL_percent")
	public double getGL_percent() {
		return GL_percent;
	}

	@Column(name = "painfulJoint_improvement")
	public boolean isPainfulJoint_improvement() {
		return painfulJoint_improvement;
	}

	@Column(name = "swollenJoint_improvement")
	public boolean isSwollenJoint_improvement() {
		return swollenJoint_improvement;
	}

	@Column(name = "PN_improvement")
	public boolean isPN_improvement() {
		return PN_improvement;
	}

	@Column(name = "GL_improvement")
	public boolean isGL_improvement() {
		return GL_improvement;
	}

	@Column(name = "PGA_improvement")
	public boolean isPGA_improvement() {
		return PGA_improvement;
	}

	@Column(name = "FN_improvement")
	public boolean isFN_improvement() {
		return FN_improvement;
	}

	@Column(name = "ESR_improvement")
	public boolean isESR_improvement() {
		return ESR_improvement;
	}



	public String getFN_today() {
		return FN_today;
	}

	public String getGL_today() {
		return GL_today;
	}

	public String getPN_today() {
		return PN_today;
	}

	public String getFN_baseline() {
		return FN_baseline;
	}

	public String getGL_baseline() {
		return GL_baseline;
	}

	public String getPN_baseline() {
		return PN_baseline;
	}

	

	public boolean isACR20() {
		return ACR20;
	}

	
	/**
	 * setters
	 * */
	public void setACR20(boolean aCR20) {
		ACR20 = aCR20;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setFN_today(String fN_today) {
		FN_today = fN_today;
	}

	public void setGL_today(String gL_today) {
		GL_today = gL_today;
	}

	public void setPN_today(String pN_today) {
		PN_today = pN_today;
	}

	public void setFN_baseline(String fN_baseline) {
		FN_baseline = fN_baseline;
	}

	public void setGL_baseline(String gL_baseline) {
		GL_baseline = gL_baseline;
	}

	public void setPN_baseline(String pN_baseline) {
		PN_baseline = pN_baseline;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public void setRevisionHistory(RevisionHistory revisionHistory) {
		this.revisionHistory = revisionHistory;
	}

	public void setJoint(List<Joint> joint) {
		this.joint = joint;
	}

	public void setPGA(String pGA) {
		PGA = pGA;
	}

	public void setPGA_today(double pGA_today) {
		PGA_today = pGA_today;
	}

	public void setPGA_baseline(double pGA_baseline) {
		PGA_baseline = pGA_baseline;
	}

	public void setPGA_percent(double pGA_percent) {
		PGA_percent = pGA_percent;
	}

	public void setPainfulJoints_today(int painfulJoints_today) {
		this.painfulJoints_today = painfulJoints_today;
	}

	public void setPainfulJoints_baseline(int painfulJoints_baseline) {
		this.painfulJoints_baseline = painfulJoints_baseline;
	}

	public void setPainfulJoints_percent(double painfulJoints_percent) {
		this.painfulJoints_percent = painfulJoints_percent;
	}

	public void setSwollenJoints_today(int swollenJoints_today) {
		this.swollenJoints_today = swollenJoints_today;
	}

	public void setSwollenJoints_baseline(int swollenJoints_baseline) {
		this.swollenJoints_baseline = swollenJoints_baseline;
	}

	public void setSwollenJoints_percent(double swollenJoints_percent) {
		this.swollenJoints_percent = swollenJoints_percent;
	}

	public void setESR_today(int eSR_today) {
		ESR_today = eSR_today;
	}

	public void setESR_baseline(int eSR_baseline) {
		ESR_baseline = eSR_baseline;
	}

	public void setESR_percent(double eSR_percent) {
		ESR_percent = eSR_percent;
	}

	public void setFN_percent(double fN_percent) {
		FN_percent = fN_percent;
	}

	public void setPN_percent(double pN_percent) {
		PN_percent = pN_percent;
	}

	public void setGL_percent(double gL_percent) {
		GL_percent = gL_percent;
	}

	public void setPainfulJoint_improvement(boolean painfulJoint_improvement) {
		this.painfulJoint_improvement = painfulJoint_improvement;
	}

	public void setSwollenJoint_improvement(boolean swollenJoint_improvement) {
		this.swollenJoint_improvement = swollenJoint_improvement;
	}

	public void setPN_improvement(boolean pN_improvement) {
		PN_improvement = pN_improvement;
	}

	public void setGL_improvement(boolean gL_improvement) {
		GL_improvement = gL_improvement;
	}

	public void setPGA_improvement(boolean pGA_improvement) {
		PGA_improvement = pGA_improvement;
	}

	public void setFN_improvement(boolean fN_improvement) {
		FN_improvement = fN_improvement;
	}

	public void setESR_improvement(boolean eSR_improvement) {
		ESR_improvement = eSR_improvement;
	}



}
