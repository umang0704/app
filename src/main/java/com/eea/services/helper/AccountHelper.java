package com.eea.services.helper;

import com.eea.dto.SignUpFormDto;
import com.eea.models.Account;
import com.eea.models.AccountDetails;
import com.eea.repositories.AccountRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

public class AccountHelper {
	@Autowired
	private	AccountRepository accountRepository;

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

	/**
	 * Fetches Account Object using <b>Account Email and Account Password</b>
	 * @param accountEmail
	 * @param accountPassword
	 * @return
	 */
	public Account checkCredentials(String accountEmail, String accountPassword){
		Account account = accountRepository.findByAccountEmailAndAccountPassword(accountEmail,accountPassword);
		return account;
	}

	public Account getAccountUsingAccountEmail(String accountEmail){
		return accountRepository.findByAccountEmail(accountEmail);
	}
	
}
