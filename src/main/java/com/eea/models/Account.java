package com.eea.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.eea.enums.AccountType;
 
@Entity
@Table(name="account") 
public class Account {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer accountId;
	
	@Column(name="account_email",nullable=false,unique = true)
	private String accountEmail;

	@Column(name="account_password",nullable=false)
	private String accountPassword;

	@Column(name="account_name",nullable=false)
	private String accountName;


	@Column(name="account_type",nullable=false)
	@Enumerated(EnumType.STRING)
	private AccountType accountType;


	public Integer getAccountId() {
		return accountId;
	}


	public void setAccountId(Integer accountId) {
		this.accountId = accountId;
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


	public String getAccountName() {
		return accountName;
	}


	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}


	public AccountType getAccountType() {
		return accountType;
	}


	public void setAccountType(AccountType accountType) {
		this.accountType = accountType;
	}
	
	
}
