<%-- 
    Document   : splitRules
    Created on : 16/07/2017, 16:55:16
    Author     : ta-ma
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="topMenu.jsp"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Criar uma regra de divisão para transação </title>
    </head>
    <body>
        <p> Valor da transação criada: ${transaction.getAmount()} </p>
        <form action="FrontController" method="POST">
            <input type="hidden" name="command" value="Transaction"/>
            <input type="hidden" name="action" value="split"/>
            <p> Id do recebedor 1: 
                <select name="recipient1Id">
                    <c:forEach items="${recipientsList}" var="rc">
                        <option value="${rc.getId()}">       ${rc.getBankAccount().getLegalName()}
                        </option>
                    </c:forEach>
                </select> </p>
            <p> Porcentagem: <input type="number" name="recipient1percentage"/> </p>
            <p> Id do recebedor 2: 
                <select name="recipient2Id">
                    <c:forEach items="${recipientsList}" var="rc">
                        <option value="${rc.getId()}">      ${rc.getBankAccount().getLegalName()}
                        </option>
                    </c:forEach>
                </select> </p>

            <p> Porcentagem do segundo recebedor Será completada automaticamente pelo sistema.  </p>
            <input type="submit" value="Criar transação"/>
        </form>
    </body>
</html>
