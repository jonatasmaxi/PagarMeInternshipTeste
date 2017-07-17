<%-- 
    Document   : recepientsCreation
    Created on : 16/07/2017, 12:30:30
    Author     : ta-ma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="topMenu.jsp"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Criar um recebedor </title>
    </head>
    <body>
        <form action="FrontController" method="POST">
            <input type="hidden" name="action" value="create"/>
            <input type="hidden" name="command" value="Recipient"/>
            <p> Selecione abaixo a conta bancária do recebedor. Caso a conta bancária
                não esteja cadastrada, cadastre-a <a href="bankAccountCreation.jsp"> aqui </a> </p>
            <select name="bankAccountId">
                <c:forEach items="${accounts}" var="account">
                    <option value="${account.getId()}"> ${account.getAgencia()} - ${account.getConta()}-${account.getContaDv()}</option>
                </c:forEach>
            </select>
            <p> Transferências com intervalo Semanal serão efetuadas no 3º dia de cada semana </p>
            <p> Transferências com intervalo Mensal serão efetuadas no dia 5 </p>
            <p>Intervalo de transferência: <select name="transferInterval">
                    <option value="daily">Diaramente</option>
                    <option value="weekly">Semanalmente </option>
                    <option value="monthly">Mensalmente </option>
                </select> </p>
            <p>Este recebedor pode receber pagamentos automaticamente? 
                <select name="transferEnabled">
                    <option value="y"> Sim </option>
                    <option value="n"> Não </option>                   
                </select>
            </p>
            <p> Este recebedor está ou não habilitado para receber automaticamente o valor disponível para antecipação? 
                <select name="anticipationEnabled">
                    <option value="t">
                        Sim
                    </option>
                    <option value="f">
                        Não
                    </option>
                </select>
            <p> Porcentagem do valor passível de antecipação para este recebedor: <input type="number" name="percentageAnticipation"/> </p>
            <p> <input type="submit" value="Criar Recebedor"/> </p>
        </form>
    </body>
</html>
