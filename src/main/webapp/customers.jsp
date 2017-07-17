<%-- 
    Document   : customers
    Created on : 13/07/2017, 17:24:00
    Author     : ta-ma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="topMenu.jsp"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Clientes </title>
    </head>
    <body>
        <h1> Clientes </h1>
        <table>
            <thead>
                <td> Nome </td>
                <td> E-mail </td>
                <td> Tipo de Documento </td>
                <td> Número do Documento </td>
            </thead>
            <c:forEach items="${customersList}" var="customer">
                <tr>
                    <td>   ${customer.getName()}</td>
                    <td>   ${customer.getEmail()} </td>
                    <td>   ${customer.getDocumentType()} </td>
                    <td>   ${customer.getDocumentNumber()} </td>
                </tr>
            </c:forEach> 
            
        </table>

    </body>
</html>
