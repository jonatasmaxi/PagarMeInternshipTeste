/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.test.Util;

import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import me.pagar.model.PagarMeException;
import me.pagar.model.Recipient;

/**
 *
 * @author ta-ma
 */
public class RecipientsUtil {

    private final static String API_KEY = "ak_test_PtuVPnBt7qxHN0b6ezePmfeWNqqIEd";
    public static ArrayList<Recipient> load(){
        ArrayList<Recipient> recipients = null;
        try {
            recipients = (ArrayList<Recipient>) new Recipient().findCollection(100, 1);
        } catch (PagarMeException ex) {
            Logger.getLogger(RecipientsUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return recipients;
    }
}
