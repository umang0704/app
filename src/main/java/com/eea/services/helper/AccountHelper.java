package com.eea.services.helper;

import com.eea.dto.SignUpFormDto;
import com.eea.models.Account;

public class AccountHelper {
	/**
	 * @param signUpFormDto
	 * @return
	 */
	public Account castSignUpFormDtoToAccount(SignUpFormDto signUpFormDto) {
		Account account = new Account();
		account.setAccountEmail(signUpFormDto.getAccountEmail());
		account.setAccountName(signUpFormDto.getAccountName());
		account.setAccountPassword(signUpFormDto.getAccountPassword());
		account.setAccountType(signUpFormDto.getAccountType()); 
		return account;
	}
}
