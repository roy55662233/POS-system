package com.pos.chicken.domain;

import org.springframework.web.multipart.MultipartFile;

public class UploadBean {
	private String extraField;
	/**
	 * 
	 * 單一檔案使用MultipartFile資料型態
	 * 多檔案上傳可使用MultipartFile
	 */
	 private MultipartFile[] files;
	public String getExtraField() {
		return extraField;
	}
	public void setExtraField(String extraField) {
		this.extraField = extraField;
	}
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
}
