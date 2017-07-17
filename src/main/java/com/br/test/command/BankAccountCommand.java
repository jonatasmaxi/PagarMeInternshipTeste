/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.test.command;

import com.br.test.Util.BankAccountUtil;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import me.pagar.model.BankAccount;
import me.pagar.model.PagarMe;
import me.pagar.model.PagarMeException;

/**
 *
 * @author ta-ma
 */
public class BankAccountCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;
    private String returnPage;
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
        switch (action) {
            case "create":
                BankAccount bk = new BankAccount();
                bk.setBankCode(request.getParameter("bankId"));
                bk.setAgencia(request.getParameter("bankAgency"));

                bk.setAgenciaDv(request.getParameter("bankAgencyDV"));
                bk.setConta(request.getParameter("bankAccount"));
                bk.setContaDv(request.getParameter("bankAccountDV"));
                bk.setDocumentNumber(request.getParameter("bankAccountDocument"));
                bk.setDocumentNumber(request.getParameter("bankAccountDocument"));
                bk.setLegalName(request.getParameter("bankAccountOwner"));

                try {
                    bk.save();
                    request.getSession().setAttribute("operationMessage", "Operação de criação de conta bancária realizada com sucesso.");
                    request.getSession().setAttribute("target", "FrontController?command=BankAccount&action=loadFromRecipients");
                } catch (PagarMeException ex) {
                    Logger.getLogger(BankAccountCommand.class.getName()).log(Level.SEVERE, null, ex);
                    request.getSession().setAttribute("operationMessage", "A Operação de criação de conta bancária falhou.");
                    request.getSession().setAttribute("target", "index.jsp");

                }
                returnPage = "confirmation.jsp";
                break;
            case "loadFromRecipients":
                ArrayList<BankAccount> accounts = BankAccountUtil.load();
                request.setAttribute("accounts", accounts);
                returnPage = "recipientsCreation.jsp";
                break;
        }
    }

    @Override
    public String getReturnPage() {
        return returnPage;
    }

}
