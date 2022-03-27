package com.eea.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LogInFormDTO {
	private String loginEmail;
	private String loginPassword;

	public String getLoginEmail() {
		return loginEmail;
	}

	public void setLoginEmail(String loginEmail) {
		this.loginEmail = loginEmail;
	}

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
}
