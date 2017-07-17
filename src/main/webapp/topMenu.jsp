<%-- 
    Document   : topMenu
    Created on : 13/07/2017, 19:55:25
    Author     : ta-ma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
       <ul class="menu">
            <li> <a href="FrontController?command=Customer&action=load"> Clientes </a> </li>
            <li> <a href="customerSignUp.jsp"> Cadastro de Clientes </a> </li>
            <li> <a href="FrontController?command=Transaction&action=load"> Transações </a> </li>
            <li> <a href="FrontController?command=Customer&action=loadFromTransaction"> Criar uma transação </a> </li>
            <li> <a href="FrontController?command=BankAccount&action=loadFromRecipients"> Criar Recebedor </a> </li>
        </ul>
    </body>
</html>
