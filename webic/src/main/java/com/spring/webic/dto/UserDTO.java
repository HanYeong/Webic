package com.spring.webic.dto;

public class UserDTO {
	private String userId;
    private String userPwd;
    
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPwd;
	}
	public void setUserPw(String userPwd) {
		this.userPwd = userPwd;
	}
}
