package com.eea.services.helper;

import com.eea.models.AccountDetails;
import com.eea.repositories.AccountDetailsRepository;
import com.eea.repositories.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

public class AccountDetailsHelper {
    @Autowired
    private AccountDetailsRepository accountDetailsRepository;

    /**
     * Returns Account Details using Account Email Id
     * @param emailId
     * @return
     */
    public AccountDetails getAccountDetailsByAccountEmailID(String emailId){
        AccountDetails byAccount_accountEmail = accountDetailsRepository.findByAccount_AccountEmail(emailId);
        return byAccount_accountEmail;
    }

    public AccountDetails save(AccountDetails accountDetails) {
        AccountDetails savedAccountDetails =accountDetailsRepository.save(accountDetails);
        return savedAccountDetails;
    }
    public AccountDetails getAccountDetailsByAccountID(Integer accountId){
        return accountDetailsRepository.findByAccount_AccountId(accountId);
    }
}
