package com.eea.services;

import com.eea.dto.LogInFormDTO;
import com.eea.models.AccountDetails;
import com.eea.services.helper.AccountDetailsHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eea.dto.SignUpFormDto;
import com.eea.dto.response.BaseResponse;
import com.eea.models.Account;
import com.eea.repositories.AccountRepository;
import com.eea.services.helper.AccountHelper;

@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

    @Autowired
    private AccountHelper accountHelper;

    @Autowired
    private AccountDetailsHelper accountDetailsHelper;

    /**
     * Save Account
     *
     * @param signUpFormDto
     * @return
     */
    public BaseResponse createAccount(SignUpFormDto signUpFormDto) {
        Account account = accountHelper.castSignUpFormDtoToAccount(signUpFormDto);
        BaseResponse baseResponse = new BaseResponse();
        try {
            accountRepository.save(account);
            AccountDetails accountDetails = new AccountDetails();
            accountDetails.setAccount(account);
            accountDetailsHelper.save(accountDetails);
            baseResponse.setMessage("Success!. Account Created Please go to Log In.");
            baseResponse.setMessageType("success");
        } catch (Exception e) {
            baseResponse.setMessage("Internal Server Error");
            baseResponse.setMessageType("danger");
            e.printStackTrace();
        }
        return baseResponse;
    }

    public BaseResponse homePageInformation(LogInFormDTO logInFormDTO){
        BaseResponse baseResponse = new BaseResponse();
        return baseResponse;
    }

    /**
     * Account using Account Email and Account Password
     * @param logInFormDTO
     * @return
     */
    public Account checkCredentials(LogInFormDTO logInFormDTO){
       Account account =  accountHelper.checkCredentials(logInFormDTO.getLoginEmail(),logInFormDTO.getLoginPassword());
       return account;
    }

    public AccountDetails getAccountDetailsByAccountEmail(String accountEmailId){
        AccountDetails accountDetailsByAccountEmailID = accountDetailsHelper.getAccountDetailsByAccountEmailID(accountEmailId);
        return accountDetailsByAccountEmailID;
    }
    public AccountDetails getAccountDetailsByAccountId(Integer accountId){
        AccountDetails accountDetailsByAccountEmailID = accountDetailsHelper.getAccountDetailsByAccountID(accountId);
        return accountDetailsByAccountEmailID;
    }

    public AccountDetails saveAccountDetails(AccountDetails accountDetails){
        return accountDetailsHelper.save(accountDetails);
    }
}
