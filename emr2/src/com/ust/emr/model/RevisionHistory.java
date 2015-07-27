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

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "tbl_revision_history")
public class RevisionHistory {
	private Long id;
	private LocalDate dateCreated;
	private LocalDate dateModified;
	private LocalDate dateDeleted;
	private User createdBy;
	private User modifiedBy;
	private User deletedBy;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_id")
	public Long getId() {
		return id;
	}

	@Column(name = "fld_date_created")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalDate")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	public LocalDate getDateCreated() {
		return dateCreated;
	}

	@Column(name = "fld_date_modified")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalDate")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	public LocalDate getDateModified() {
		return dateModified;
	}

	@Column(name = "fld_date_deleted")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalDate")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	public LocalDate getDateDeleted() {
		return dateDeleted;
	}

	@JoinColumn(name = "fld_created_by")
	@OneToOne(cascade = CascadeType.PERSIST)
	public User getCreatedBy() {
		return createdBy;
	}

	@JoinColumn(name = "fld_modified_by")
	@OneToOne(cascade = CascadeType.PERSIST)
	public User getModifiedBy() {
		return modifiedBy;
	}

	@JoinColumn(name = "fld_deleted_by")
	@OneToOne
	public User getDeletedBy() {
		return deletedBy;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setDateCreated(LocalDate dateCreated) {
		this.dateCreated = dateCreated;
	}

	public void setDateModified(LocalDate dateModified) {
		this.dateModified = dateModified;
	}

	public void setDateDeleted(LocalDate dateDeleted) {
		this.dateDeleted = dateDeleted;
	}

	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}

	public void setModifiedBy(User modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public void setDeletedBy(User deletedBy) {
		this.deletedBy = deletedBy;
	}

	public RevisionHistory(LocalDate dateCreated, User createdBy) {
		super();
		this.dateCreated = dateCreated;
		this.createdBy = createdBy;
	}

	
	
	@Override
	public String toString() {
		return "RevisionHistory [id=" + id + ", dateCreated=" + dateCreated
				+ ", dateModified=" + dateModified + ", dateDeleted="
				+ dateDeleted + ", createdBy=" + createdBy + ", modifiedBy="
				+ modifiedBy + ", deletedBy=" + deletedBy + "]";
	}

	public RevisionHistory(User modifiedBy, LocalDate dateModified) {
		super();
		this.dateModified = dateModified;
		this.modifiedBy = modifiedBy;
	}

	public RevisionHistory(){}
	
	
}
