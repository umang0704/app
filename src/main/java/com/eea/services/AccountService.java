package com.eea.services;

import org.springframework.beans.BeanUtils;
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
            baseResponse.setMessage("Success!. Account Created Please go to Log In.");
            baseResponse.setMessage("success");
        } catch (Exception e) {
            baseResponse.setMessage("Internal Server Error");
            baseResponse.setMessageType("danger");
        }
        return baseResponse;
    }
}
