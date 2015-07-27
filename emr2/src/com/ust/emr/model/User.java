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

import com.ust.emr.util1.encryption;


@Entity
@Table(name = "tbl_user")
public class User {
	private Long id;
	private String username;
	private String password;
	private Role role;
	private String dateCreated;
	private boolean isEnabled = true;

	public User() {
		role = new Role();
	}

	public User(String username, String password, Role role, String dateCreated) {
		super();
		this.username = username;
		this.password = password;
		this.role = role;
		this.dateCreated = dateCreated;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", role=" + role + ", dateCreated=" + dateCreated
				+ ", isEnabled=" + isEnabled + "]";
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_user")
	public Long getId() {
		return id;
	}

	
	@Column(name = "fld_username", unique=true)
	public String getUsername() {
		return username;
	}

	
	@Column(name = "fld_password")
	public String getPassword() {
		return password;
	}

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "key_role")
	public Role getRole() {
		return role;
	}

	@Column(name = "fld_date_created")
	public String getDateCreated() {
		return dateCreated;
	}

	@Column(name = "fld_is_enabled")
	public boolean isEnabled() {
		return isEnabled;
	}

	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public void setDateCreated(String dateCreated) {
		this.dateCreated = dateCreated;
	}
	public User encrpyt(){
		encryption aes = new encryption();
		User user = new User();
		user.setDateCreated(dateCreated);
		user.setEnabled(isEnabled);
		user.setId(id);
		user.setPassword(password);
		user.setRole(role);
		user.setUsername(aes.encrypt(username));
		return user;
	}
	public User decrpyt(){
		encryption aes = new encryption();
		User user = new User();
		user.setDateCreated(aes.encrypt(dateCreated));
		user.setEnabled(isEnabled);
		user.setId(id);
		user.setPassword(password);
		user.setRole(role);
		user.setUsername(aes.decrypt(username));
		return user;
	}
}