<%-- 
    Document   : confirmation
    Created on : 17/07/2017, 19:05:30
    Author     : ta-ma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="topMenu.jsp"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mensagem de confirmação da operação</title>
    </head>
    <body>
        ${operationMessage}
        <c:set var="operationMessage" scope="session" value=""/>
        <a href="${target}"> <input type="button" value="Ok"/> </a>
    </body>
</html>
