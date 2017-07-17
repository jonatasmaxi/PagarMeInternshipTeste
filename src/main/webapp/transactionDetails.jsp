<%-- 
    Document   : transactionDetails
    Created on : 14/07/2017, 23:00:55
    Author     : ta-ma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="topMenu.jsp"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="https://assets.pagar.me/pagarme-js/3.0/pagarme.min.js"></script>
        <script>
            $(document).ready(function () {
                var form = $("#payment_form")
                form.submit(function (event) {
                    event.preventDefault();
                    var card = {};
                    if ($('input[name="paymentMethod"]:checked').val() == 'creditCard') {
                     
                        card.card_holder_name = $("#formCard #card_holder_name").val()
                        card.card_expiration_date = $("#formCard #card_expiration_month").val() + '' + $("#formCard #card_expiration_year").val()
                        card.card_number = $("#formCard #card_number").val()
                        card.card_cvv = $("#formCard #card_cvv").val()
                        // pega os erros de validação nos campos do form e a bandeira do cartão
                        var cardValidations = pagarme.validate({card: card})
                        //Então você pode verificar se algum campo não é válido
                        if (!cardValidations.card.card_number)
                            console.log('Oops, número de cartão incorreto')
                        if (!cardValidations.card.card_cvv)
                            console.log('Oops, Código de verificação do cartão incorreto')
                        if (!cardValidations.card.card_expiration_date)
                            console.log('Oops, data de expiração incorreta')
                        if (!cardValidations.card.card_holder_name)
                            console.log('Oops, Nome do portador inválido')
                        //Mas caso esteja tudo certo, você pode seguir o fluxo
                        pagarme.client.connect({encryption_key: 'ek_test_93nbTN4oBKeYDqcun439rlQ4tbES83'})
                                .then(client => client.security.encrypt(card))
                                .then(card_hash => sendInfo(card_hash, card))

                    } else {
                        sendInfo("", card)
                    }


                    return true
                })
            });

            function sendInfo(hash, card) {
                // console.log(card);
                document.getElementById("hashS").value = hash;
                document.getElementById("payment_method").value = $('input[name="paymentMethod"]:checked').val();
                console.log($('input[name="genderS"]:checked').val());
                console.log(document.getElementById("payment_method").value);
                document.getElementById("card_numberS").value = card.card_number;
                document.getElementById("card_holder_nameS").value = card.card_holder_name;
                document.getElementById("cardVerCodeS").value = card.card_cvv;
                document.getElementById("card_expiration_dateS").value = card.card_expiration_date;
                document.getElementById("transaction_amountS").value = $("#form #amount").val();
                document.getElementById("split_ruleS").value = $("#form #split_rule").val();
                var form = $("#informationForm");
                //console.log(form);
              //  alert("Filho da Puta!!!!!!!" + hash);
                form.submit();
                // document.getElementById("informationForm").sub
            }

        </script>
        <title>Detalhes da transação </title>
    </head>
    <body>
        <div id="form">
            <form id="payment_form"  method="POST">
                <input type="hidden" name="customerID" value="${transactionCustomer.getId()}"/>
                <p> Valor (em centavos): <input type="number" name="transactionAmount" id="amount"/> </p>
                Método de Pagamento: 
                <p> <input type="radio" name="paymentMethod" id="paymentMet" value="creditCard"/> Cartão de Crédito </p>
                <div id="formCard">
                    Número do cartão: <input type="text" name="cardNumber"  id="card_number"/>
                    Nome (como escrito no cartão): <input type="text" name="cardHolder"  id="card_holder_name"/>
                    Mês de expiração: <input type="text" name="cardExpirationMonth"  id="card_expiration_month"/>
                    Ano de expiração: <input type="text" name="cardExpirationYear"  id="card_expiration_year"/>
                    Código de segurança: <input type="text" name="cardCvv"  id="card_cvv"/>
                </div>
                <p><input type="radio" name="paymentMethod" id="paymentMet" value="boleto"/> Boleto </p>
                <p> Regras de Divisão para transação? 
                    <select name="splitRule" id="split_rule">
                        <option value="y"> Sim </option>
                        <option value="n"> Não </option>
                    </select>
                </p> 
                <input type="submit" value="Enviar">
            </form>
            <form id="informationForm" action="FrontController" method="POST">
                <input type="hidden" name="transactionAmountS" id="transaction_amountS"/>
                <input type="hidden" name="paymentMethod" id="payment_method"/>
                <input type="hidden" name="command" value="Transaction"/>
                <input type="hidden" name="action" value="create"/>
                <input type="hidden" name="customerID" value="${transactionCustomer.getId()}"/>
                <input type="hidden" id="hashS" name="cardHash"/>
                <input type="hidden" name="cardNumberS"  id="card_numberS"/>
                <input type="hidden" name="cardHolderS"  id="card_holder_nameS"/>
                <input type="hidden" name="cardExpiraionDateS"  id="card_expiration_dateS">
                <input type="hidden" name="cardCVVS" id="cardVerCodeS"/>
                <input type="hidden" name="splitRuleS" id="split_ruleS"/>
            </form>
        </div>
    </body>
</html>
