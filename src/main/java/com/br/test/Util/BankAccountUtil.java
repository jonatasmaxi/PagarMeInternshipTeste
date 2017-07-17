/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.test.Util;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import me.pagar.model.BankAccount;
import me.pagar.model.PagarMe;
import me.pagar.model.PagarMeException;

/**
 *
 * @author ta-ma
 */
public class BankAccountUtil {

    private final static String API_KEY = "ak_test_PtuVPnBt7qxHN0b6ezePmfeWNqqIEd";

    public static ArrayList<BankAccount> load() {
        PagarMe.init(API_KEY);
        int count = 20;
        int page = 1;
        ArrayList<BankAccount> accounts = null;
        try {
            accounts = (ArrayList<BankAccount>) new BankAccount().findCollection(count, page);
        } catch (PagarMeException ex) {
            Logger.getLogger(BankAccountUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return accounts;
    }
}
