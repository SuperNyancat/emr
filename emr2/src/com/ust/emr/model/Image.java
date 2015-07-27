package com.ust.emr.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_images")
public class Image {
	private Long id;
//	private byte[] image;
	private String filename;
	private Archives archives;
	private String absolutePath;
	private String relativePath;
	
	public Image() {}
	
	public Image(String filename, Archives archives, String absolutePath,
			String relativePath) {
		super();
		this.filename = filename;
		this.archives = archives;
		this.absolutePath = absolutePath;
		this.relativePath = relativePath;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "key_image")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
//	@Lob
//	@Column(name = "image")
//	public byte[] getImage() {
//		return image;
//	}

	
	
	@Column(name = "filename")
	public String getFilename() {
		return filename;
	}
	
	@Column(name = "absolutePath")
	public String getAbsolutePath() {
		return absolutePath;
	}
	@Column(name = "relativePath")
	public String getRelativePath() {
		return relativePath;
	}

	public void setAbsolutePath(String absolutePath) {
		this.absolutePath = absolutePath;
	}

	public void setRelativePath(String relativePath) {
		this.relativePath = relativePath;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	@ManyToOne
	@JoinColumn(name = "key_archives", nullable = false)
	public Archives getArchives() {
		return archives;
	}

	public void setArchives(Archives archives) {
		this.archives = archives;
	}
	
	
}
