<%-- 
    Document   : transacitons
    Created on : 14/07/2017, 12:53:17
    Author     : Jonatas Maximiano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="topMenu.jsp"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Transactions </title>
    </head>
    <body>
        <h1> Últimas Transações </h1>
        <table>
            <thead>
            <td> Consumidor: </td>
            <td> Valor da transação (em centavos): </td>
            <td> Método de pagamento </td>
        </thead>
        <c:forEach items="${transactionsList}" var="tx">
            <tr>
                <td>   ${tx.getCustomer().getName()}</td>
                <td>   ${tx.getAmount()} </td>
                <td>   ${tx.getPaymentMethod()} </td>
               
            </tr>
        </c:forEach> 
    </table>
</body>
</html>
