package com.nsa.evolve.service.impl;

import com.nsa.evolve.dao.AccountDAO;
import com.nsa.evolve.dto.Account;
import com.nsa.evolve.dto.oldAccount;
import com.nsa.evolve.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.List;
import java.util.Random;

/**
 * Created by c1633899 on 24/11/2017.
 */
@Service
public class AccountServiceImpl implements AccountService{

    private AccountDAO accountDAO;



    @Autowired
    public AccountServiceImpl(AccountDAO accountDAO) {
        this.accountDAO = accountDAO;
    }

    @Override
    public Account findByEmailAndPassword(String email, String password) {


        try {
            String salt = accountDAO.findSaltByEmail(email);
            try {
                System.out.println(password + "   "+ salt );
                return accountDAO.findAccount(email, hashPassword(password,salt));

            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
                return null;
            }

        } catch (EmptyResultDataAccessException e){
            return null;
        }
    }

    @Override
    public Boolean createAccount(String email, String password, Integer foreignKey) {

        changeExistingAccounts();

        if (!accountDAO.checkAccountExists(email)){
            String salt = saltGen();
            try {
                System.out.println(password + "   "+ salt );
                accountDAO.createAccount(email, hashPassword(password, salt), foreignKey, salt);
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }

            return true;
        }
        return false;
    }

    private void changeExistingAccounts() {

        List<oldAccount> accountList = accountDAO.getOldAccounts();
        System.out.println(accountList.size());

        for (oldAccount account : accountList ){
            account.setSalt(saltGen());

            try {
                account.setPassword(hashPassword(account.getPassword(),account.getSalt()));
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }

            accountDAO.setNewAccount(account.getId(),account.getPassword(),account.getSalt());
        }
    }

    //    https://stackoverflow.com/questions/41107/how-to-generate-a-random-alpha-numeric-string
    @Override
    public String generatePassword(Integer length) {
        String available = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        SecureRandom random = new SecureRandom();

        StringBuilder sb = new StringBuilder(length);
        for( int i = 0; i < length; i++ )
            sb.append( available.charAt( random.nextInt(available.length()) ) );
        return sb.toString();
    }

    @Override
    public Boolean changePassword(String currentPassword, String newPassword, Integer accountId) {
        Account account = accountDAO.findAccountById(accountId);

        if (account.getPassword().equalsIgnoreCase(currentPassword)){
            accountDAO.changePassword(newPassword, accountId);
            return true;
        }

        return false;
    }




    public String hashPassword(String password, String salt) throws NoSuchAlgorithmException {

        MessageDigest md = MessageDigest.getInstance( "SHA-256" );
        password = password + salt;
        md.update(password.getBytes(StandardCharsets.UTF_8 ));
        byte[] digest = md.digest();

        String passwordHash = String.format( "%064x", new BigInteger( 1, digest ) );
        System.out.println(passwordHash);

        return passwordHash;
    }


//    public String saltGen(){
//
//        byte[] salt = new byte[8]; // length is bounded by 7
//        new Random().nextBytes(salt);
//        String generatedSalt = new String(salt, Charset.forName("UTF-8"));
//
//        return generatedSalt;
//
//    }



    public String saltGen(){
        final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        SecureRandom rnd = new SecureRandom();

        StringBuilder sb = new StringBuilder( 8 );
        for( int i = 0; i < 8; i++ )
            sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
        return sb.toString();
    }
}
