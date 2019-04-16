package com.nsa.evolve.dao.impl;

import com.nsa.evolve.dao.AccountDAO;
import com.nsa.evolve.dto.Account;
import com.nsa.evolve.dto.oldAccount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by c1633899 on 24/11/2017.
 */
@Repository
public class AccountDAOImpl implements AccountDAO {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public AccountDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public Account findAccount(String email, String password) {
        return jdbcTemplate.queryForObject("SELECT * FROM account WHERE email = ? AND password = ?",
                new Object[]{email, password},
                (rs, rowNum) -> new Account(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getInt("fk_type")
                ));

    }

    @Override
    public void createAccount(String email, String password, Integer foreignKey, String salt) {
        jdbcTemplate.update("INSERT INTO account (email, password, fk_type,salt) VALUES (?, ?, ?,?)", email, password, foreignKey,salt);
    }

    @Override
    public Boolean checkAccountExists(String email) {
        try {
            jdbcTemplate.queryForObject("SELECT * FROM account WHERE email = ?",
                    new Object[]{email},
                    (rs, rowNum) -> new Account(
                            rs.getInt("id"),
                            rs.getString("email"),
                            rs.getString("password"),
                            rs.getInt("fk_type")
                    ));

            return true;
        } catch (EmptyResultDataAccessException e) {
            return false;
        }
    }

    @Override
    public void changePassword(String password, Integer accountId) {
        jdbcTemplate.update("UPDATE account SET password = ? WHERE id = ?", password, accountId);
    }

    @Override
    public Account findAccountById(Integer accountId) {
        return jdbcTemplate.queryForObject("SELECT * FROM account WHERE id = ?",
                new Object[]{accountId},
                (rs, rowNum) -> new Account(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getInt("fk_type")
                ));

    }

    @Override
    public String findSaltByEmail(String email) {
        try {
            return jdbcTemplate.queryForObject("SELECT salt FROM account WHERE email = ?",
                    new Object[]{email},
                    (rs, rowNum) -> new String(
                            rs.getString("salt")
                    ));
        }catch (EmptyResultDataAccessException e) {
            return null;
        }



    }

    @Override
    public List<oldAccount> getOldAccounts() {

        return jdbcTemplate.query("SELECT * FROM account WHERE salt IS NULL",
                new Object[]{},
                (rs, rowNum) -> new oldAccount(
                        rs.getInt("id"),
                        rs.getString("password"),
                        rs.getString("salt")
                ));
    }

    @Override
    public void setNewAccount(int id, String password, String salt) {

        jdbcTemplate.update("UPDATE account SET password = ?, salt = ? WHERE id = ?", password, salt, id);
    }
}
