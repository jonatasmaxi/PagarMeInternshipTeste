<%-- 
    Document   : CustomerSignUp
    Created on : 13/07/2017, 15:46:40
    Author     : ta-ma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="topMenu.jsp"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Formulário para cadastro de clientes</title>
    </head>
    <body>
        <form action="FrontController" method="POST">
            <h3>Personal Information</h3>
            <input type ="hidden" name="command" value="Customer" />
            <input type="hidden" name="action" value="signUp"/>
            <p> Document Number: <input type="number" name="customerDocument"/> </p>
            <p> Document Type: <input type="radio" name="customerDocumentType" value="CPF" checked> CPF
                <input type="radio" name="customerDocumentTyper" value="CNPJ"> CNPJ
            </p>
            <p> Name: <input type="text" name="customerName" /> </p>
            <p> Gender:
            <input type="radio" name="customerGender" value="M" checked/> Male
            <input type="radio" name="customerGender" value="F"/> Female
            </p>
            <p> E-mail: <input type="email" name="customerEmail"/> </p>
            <h3> Address </h3>
            <p> Street: <input type="text" name="customerStreet"/> </p>
            <p> Number: <input type="number" name="customerStreetNumber"/> </p>
            <p> Complementary: <input type="text" name="customerComplementaty" /></p>
            <p> Neighborhood: <input type="text" name="customerNeigh"/> </p>
            <p> City: <input type="text" name="customerCity"/> </p>
            <p> State: 	
                <select name="customerState"> 
                    <option value="">Select State </option> 
                    <option value="ac">AC</option> 
                    <option value="al">AL</option> 
                    <option value="am">AM</option> 
                    <option value="ap">AP</option> 
                    <option value="ba">BA</option> 
                    <option value="ce">CE</option> 
                    <option value="df">DF</option> 
                    <option value="es">ES</option> 
                    <option value="go">GO</option> 
                    <option value="ma">MA</option> 
                    <option value="mt">MT</option> 
                    <option value="ms">MS</option> 
                    <option value="mg">MG</option> 
                    <option value="pa">PA</option> 
                    <option value="pb">PB</option> 
                    <option value="pr">PR</option> 
                    <option value="pe">PE</option> 
                    <option value="pi">PI</option> 
                    <option value="rj">RJ </option> 
                    <option value="rn">RN</option> 
                    <option value="ro">RO</option> 
                    <option value="rs">RS</option> 
                    <option value="rr">RR</option> 
                    <option value="sc">SC</option> 
                    <option value="se">SE</option> 
                    <option value="sp">SP</option> 
                    <option value="to">TO</option> 
                </select>
            <p> Zipcode <input tyoe="text" name="customerZipcode"/> </p>
            <p> Country <input type="text" name="customerCountry"/> </p>
            <h3> Phone </h3>
            <p> DDI: <input type="number" name="customerDDI"/> </p>
            <p> DDD: <input type="number" name="customerDDD"/> </p>
            <p> Phone <input type="number" name="customerPhone"/> </p>   
            <input type="submit" value="Cadastrar"/>
        </form>
    </body>
</html>
