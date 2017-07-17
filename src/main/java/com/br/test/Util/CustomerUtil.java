/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.test.Util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import me.pagar.model.Address;
import me.pagar.model.Customer;
import me.pagar.model.PagarMe;
import me.pagar.model.PagarMeException;
import me.pagar.model.Phone;

/**
 *
 * @author ta-ma
 */
public class CustomerUtil {

    private final static String API_KEY = "ak_test_PtuVPnBt7qxHN0b6ezePmfeWNqqIEd";

    public static Collection<Customer> load(int page, int count) {
        Collection<Customer> customers = null;
        PagarMe.init(API_KEY);
        try {
            customers = new Customer().findCollection(count, page);
        } catch (PagarMeException ex) {
            Logger.getLogger(CustomerUtil.class.getName()).log(Level.SEVERE, null, ex);
        }

        return customers;
    }

    public static Customer load(int id) {
        PagarMe.init(API_KEY);
        Customer customer = null;
        try {
            customer = new Customer().find(id);
        } catch (PagarMeException ex) {
            Logger.getLogger(CustomerUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customer;
    }

    public static Customer copy(int id) {
        Customer cst = load(id);
        Customer customer = new Customer();
        customer.setName(cst.getName());
        customer.setEmail(cst.getEmail());
        customer.setDocumentNumber(cst.getDocumentNumber());
        ArrayList<Address> adresses = (ArrayList<Address>) cst.getAddresses();
        Address address = adresses.get(0);
        customer.setAddress(address);
        ArrayList<Phone> phones = (ArrayList<Phone>) cst.getPhones();
        Phone phone = phones.get(0);
        customer.setPhone(phone);
        return customer;

    }
}
