package com.ust.emr.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "comments")
public class Comment {
	private Long id;
	private String comments;
	private String user;
	private String module;
	private DateTime timestamp;
	private String function;

	public Comment() {
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@Column(name = "user")
	public String getUser() {
		return user;
	}

	@Column(name = "module")
	public String getModule() {
		return module;
	}

	@Column(name = "timestamp")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentDateTime")
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	public DateTime getTimestamp() {
		return timestamp;
	}

	@Column(name = "function")
	public String getFunction() {
		return function;
	}

	public void setFunction(String function) {
		this.function = function;
	}

	@Column(name = "comment")
	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public void setTimestamp(DateTime timestamp) {
		this.timestamp = timestamp;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", comments=" + comments + ", user="
				+ user + ", module=" + module + ", timestamp=" + timestamp
				+ ", function=" + function + "]";
	}

	
}
