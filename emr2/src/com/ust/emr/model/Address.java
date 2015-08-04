package com.ust.emr.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.ust.emr.util1.encryption;

@Entity
@Table(name = "tbl_address")
public class Address {
	private encryption aes = new encryption();
	private Long id;
	private String type; // home or work
	private String address; // number, street, building
	private String city;
	private String province;
	private int zipCode;

	public Address() {
	}

	public Address(String type, String address, String city, String province,
			int zipCode) {
		super();
		this.type = type;
		this.address = address;
		this.city = city;
		this.province = province;
		this.zipCode = zipCode;
	}
	public Address(Address adr) {
		super();
		this.id = adr.id;
		this.type = adr.type;
		this.address = adr.address;
		this.city = adr.city;
		this.province = adr.province;
		this.zipCode = adr.zipCode;
	}
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_id")
	public Long getId() {
		return id;
	}

	@Column(name = "fld_address")
	public String getAddress() {
		return address;
	}

	@Column(name = "fld_city")
	public String getCity() {
		return city;
	}

	@Column(name = "fld_zip_code")
	public int getZipCode() {
		return zipCode;
	}

	@Column(name = "fld_type")
	public String getType() {
		return type;
	}

	@Column(name = "fld_province")
	public String getProvince() {
		return province;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String toString() {
		return "Address[id=" + id + " address=" + address + " city=" + city
				+ " province=" + province + " zipcode=" + zipCode + "]";
	}
	public Address encrypt(){
		encryption aes = new encryption();
		Address address = new Address();
		address.setAddress(aes.encrypt(this.address));
		address.setCity(aes.encrypt(city));
		address.setId(id);
		address.setProvince(aes.encrypt(province));
		address.setType(aes.encrypt(type));
		address.setZipCode(zipCode);
		return address;
	}
	public Address decrypt(){
		encryption aes = new encryption();
		Address address = new Address();
		address.setAddress(aes.decrypt(this.address));
		address.setCity(aes.decrypt(city));
		address.setId(id);
		address.setProvince(aes.decrypt(province));
		address.setType(aes.decrypt(type));
		address.setZipCode(zipCode);
		return address;
	}
}
