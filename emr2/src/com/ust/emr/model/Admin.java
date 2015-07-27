package com.ust.emr.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_admin")
public class Admin {
	private Long id;
	private User user;
	private PersonInfo personInfo;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_admin")
	public Long getId() {
		return id;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "key_user")
	public User getUser() {
		return user;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "key_person_info")
	public PersonInfo getPersonInfo() {
		return personInfo;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setPersonInfo(PersonInfo personInfo) {
		this.personInfo = personInfo;
	}

}
