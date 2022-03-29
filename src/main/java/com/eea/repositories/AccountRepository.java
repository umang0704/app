package com.eea.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.eea.models.Account;

@Repository
public interface AccountRepository extends JpaRepository<Account, Integer>{
	Account findByAccountEmailAndAccountPassword(String accountEmail,String accountPassword);

	Account findByAccountEmail(String accountEmail);

}
