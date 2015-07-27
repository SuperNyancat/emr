package com.ust.emr.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_role")
public class Role {
	private Long id;
	private String roleType;

	public Role() {
	}

	public Role(String roleType) {
		super();
		this.roleType = roleType;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_role")
	public Long getId() {
		return id;
	}

	@Column(name = "fld_role_type")
	public String getRoleType() {
		return roleType;
	}

	public String toString() {
		return "Role[id=" + id + ", roleType=" + roleType + "]";
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	public void setId(Long id) {
		this.id = id;
	}

}
