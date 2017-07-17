/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.test.command;

import com.br.test.Util.CustomerUtil;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import me.pagar.model.Address;
import me.pagar.model.Customer;
import me.pagar.model.PagarMe;
import me.pagar.model.PagarMeException;
import me.pagar.model.Phone;

/**
 *
 * @author ta-ma
 */
public class CustomerCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private String returnPage = "index.jsp";
    private final String API_KEY = "ak_test_PtuVPnBt7qxHN0b6ezePmfeWNqqIEd";

    @Override
    public void init(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
        PagarMe.init(API_KEY);
    }

    @Override
    public void run() {
        String action = request.getParameter("action");
        Customer customer = new Customer();
        Address address = new Address();
        Phone phone = new Phone();

        if (action.contains("load")) {

            Integer page = 1;
            Integer count = 10;
            Collection<Customer> customers = CustomerUtil.load(page, count);
            request.setAttribute("customersList", customers);
            switch (action) {
                case "load":
                    returnPage = "customers.jsp";

                    return;
                case "loadFromTransaction":
                    returnPage = "createTransaction.jsp";

                    return;
            }
        }
        switch (action) {
            case "signUp":
                customer.setDocumentNumber(request.getParameter("customerDocument"));
                customer.setDocumentType(request.getParameter("customerDocumentType"));
                customer.setName(request.getParameter("customerName"));
                customer.setEmail(request.getParameter("customerEmail"));
                customer.setGender(request.getParameter("customerGender"));
                address.setStreet(request.getParameter("customerStreet"));
                address.setStreetNumber(request.getParameter("customerStreetNumber"));
                address.setComplementary(request.getParameter("customerComplementary"));
                address.setNeighborhood(request.getParameter("customerNeigh"));
                address.setCity(request.getParameter("customerCity"));
                address.setState(request.getParameter("customerState"));
                address.setZipcode(request.getParameter("customerZipcode"));
                address.setCountry(request.getParameter("customerCountry"));
                phone.setDdi(request.getParameter("customerDDI"));
                phone.setDdd(request.getParameter("customerDDD"));
                phone.setNumber(request.getParameter("customerPhone"));
                customer.setPhone(phone);
                customer.setAddress(address);
                try {
                    request.getSession().setAttribute("operationMessage", "Operação de cadastro de cliente realizada com sucesso. ");
                    request.getSession().setAttribute("target", "FrontController?command=Customer&action=load");
                    returnPage = "confirmation.jsp";
                    customer.save();
                } catch (PagarMeException ex) {
                    Logger.getLogger(CustomerCommand.class.getName()).log(Level.SEVERE, null, ex);
                    request.getSession().setAttribute("operationMessage", "Operação de cadastro de cliente falhou.");
                    request.getSession().setAttribute("target", "index.jsp");
                    returnPage = "confirmation.jsp";
                }
                break;
        }

    }

    @Override
    public String getReturnPage() {
        return returnPage;
    }

}
