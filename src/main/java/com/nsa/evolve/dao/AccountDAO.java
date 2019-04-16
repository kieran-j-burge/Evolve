package com.nsa.evolve.dao;

import com.nsa.evolve.dto.Account;
import com.nsa.evolve.dto.oldAccount;

import java.util.List;

/**
 * Created by c1633899 on 24/11/2017.
 */
public interface AccountDAO {
    Account findAccount(String email, String password);
    void createAccount(String email, String password, Integer foreignKey,String salt);
    Boolean checkAccountExists(String email);
    void changePassword(String password, Integer accountId);
    Account findAccountById(Integer accountId);
    String findSaltByEmail(String email);
    List<oldAccount> getOldAccounts();
    void setNewAccount(int id, String password, String salt);
}
