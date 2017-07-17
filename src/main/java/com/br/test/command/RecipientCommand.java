/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.br.test.command;

import com.br.test.Util.BankAccountUtil;
import java.util.ArrayList;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import me.pagar.model.Balance;
import me.pagar.model.BankAccount;
import me.pagar.model.PagarMe;
import me.pagar.model.PagarMeException;
import me.pagar.model.Recipient;
import me.pagar.model.Recipient.TransferInterval;

/**
 *
 * @author ta-ma
 */
public class RecipientCommand implements Command {

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
                Recipient recipient = new Recipient();
                recipient.setBankAccountId(Integer.parseInt(request.getParameter("bankAccountId")));
                String transferInterval = request.getParameter("transferInterval");
                switch (transferInterval) {
                    case "daily":
                        recipient.setTransferInterval(TransferInterval.DAILY);
                        break;
                    case "weekly":
                        recipient.setTransferInterval(TransferInterval.WEEKLY);
                        recipient.setTransferDay(3);
                        break;
                    case "monthly":
                        recipient.setTransferInterval(TransferInterval.MONTHLY);
                        recipient.setTransferDay(5);
                        break;
                }
                String transferEnabled = request.getParameter("transferEnabled");
                if (transferEnabled.equals("y")) {
                    recipient.setTransferEnabled(true);
                } else {
                    recipient.setTransferEnabled(false);
                }
                String anticipationEnabled = request.getParameter("anticipationEnabled");
                if (anticipationEnabled.equals("t")) {
                    recipient.setAutomaticAnticipationEnabled(true);
                    recipient.setAnticipatableVolumePercentage(Integer.parseInt(request.getParameter("percentageAnticipation")));
                } else {
                    recipient.setAutomaticAnticipationEnabled(false);
                }

                try {
                    request.getSession().setAttribute("operationMessage", "Operação de cadastro de recebedor realizada com sucesso. ");
                    request.getSession().setAttribute("target", "index.jsp");
                    recipient.save();
                } catch (PagarMeException ex) {
                    Logger.getLogger(RecipientCommand.class.getName()).log(Level.SEVERE, null, ex);
                    request.getSession().setAttribute("operationMessage", "A operação de cadastro de recebedor falhou. ");
                    request.getSession().setAttribute("target", "index.jsp");
                }
                returnPage = "confirmation.jsp"; 
                break;
            case "loadFromTransactionDone":
                String rID = (String) request.getSession().getAttribute("rID");
                String r2ID = (String) request.getSession().getAttribute("r2ID");
                Balance b1 = null;
                Balance b2 = null;
                Recipient r1 = null;
                Recipient r2 = null;

                try {
                    b1 = new Recipient().find(rID).balance();
                    b2 = new Recipient().find(r2ID).balance();
                    r1 = new Recipient().find(rID);
                    r2 = new Recipient().find(r2ID);
                } catch (PagarMeException ex) {
                    Logger.getLogger(RecipientCommand.class.getName()).log(Level.SEVERE, null, ex);
                }

                request.getSession().setAttribute("balanceR1", b1);
                request.getSession().setAttribute("balanceR2", b2);
                request.getSession().setAttribute("rec1", r1);
                request.getSession().setAttribute("rec2", r2);
                returnPage = "balanceTransaction.jsp";
        }
    }

    @Override
    public String getReturnPage() {
        return returnPage;
    }

}
