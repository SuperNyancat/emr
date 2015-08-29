package com.ust.emr.model;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import com.ust.emr.util1.encryption;

@Entity
@Table(name = "tbl_person_info")
public class PersonInfo {
	private Long id;
	private List<Address> addresses;
	private List<Contact> contacts;
	private String firstName;
	private String lastName;
	private String maidenName;
	private String email;
	private int age;
	private LocalDate dateOfBirth;
	private String sex;
	private String occupation;
	private String companyName;
	private RevisionHistory revisionHistory;
	
	private String securityQuestion;
	private String securityAnswer;

	//angelo revision (addition)
	public PersonInfo(){
	}
	public PersonInfo(PersonInfo pf) {
		this.id = pf.id;
		this.firstName = pf.firstName;
		this.lastName = pf.lastName;
		this.maidenName = pf.maidenName;
		this.email = pf.email;
		this.age = pf.age;
		this.dateOfBirth = pf.dateOfBirth;
		this.sex = pf.sex;
		this.occupation = pf.occupation;
		this.companyName = pf.companyName;
		this.revisionHistory = pf.revisionHistory;
		this.securityQuestion = pf.securityQuestion;
		this.securityAnswer = pf.securityAnswer;
		for(int i = 0; i < pf.contacts.size(); i++){
			this.contacts.add(new Contact(pf.contacts.get(i)));
		}
		for(int i = 0; i < pf.addresses.size(); i++){
			this.addresses.add(new Address(pf.addresses.get(i)));
		}
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_person_info")
	public Long getId() {
		return id;
	}

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "tbl_person_address", joinColumns = { @JoinColumn(name = "person_id") }, inverseJoinColumns = { @JoinColumn(name = "address_id") })
	@Fetch(value = FetchMode.SUBSELECT)
	public List<Address> getAddresses() {
		return addresses;
	}

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinTable(name = "tbl_person_contact", joinColumns = { @JoinColumn(name = "person_id") }, inverseJoinColumns = { @JoinColumn(name = "contact_id") })
	@Fetch(value = FetchMode.SUBSELECT)
	public List<Contact> getContacts() {
		return contacts;
	}

	@Column(name = "fld_first_name")
	public String getFirstName() {
		return firstName;
	}

	@Column(name = "fld_last_name")
	public String getLastName() {
		return lastName;
	}

	@Column(name = "fld_email")
	@Pattern(regexp = "(^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,}))*")
	public String getEmail() {
		return email;
	}

	@Column(name = "fld_date_of_birth")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalDate")
	@DateTimeFormat(iso = ISO.DATE)
	public LocalDate getDateOfBirth() {
		return dateOfBirth;
	}

	@Column(name = "fld_sex")
	public String getSex() {
		return sex;
	}

	@Column(name = "fld_occupation")
	public String getOccupation() {
		return occupation;
	}

	@Column(name = "fld_company_name")
	public String getCompanyName() {
		return companyName;
	}

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "key_revisionHistory")
	public RevisionHistory getRevisionHistory() {
		return revisionHistory;
	}
	
	
	@Column(name = "fld_maiden_name")
	public String getMaidenName() {
		return maidenName;
	}

	public void setMaidenName(String maidenName) {
		this.maidenName = maidenName;
	}

	@Column(name = "fld_age")
	public int getAge() {
		return age;
	}

	@Column(name = "fld_sec_question")
	public String getSecurityQuestion() {
		return securityQuestion;
	}
	
	@Column(name = "fld_sec_answer")
	public String getSecurityAnswer() {
		return securityAnswer;
	}

	
	/***
	 * SETTERS
	 * */
	
	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}

	public void setSecurityAnswer(String securityAnswer) {
		this.securityAnswer = securityAnswer;
	}


	public void setAge(int age) {
		this.age = age;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

	public void setContacts(List<Contact> contacts) {
		this.contacts = contacts;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setDateOfBirth(LocalDate dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public void setRevisionHistory(RevisionHistory revisionHistory) {
		this.revisionHistory = revisionHistory;
	}

	@Override
	public String toString() {
		return "PersonInfo [id=" + id + ", addresses=" + addresses
				+ ", contacts=" + contacts + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", email=" + email
				+ ", dateOfBirth=" + dateOfBirth + ", sex=" + sex
				+ ", occupation=" + occupation + ", companyName=" + companyName
				+ ", revisionHistory=" + revisionHistory + "]";
	}
	
	//angelo revision (addition)
	public PersonInfo encrypt(){
		encryption aes = new encryption();
		PersonInfo personinfo = new PersonInfo();
		personinfo.setAge(age);
		personinfo.setCompanyName(aes.encrypt(companyName));
		personinfo.setDateOfBirth(dateOfBirth);
		personinfo.setEmail(aes.encrypt(email));
		personinfo.setFirstName(aes.encrypt(firstName));
		personinfo.setId(id);
		personinfo.setLastName(aes.encrypt(lastName));
		personinfo.setMaidenName(aes.encrypt(maidenName));
		personinfo.setOccupation(aes.encrypt(occupation));
		personinfo.setRevisionHistory(revisionHistory);
		personinfo.setSecurityAnswer(aes.encrypt(securityAnswer));
		personinfo.setSecurityQuestion(aes.encrypt(securityQuestion));
		personinfo.setSex(aes.encrypt(sex));
		personinfo.contacts = new ArrayList<Contact>();
		personinfo.addresses = new ArrayList<Address>();
		for(int i=0;i<personinfo.contacts.size();i++){
			personinfo.contacts.add(i, new Contact(contacts.get(i).encrypt()));
		}
		for(int i=0;i<personinfo.addresses.size();i++){
			personinfo.addresses.add(i, new Address(addresses.get(i).encrypt()));
		}
		return personinfo ;
	}
	public PersonInfo decrypt(){
		encryption aes = new encryption();
		PersonInfo personinfo = new PersonInfo();
		personinfo.setAge(age);
		personinfo.setCompanyName(aes.decrypt(companyName));
		personinfo.setDateOfBirth(dateOfBirth);
		personinfo.setEmail(aes.decrypt(email));
		personinfo.setFirstName(aes.decrypt(firstName));
		personinfo.setId(id);
		personinfo.setLastName(aes.decrypt(lastName));
		personinfo.setMaidenName(aes.decrypt(maidenName));
		personinfo.setOccupation(aes.decrypt(occupation));
		personinfo.setRevisionHistory(revisionHistory);
		personinfo.setSecurityAnswer(aes.decrypt(securityAnswer));
		personinfo.setSecurityQuestion(aes.decrypt(securityQuestion));
		personinfo.setSex(aes.decrypt(sex));
		personinfo.contacts = new ArrayList<Contact>();
		personinfo.addresses = new ArrayList<Address>();
		for(int i=0;i<personinfo.contacts.size();i++){
			personinfo.contacts.add(i, new Contact(contacts.get(i).decrypt()));
		}
		for(int i=0;i<personinfo.addresses.size();i++){
			personinfo.addresses.add(i, new Address(addresses.get(i).decrypt()));
		}
		return personinfo ;
	}
	public void ageCorrection(){
		LocalDate now = new LocalDate();
		int age = now.getYear() - dateOfBirth.getYear();
		if(dateOfBirth.getYear()>now.getYear())
			this.setAge(age);
		else if(now.getMonthOfYear()==dateOfBirth.getMonthOfYear())
			if(dateOfBirth.getDayOfMonth()>now.getDayOfMonth())
				this.setAge(age);
			else this.setAge(age+1);
		else this.setAge(age+1);
		
	}
}
