<%-- 
    Document   : balanceTransaction
    Created on : 17/07/2017, 13:14:49
    Author     : ta-ma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="topMenu.jsp"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saldo dos recebedores desta transação</title>
    </head>
    <body>
        <h1>Saldo dos recebedores desta transação</h1>
        <p> <h2> Dados do recebedor 1:  </h2> </p>
        <p> Nome do titular da conta: ${rec1.getBankAccount().getLegalName()} </p>
        <p> Agência: ${rec1.getBankAccount().getAgencia()} -  ${rec1.getBankAccount().getAgenciaDv()}  </p>
        <p> Conta:  ${rec1.getBankAccount().getConta()} -  ${rec1.getBankAccount().getContaDv()}</p>
        <p> Saldo Disponível (em centavos) :  ${balanceR1.getAvailable().getAmount()} </p>
        <p> Saldo a Receber  (em centavos): ${balanceR1.getWaitingFunds().getAmount()} </p>
        <p> <h2> Dados do recebedor 2:  </h2> </p>
        <p> Nome do titular da conta: ${rec2.getBankAccount().getLegalName()} </p>
        <p> Agência: ${rec2.getBankAccount().getAgencia()} -  ${rec2.getBankAccount().getAgenciaDv()}  </p>
        <p> Conta:  ${rec2.getBankAccount().getConta()} -  ${rec2.getBankAccount().getContaDv()}</p>
        <p> Saldo Disponível(em centavos): ${balanceR2.getAvailable().getAmount()} </p>
        <p> Saldo a Receber(em centavos):  ${balanceR2.getWaitingFunds().getAmount()} </p>
        <a href="index.jsp"> <input type="button" value="Ok"/> </a>
    </body>
</html>
