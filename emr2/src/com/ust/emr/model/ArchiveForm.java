package com.ust.emr.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ArchiveForm {
//	List<MultipartFile> images = new ArrayList<>();
//
//	public List<MultipartFile> getImages() {
//		return images;
//	}
//
//	public void setImages(List<MultipartFile> images) {
//		this.images = images;
//	}
	
	
	private List<CommonsMultipartFile> images;
	
	public ArchiveForm() {
		images = new ArrayList<>();
	}

	public List<CommonsMultipartFile> getImages() {
		return images;
	}

	public void setImages(List<CommonsMultipartFile> images) {
		this.images = images;
	}

	
	
}
