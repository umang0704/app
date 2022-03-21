package com.eea.dto;

import com.eea.enums.AccountType;

import lombok.Getter;
import lombok.Setter;
 
public class SignUpFormDto {
	private AccountType accountType; 
	private String accountName;
	private String accountEmail;
	private String accountPassword;
	private String accountConfirmPassword;
	public AccountType getAccountType() {
		return accountType;
	}
	public void setAccountType(AccountType accountType) {
		this.accountType = accountType;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getAccountEmail() {
		return accountEmail;
	}
	public void setAccountEmail(String accountEmail) {
		this.accountEmail = accountEmail;
	}
	public String getAccountPassword() {
		return accountPassword;
	}
	public void setAccountPassword(String accountPassword) {
		this.accountPassword = accountPassword;
	}
	public String getAccountConfirmPassword() {
		return accountConfirmPassword;
	}
	public void setAccountConfirmPassword(String accountConfirmPassword) {
		this.accountConfirmPassword = accountConfirmPassword;
	}
	
}
