package com.expenses.project.bean;

import org.springframework.web.multipart.MultipartFile;

public class ProfileBean {

	Integer userId;
	MultipartFile profileImg;
	String imageUrl;
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public MultipartFile getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(MultipartFile profileImg) {
		this.profileImg = profileImg;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	
	
}
