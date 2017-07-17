/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.test.command;

import com.br.test.Util.CustomerUtil;
import com.br.test.Util.RecipientsUtil;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import me.pagar.model.Address;
import me.pagar.model.BankAccount;
import me.pagar.model.Card;
import me.pagar.model.Customer;
import me.pagar.model.PagarMe;
import me.pagar.model.PagarMeException;
import me.pagar.model.Phone;
import me.pagar.model.Recipient;
import me.pagar.model.Recipient.TransferInterval;
import me.pagar.model.SplitRule;
import me.pagar.model.Transaction;
import me.pagar.model.Transaction.PaymentMethod;

/**
 *
 * @author ta-ma
 */
public class TransactionCommand implements Command {

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
            case "load":
                Integer count = 20;
                Integer page = 1;
                Collection<Transaction> transactions = null;
                try {
                    transactions = new Transaction().findCollection(count, page);
                } catch (PagarMeException ex) {
                    Logger.getLogger(TransactionCommand.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.setAttribute("transactionsList", transactions);
                returnPage = "transactions.jsp";
                break;
            case "loadCustomer":
                String customerId = request.getParameter("transactionCustomerID");
                Customer cst = CustomerUtil.load((Integer.parseInt(customerId)));
                request.setAttribute("transactionCustomer", cst);
                returnPage = "transactionDetails.jsp";
                break;

            case "create":
                Integer id = Integer.parseInt(request.getParameter("customerID"));
                Customer customer = CustomerUtil.copy(id);
                Transaction tx = new Transaction();
                tx.setCustomer(customer);
                tx.setAmount(Integer.parseInt(request.getParameter("transactionAmountS")));
                String pm = request.getParameter("paymentMethod");
                if (pm.equals("boleto")) {
                    tx.setPaymentMethod(PaymentMethod.BOLETO);
                } else {
                    tx.setCardHash(request.getParameter("cardHash"));
                    tx.setCardHolderName(request.getParameter("cardHolderS"));
                    tx.setCardNumber(request.getParameter("cardNumberS"));
                    tx.setCardCvv(request.getParameter("cardCVVS"));
                    tx.setCardExpirationDate(request.getParameter("cardExpiraionDateS"));

                }
                String splitRules = request.getParameter("splitRuleS");
                if (splitRules.equals("n")) {
                    try {
                        tx.save();
                        request.getSession().setAttribute("operationMessage", "Operação de cadastro de transação realizada com sucesso. ");
                        request.getSession().setAttribute("target", "FrontController?command=Transaction&action=load");
                        returnPage = "confirmation.jsp";
                    } catch (PagarMeException ex) {
                        Logger.getLogger(TransactionCommand.class.getName()).log(Level.SEVERE, null, ex);
                        request.getSession().setAttribute("operationMessage", "A Operação de cadastro de transação falhou ");
                        request.getSession().setAttribute("target", "index.jsp");
                        returnPage = "confirmation.jsp";
                    }
                } else {
                    request.getSession().setAttribute("transaction", tx);
                    request.setAttribute("recipientsList", RecipientsUtil.load());
                    returnPage = "splitRules.jsp";
                }
                break;
            case "split":
                Transaction tt = (Transaction) request.getSession().getAttribute("transaction");
                Collection<SplitRule> splitRulesC = new ArrayList<SplitRule>();
                int r1p = Integer.parseInt(request.getParameter("recipient1percentage"));
                int r2p = 100 - r1p;
                String r1Id = request.getParameter("recipient1Id");
                String r2Id = request.getParameter("recipient2Id");
                SplitRule sr1 = new SplitRule();
                sr1.setRecipientId(r1Id);
                sr1.setLiable(true);
                sr1.setChargeProcessingFee(true);
                sr1.setPercentage(r1p);
                SplitRule sr2 = new SplitRule();
                sr2.setRecipientId(r2Id);
                sr2.setLiable(true);
                sr2.setChargeProcessingFee(true);
                sr2.setPercentage(r2p);
                splitRulesC.add(sr1);
                splitRulesC.add(sr2);
                tt.setSplitRules(splitRulesC);
                try {
                    tt.save();
                    request.getSession().setAttribute("operationMessage", "Operação de cadastro de transação realizada com sucesso. ");
                    request.getSession().setAttribute("target", "FrontController?command=Recipient&action=loadFromTransactionDone");
                    returnPage = "confirmation.jsp";

                } catch (PagarMeException ex) {
                    request.getSession().setAttribute("operationMessage", "A Operação de cadastro de transação falhou ");
                    request.getSession().setAttribute("target", "index.jsp");
                    returnPage = "confirmation.jsp";
                    Logger.getLogger(TransactionCommand.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getSession().setAttribute("rID", r1Id);
                request.getSession().setAttribute("r2ID", r2Id);
                break;
        }
    }

    @Override
    public String getReturnPage() {
        return returnPage;
    }

}
