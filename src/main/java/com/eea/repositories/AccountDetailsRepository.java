package com.eea.repositories;

import com.eea.models.AccountDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountDetailsRepository extends JpaRepository<AccountDetails,Integer> {
    AccountDetails findByAccount_AccountEmail(String accountEmail);

    AccountDetails findByAccount_AccountId(Integer accountId);


}
