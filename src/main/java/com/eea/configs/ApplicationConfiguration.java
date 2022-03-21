package com.eea.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.eea.services.helper.AccountHelper;

@Configuration
public class ApplicationConfiguration {
	@Bean
	public AccountHelper accountHelper() {
		return new AccountHelper();
	}
}
