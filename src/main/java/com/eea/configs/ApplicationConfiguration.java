package com.eea.configs;

import com.eea.services.helper.AccountDetailsHelper;
import com.eea.services.helper.PostHelper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.eea.services.helper.AccountHelper;
import com.eea.services.helper.AuthenticationHelper;
import com.eea.services.helper.ExcelHelper;

@Configuration
public class ApplicationConfiguration {
    @Bean
    public AccountHelper accountHelper() {
        return new AccountHelper();
    }

    @Bean
    public AuthenticationHelper authenticationHelper() {
        return new AuthenticationHelper();
    }

    @Bean
    public AccountDetailsHelper accountDetailsHelper() {
        return new AccountDetailsHelper();
    }

    @Bean
    public PostHelper postHelper() {
        return new PostHelper();
    }
    
    @Bean
    public ExcelHelper excelHelper() {
    	return new ExcelHelper();
    }
}
