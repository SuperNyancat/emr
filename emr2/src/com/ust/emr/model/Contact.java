package com.ust.emr.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import com.ust.emr.util1.encryption;

@Entity
@Table(name = "tbl_contact")
public class Contact {
	private Long id;
	private String mobileNumber;
	private String phoneNumber;
	private String type; // home or work

	public Contact() {
	}

	public Contact(String mobileNumber, String phoneNumber, String type) {
		super();
		this.mobileNumber = mobileNumber;
		this.phoneNumber = phoneNumber;
		this.type = type;
	}
	
	public Contact(Contact contact) {
		super();
		this.id = contact.id;
		this.mobileNumber = contact.mobileNumber;
		this.phoneNumber = contact.phoneNumber;
		this.type = contact.type;
	}
	
	public String toString(){
		return "Contact[id=" + id + " type=" + type + " mobileNumber=" + mobileNumber + " phoneNumber=" + phoneNumber + "]";
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_contact")
	public Long getId() {
		return id;
	}

	@Column(name = "fld_mobile_number")
	@Pattern(regexp = "(^\\+?[\\d]+(\\-?[\\d]+)*)*")
	public String getMobileNumber() {
		return mobileNumber;
	}

	@Column(name = "fld_phone_number")
	@Pattern(regexp = "(^\\+?[\\d]+(\\-?[\\d]+)*)*")
	public String getPhoneNumber() {
		return phoneNumber;
	}

	@Column(name = "fld_type")
	public String getType() {
		return type;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public void setType(String type) {
		this.type = type;
	}
	public Contact encrypt(){
		encryption aes = new encryption();
		Contact contact = new Contact();
		contact.setId(id);
		contact.setMobileNumber(aes.encrypt(mobileNumber));
		contact.setPhoneNumber(aes.encrypt(phoneNumber));
		contact.setType(aes.encrypt(type));
		return contact;
	}
	public Contact decrypt(){
		encryption aes = new encryption();
		Contact contact = new Contact();
		contact.setId(id);
		contact.setMobileNumber(aes.decrypt(mobileNumber));
		contact.setPhoneNumber(aes.decrypt(phoneNumber));
		contact.setType(aes.decrypt(type));
		return contact;
	}
}
