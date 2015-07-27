package com.ust.emr.model.history;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ih_rheuma_history")
public class RheumaHistory {
	private Long id;

	// for checkboxes
	private String[] arthritis;
	private String[] osteoArthritis;
	private String[] gout;
	private String[] childhoodArthritis;
	private String[] lupus;
	private String[] rheumatoid;
	private String[] ankylosing;
	private String[] osteo;

	private String arthritis_name;
	private String arthritis_relationship;
	private String osteoArthritis_name;
	private String osteoArthritis_relationship;
	private String gout_name;
	private String gout_relationship;
	private String childhoodArthritis_name;
	private String childhoodArthritis_relationship;
	private String lupus_name;
	private String lupus_relationship;
	private String rheumatoid_name;
	private String rheumatoid_relationship;
	private String ankylosing_name;
	private String ankylosing_relationship;
	private String osteo_name;
	private String osteo_relationship;

	private String others;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@Column(name = "arthritis")
	public String[] getArthritis() {
		return arthritis;
	}

	@Column(name = "osteoArthritis")
	public String[] getOsteoArthritis() {
		return osteoArthritis;
	}

	@Column(name = "gout")
	public String[] getGout() {
		return gout;
	}

	@Column(name = "childhoodArthritis")
	public String[] getChildhoodArthritis() {
		return childhoodArthritis;
	}

	@Column(name = "lupus")
	public String[] getLupus() {
		return lupus;
	}

	@Column(name = "rheumatoid")
	public String[] getRheumatoid() {
		return rheumatoid;
	}

	@Column(name = "ankylosing")
	public String[] getAnkylosing() {
		return ankylosing;
	}

	@Column(name = "osteo")
	public String[] getOsteo() {
		return osteo;
	}

	@Column(name = "arthritis_name")
	public String getArthritis_name() {
		return arthritis_name;
	}

	@Column(name = "arthritis_relationship")
	public String getArthritis_relationship() {
		return arthritis_relationship;
	}

	@Column(name = "osteoArthritis_name")
	public String getOsteoArthritis_name() {
		return osteoArthritis_name;
	}

	@Column(name = "osteoArthritis_relationship")
	public String getOsteoArthritis_relationship() {
		return osteoArthritis_relationship;
	}

	@Column(name = "gout_name")
	public String getGout_name() {
		return gout_name;
	}

	@Column(name = "gout_relationship")
	public String getGout_relationship() {
		return gout_relationship;
	}

	@Column(name = "childhoodArthritis_name")
	public String getChildhoodArthritis_name() {
		return childhoodArthritis_name;
	}

	@Column(name = "childhoodArthritis_relationship")
	public String getChildhoodArthritis_relationship() {
		return childhoodArthritis_relationship;
	}

	@Column(name = "lupus_name")
	public String getLupus_name() {
		return lupus_name;
	}

	@Column(name = "lupus_relationship")
	public String getLupus_relationship() {
		return lupus_relationship;
	}

	@Column(name = "rheumatoid_name")
	public String getRheumatoid_name() {
		return rheumatoid_name;
	}

	@Column(name = "rheumatoid_relationship")
	public String getRheumatoid_relationship() {
		return rheumatoid_relationship;
	}

	@Column(name = "ankylosing_name")
	public String getAnkylosing_name() {
		return ankylosing_name;
	}

	@Column(name = "ankylosing_relationship")
	public String getAnkylosing_relationship() {
		return ankylosing_relationship;
	}

	@Column(name = "osteo_name")
	public String getOsteo_name() {
		return osteo_name;
	}

	@Column(name = "osteo_relationship")
	public String getOsteo_relationship() {
		return osteo_relationship;
	}

	@Column(name = "others")
	public String getOthers() {
		return others;
	}

	/**
	 * SETTERS
	 * */

	public void setId(Long id) {
		this.id = id;
	}

	public void setArthritis(String[] arthritis) {
		this.arthritis = arthritis;
	}

	public void setOsteoArthritis(String[] osteoArthritis) {
		this.osteoArthritis = osteoArthritis;
	}

	public void setGout(String[] gout) {
		this.gout = gout;
	}

	public void setChildhoodArthritis(String[] childhoodArthritis) {
		this.childhoodArthritis = childhoodArthritis;
	}

	public void setLupus(String[] lupus) {
		this.lupus = lupus;
	}

	public void setRheumatoid(String[] rheumatoid) {
		this.rheumatoid = rheumatoid;
	}

	public void setAnkylosing(String[] ankylosing) {
		this.ankylosing = ankylosing;
	}

	public void setOsteo(String[] osteo) {
		this.osteo = osteo;
	}

	public void setArthritis_name(String arthritis_name) {
		this.arthritis_name = arthritis_name;
	}

	public void setArthritis_relationship(String arthritis_relationship) {
		this.arthritis_relationship = arthritis_relationship;
	}

	public void setOsteoArthritis_name(String osteoArthritis_name) {
		this.osteoArthritis_name = osteoArthritis_name;
	}

	public void setOsteoArthritis_relationship(
			String osteoArthritis_relationship) {
		this.osteoArthritis_relationship = osteoArthritis_relationship;
	}

	public void setGout_name(String gout_name) {
		this.gout_name = gout_name;
	}

	public void setGout_relationship(String gout_relationship) {
		this.gout_relationship = gout_relationship;
	}

	public void setChildhoodArthritis_name(String childhoodArthritis_name) {
		this.childhoodArthritis_name = childhoodArthritis_name;
	}

	public void setChildhoodArthritis_relationship(
			String childhoodArthritis_relationship) {
		this.childhoodArthritis_relationship = childhoodArthritis_relationship;
	}

	public void setLupus_name(String lupus_name) {
		this.lupus_name = lupus_name;
	}

	public void setLupus_relationship(String lupus_relationship) {
		this.lupus_relationship = lupus_relationship;
	}

	public void setRheumatoid_name(String rheumatoid_name) {
		this.rheumatoid_name = rheumatoid_name;
	}

	public void setRheumatoid_relationship(String rheumatoid_relationship) {
		this.rheumatoid_relationship = rheumatoid_relationship;
	}

	public void setAnkylosing_name(String ankylosing_name) {
		this.ankylosing_name = ankylosing_name;
	}

	public void setAnkylosing_relationship(String ankylosing_relationship) {
		this.ankylosing_relationship = ankylosing_relationship;
	}

	public void setOsteo_name(String osteo_name) {
		this.osteo_name = osteo_name;
	}

	public void setOsteo_relationship(String osteo_relationship) {
		this.osteo_relationship = osteo_relationship;
	}

	public void setOthers(String others) {
		this.others = others;
	}

}
