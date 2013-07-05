package com.dms.common.model;

import org.springframework.web.multipart.MultipartFile;

public class TestForm {
	private MultipartFile imageFile;

	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}


}
