<%-- 
    Document   : createTransaction
    Created on : 14/07/2017, 13:31:20
    Author     : ta-ma
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="topMenu.jsp"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Criar uma nova transação </title>
    </head>
    <body>
        <p> Para criar uma nova transação, primeiro você deve selecionar a qual cliente essa transação pertence. </p>
        <p> Caso queira cadastrar um novo cliente, <a href="customerSignUp.jsp"> clique aqui </a> </p>
        <form action ="FrontController" method="POST">
            <input type="hidden" name="command" value="Transaction"/>
            <input type="hidden" name="action" value="loadCustomer"/>
            Cliente: <select name="transactionCustomerID"> 
              <c:forEach items="${customersList}" var="customer">
                  <option value="${customer.getId()}">  ${customer.getName()}  </option>
              </c:forEach>
             </select>
            <input type="submit" value="Proseeguir"/>
        </form>
 
    </body>
</html>
