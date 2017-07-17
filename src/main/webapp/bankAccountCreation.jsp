<%-- 
    Document   : bankAccountCreation
    Created on : 16/07/2017, 12:30:47
    Author     : ta-ma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="topMenu.jsp"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Criar uma nova conta bancária </title>
    </head>
    <body>
        <form action="FrontController" method="POST">
            <input type="hidden" name="command" value="BankAccount"/>
            <input type="hidden" name="action" value="create"/>
             <p> Código do banco:<select name="bankId">
                <option value=""></option>
                <option value="1"> 001 - BANCO DO BRASIL S/A</option>
                <option value="2"> 002 - BANCO CENTRAL DO BRASIL</option>
                <option value="3"> 003 - BANCO DA AMAZONIA S.A</option>
                <option value="4"> 004 - BANCO DO NORDESTE DO BRASIL S.A</option>
                <option value="7"> 007 - BANCO NAC DESENV. ECO. SOCIAL S.A</option>
                <option value="8"> 008 - BANCO MERIDIONAL DO BRASIL</option>
                <option value="20"> 020 - BANCO DO ESTADO DE ALAGOAS S.A</option>
                <option value="21"> 021 - BANCO DO ESTADO DO ESPIRITO SANTO S.A</option>
                <option value="22"> 022 - BANCO DE CREDITO REAL DE MINAS GERAIS SA</option>
                <option value="24"> 024 - BANCO DO ESTADO DE PERNAMBUCO</option>
                <option value="25"> 025 - BANCO ALFA S/A</option>
                <option value="26"> 026 - BANCO DO ESTADO DO ACRE S.A</option>
                <option value="27"> 027 - BANCO DO ESTADO DE SANTA CATARINA S.A</option>
                <option value="28"> 028 - BANCO DO ESTADO DA BAHIA S.A</option>
                <option value="29"> 029 - BANCO DO ESTADO DO RIO DE JANEIRO S.A</option>
                <option value="30"> 030 - BANCO DO ESTADO DA PARAIBA S.A</option>
                <option value="31"> 031 - BANCO DO ESTADO DE GOIAS S.A</option>
                <option value="32"> 032 - BANCO DO ESTADO DO MATO GROSSO S.A.</option>
                <option value="33"> 033 - BANCO DO ESTADO DE SAO PAULO S.A</option>
                <option value="34"> 034 - BANCO DO ESADO DO AMAZONAS S.A</option>
                <option value="35"> 035 - BANCO DO ESTADO DO CEARA S.A</option>
                <option value="36"> 036 - BANCO DO ESTADO DO MARANHAO S.A</option>
                <option value="37"> 037 - BANCO DO ESTADO DO PARA S.A</option>
                <option value="38"> 038 - BANCO DO ESTADO DO PARANA S.A</option>
                <option value="39"> 039 - BANCO DO ESTADO DO PIAUI S.A</option>
                <option value="41"> 041 - BANCO DO ESTADO DO RIO GRANDE DO SUL S.A</option>
                <option value="47"> 047 - BANCO DO ESTADO DE SERGIPE S.A</option>
                <option value="48"> 048 - BANCO DO ESTADO DE MINAS GERAIS S.A</option>
                <option value="59"> 059 - BANCO DO ESTADO DE RONDONIA S.A</option>
                <option value="70"> 070 - BANCO DE BRASILIA S.A</option>
                <option value="104"> 104 - CAIXA ECONOMICA FEDERAL</option>
                <option value="106"> 106 - BANCO ITABANCO S.A.</option>
                <option value="107"> 107 - BANCO BBM S.A</option>
                <option value="109"> 109 - BANCO CREDIBANCO S.A</option>
                <option value="116"> 116 - BANCO B.N.L DO BRASIL S.A</option>
                <option value="148"> 148 - MULTI BANCO S.A</option>
                <option value="151"> 151 - CAIXA ECONOMICA DO ESTADO DE SAO PAULO</option>
                <option value="153"> 153 - CAIXA ECONOMICA DO ESTADO DO R.G.SUL</option>
                <option value="165"> 165 - BANCO NORCHEM S.A</option>
                <option value="166"> 166 - BANCO INTER-ATLANTICO S.A</option>
                <option value="168"> 168 - BANCO C.C.F. BRASIL S.A</option>
                <option value="175"> 175 - CONTINENTAL BANCO S.A</option>
                <option value="184"> 184 - BBA - CREDITANSTALT S.A</option>
                <option value="199"> 199 - BANCO FINANCIAL PORTUGUES</option>
                <option value="200"> 200 - BANCO FRICRISA AXELRUD S.A</option>
                <option value="201"> 201 - BANCO AUGUSTA INDUSTRIA E COMERCIAL S.A</option>
                <option value="204"> 204 - BANCO S.R.L S.A</option>
                <option value="205"> 205 - BANCO SUL AMERICA S.A</option>
                <option value="206"> 206 - BANCO MARTINELLI S.A</option>
                <option value="208"> 208 - BANCO PACTUAL S.A</option>
                <option value="210"> 210 - DEUTSCH SUDAMERIKANICHE BANK AG</option>
                <option value="211"> 211 - BANCO SISTEMA S.A</option>
                <option value="212"> 212 - BANCO MATONE S.A</option>
                <option value="213"> 213 - BANCO ARBI S.A</option>
                <option value="214"> 214 - BANCO DIBENS S.A</option>
                <option value="215"> 215 - BANCO AMERICA DO SUL S.A</option>
                <option value="216"> 216 - BANCO REGIONAL MALCON S.A</option>
                <option value="217"> 217 - BANCO AGROINVEST S.A</option>
                <option value="218"> 218 - BBS - BANCO BONSUCESSO S.A.</option>
                <option value="219"> 219 - BANCO DE CREDITO DE SAO PAULO S.A</option>
                <option value="220"> 220 - BANCO CREFISUL</option>
                <option value="221"> 221 - BANCO GRAPHUS S.A</option>
                <option value="222"> 222 - BANCO AGF BRASIL S. A.</option>
                <option value="223"> 223 - BANCO INTERUNION S.A</option>
                <option value="224"> 224 - BANCO FIBRA S.A</option>
                <option value="225"> 225 - BANCO BRASCAN S.A</option>
                <option value="228"> 228 - BANCO ICATU S.A</option>
                <option value="229"> 229 - BANCO CRUZEIRO S.A</option>
                <option value="230"> 230 - BANCO BANDEIRANTES S.A</option>
                <option value="231"> 231 - BANCO BOAVISTA S.A</option>
                <option value="232"> 232 - BANCO INTERPART S.A</option>
                <option value="233"> 233 - BANCO MAPPIN S.A</option>
                <option value="234"> 234 - BANCO LAVRA S.A.</option>
                <option value="235"> 235 - BANCO LIBERAL S.A</option>
                <option value="236"> 236 - BANCO CAMBIAL S.A</option>
                <option value="237"> 237 - BANCO BRADESCO S.A</option>
                <option value="239"> 239 - BANCO BANCRED S.A</option>
                <option value="240"> 240 - BANCO DE CREDITO REAL DE MINAS GERAIS S.</option>
                <option value="241"> 241 - BANCO CLASSICO S.A</option>
                <option value="242"> 242 - BANCO EUROINVEST S.A</option>
                <option value="243"> 243 - BANCO STOCK S.A</option>
                <option value="244"> 244 - BANCO CIDADE S.A</option>
                <option value="245"> 245 - BANCO EMPRESARIAL S.A</option>
                <option value="246"> 246 - BANCO ABC ROMA S.A</option>
                <option value="247"> 247 - BANCO OMEGA S.A</option>
                <option value="249"> 249 - BANCO INVESTCRED S.A</option>
                <option value="250"> 250 - BANCO SCHAHIN CURY S.A</option>
                <option value="251"> 251 - BANCO SAO JORGE S.A.</option>
                <option value="252"> 252 - BANCO FININVEST S.A</option>
                <option value="254"> 254 - BANCO PARANA BANCO S.A</option>
                <option value="255"> 255 - MILBANCO S.A.</option>
                <option value="256"> 256 - BANCO GULVINVEST S.A</option>
                <option value="258"> 258 - BANCO INDUSCRED S.A</option>
                <option value="261"> 261 - BANCO VARIG S.A</option>
                <option value="262"> 262 - BANCO BOREAL S.A</option>
                <option value="263"> 263 - BANCO CACIQUE</option>
                <option value="264"> 264 - BANCO PERFORMANCE S.A</option>
                <option value="265"> 265 - BANCO FATOR S.A</option>
                <option value="266"> 266 - BANCO CEDULA S.A</option>
                <option value="267"> 267 - BANCO BBM-COM.C.IMOB.CFI S.A.</option>
                <option value="275"> 275 - BANCO REAL S.A</option>
                <option value="277"> 277 - BANCO PLANIBANC S.A</option>
                <option value="282"> 282 - BANCO BRASILEIRO COMERCIAL</option>
                <option value="291"> 291 - BANCO DE CREDITO NACIONAL S.A</option>
                <option value="294"> 294 - BCR - BANCO DE CREDITO REAL S.A</option>
                <option value="295"> 295 - BANCO CREDIPLAN S.A</option>
                <option value="300"> 300 - BANCO DE LA NACION ARGENTINA S.A</option>
                <option value="302"> 302 - BANCO DO PROGRESSO S.A</option>
                <option value="303"> 303 - BANCO HNF S.A.</option>
                <option value="304"> 304 - BANCO PONTUAL S.A</option>
                <option value="308"> 308 - BANCO COMERCIAL BANCESA S.A.</option>
                <option value="318"> 318 - BANCO B.M.G. S.A</option>
                <option value="320"> 320 - BANCO INDUSTRIAL E COMERCIAL</option>
                <option value="341"> 341 - BANCO ITAU S.A</option>
                <option value="346"> 346 - BANCO FRANCES E BRASILEIRO S.A</option>
                <option value="347"> 347 - BANCO SUDAMERIS BRASIL S.A</option>
                <option value="351"> 351 - BANCO BOZANO SIMONSEN S.A</option>
                <option value="353"> 353 - BANCO GERAL DO COMERCIO S.A</option>
                <option value="356"> 356 - ABN AMRO S.A</option>
                <option value="366"> 366 - BANCO SOGERAL S.A</option>
                <option value="369"> 369 - PONTUAL</option>
                <option value="370"> 370 - BEAL - BANCO EUROPEU PARA AMERICA LATINA</option>
                <option value="372"> 372 - BANCO ITAMARATI S.A</option>
                <option value="375"> 375 - BANCO FENICIA S.A</option>
                <option value="376"> 376 - CHASE MANHATTAN BANK S.A</option>
                <option value="388"> 388 - BANCO MERCANTIL DE DESCONTOS S/A</option>
                <option value="389"> 389 - BANCO MERCANTIL DO BRASIL S.A</option>
                <option value="392"> 392 - BANCO MERCANTIL DE SAO PAULO S.A</option>
                <option value="394"> 394 - BANCO B.M.C. S.A</option>
                <option value="399"> 399 - BANCO BAMERINDUS DO BRASIL S.A</option>
                <option value="409"> 409 - UNIBANCO - UNIAO DOS BANCOS BRASILEIROS</option>
                <option value="412"> 412 - BANCO NACIONAL DA BAHIA S.A</option>
                <option value="415"> 415 - BANCO NACIONAL S.A</option>
                <option value="420"> 420 - BANCO NACIONAL DO NORTE S.A</option>
                <option value="422"> 422 - BANCO SAFRA S.A</option>
                <option value="424"> 424 - BANCO NOROESTE S.A</option>
                <option value="434"> 434 - BANCO FORTALEZA S.A</option>
                <option value="453"> 453 - BANCO RURAL S.A</option>
                <option value="456"> 456 - BANCO TOKIO S.A</option>
                <option value="464"> 464 - BANCO SUMITOMO BRASILEIRO S.A</option>
                <option value="466"> 466 - BANCO MITSUBISHI BRASILEIRO S.A</option>
                <option value="472"> 472 - LLOYDS BANK PLC</option>
                <option value="473"> 473 - BANCO FINANCIAL PORTUGUES S.A</option>
                <option value="477"> 477 - CITIBANK N.A</option>
                <option value="479"> 479 - BANCO DE BOSTON S.A</option>
                <option value="480"> 480 - BANCO PORTUGUES DO ATLANTICO-BRASIL S.A</option>
                <option value="483"> 483 - BANCO AGRIMISA S.A.</option>
                <option value="487"> 487 - DEUTSCHE BANK S.A - BANCO ALEMAO</option>
                <option value="488"> 488 - BANCO J. P. MORGAN S.A</option>
                <option value="489"> 489 - BANESTO BANCO URUGAUAY S.A</option>
                <option value="492"> 492 - INTERNATIONALE NEDERLANDEN BANK N.V.</option>
                <option value="493"> 493 - BANCO UNION S.A.C.A</option>
                <option value="494"> 494 - BANCO LA REP. ORIENTAL DEL URUGUAY</option>
                <option value="495"> 495 - BANCO LA PROVINCIA DE BUENOS AIRES</option>
                <option value="496"> 496 - BANCO EXTERIOR DE ESPANA S.A</option>
                <option value="498"> 498 - CENTRO HISPANO BANCO</option>
                <option value="499"> 499 - BANCO IOCHPE S.A</option>
                <option value="501"> 501 - BANCO BRASILEIRO IRAQUIANO S.A.</option>
                <option value="502"> 502 - BANCO SANTANDER S.A</option>
                <option value="504"> 504 - BANCO MULTIPLIC S.A</option>
                <option value="505"> 505 - BANCO GARANTIA S.A</option>
                <option value="600"> 600 - BANCO LUSO BRASILEIRO S.A</option>
                <option value="601"> 601 - BFC BANCO S.A.</option>
                <option value="602"> 602 - BANCO PATENTE S.A</option>
                <option value="604"> 604 - BANCO INDUSTRIAL DO BRASIL S.A</option>
                <option value="607"> 607 - BANCO SANTOS NEVES S.A</option>
                <option value="608"> 608 - BANCO OPEN S.A</option>
                <option value="610"> 610 - BANCO V.R. S.A</option>
                <option value="611"> 611 - BANCO PAULISTA S.A</option>
                <option value="612"> 612 - BANCO GUANABARA S.A</option>
                <option value="613"> 613 - BANCO PECUNIA S.A</option>
                <option value="616"> 616 - BANCO INTERPACIFICO S.A</option>
                <option value="617"> 617 - BANCO INVESTOR S.A.</option>
                <option value="618"> 618 - BANCO TENDENCIA S.A</option>
                <option value="621"> 621 - BANCO APLICAP S.A.</option>
                <option value="622"> 622 - BANCO DRACMA S.A</option>
                <option value="623"> 623 - BANCO PANAMERICANO S.A</option>
                <option value="624"> 624 - BANCO GENERAL MOTORS S.A</option>
                <option value="625"> 625 - BANCO ARAUCARIA S.A</option>
                <option value="626"> 626 - BANCO FICSA S.A</option>
                <option value="627"> 627 - BANCO DESTAK S.A</option>
                <option value="628"> 628 - BANCO CRITERIUM S.A</option>
                <option value="629"> 629 - BANCORP BANCO COML. E. DE INVESTMENTO</option>
                <option value="630"> 630 - BANCO INTERCAP S.A</option>
                <option value="633"> 633 - BANCO REDIMENTO S.A</option>
                <option value="634"> 634 - BANCO TRIANGULO S.A</option>
                <option value="635"> 635 - BANCO DO ESTADO DO AMAPA S.A</option>
                <option value="637"> 637 - BANCO SOFISA S.A</option>
                <option value="638"> 638 - BANCO PROSPER S.A</option>
                <option value="639"> 639 - BIG S.A. - BANCO IRMAOS GUIMARAES</option>
                <option value="640"> 640 - BANCO DE CREDITO METROPOLITANO S.A</option>
                <option value="641"> 641 - BANCO EXCEL ECONOMICO S/A</option>
                <option value="643"> 643 - BANCO SEGMENTO S.A</option>
                <option value="645"> 645 - BANCO DO ESTADO DE RORAIMA S.A</option>
                <option value="647"> 647 - BANCO MARKA S.A</option>
                <option value="648"> 648 - BANCO ATLANTIS S.A</option>
                <option value="649"> 649 - BANCO DIMENSAO S.A</option>
                <option value="650"> 650 - BANCO PEBB S.A</option>
                <option value="652"> 652 - BANCO FRANCES E BRASILEIRO SA</option>
                <option value="653"> 653 - BANCO INDUSVAL S.A</option>
                <option value="654"> 654 - BANCO A. J. RENNER S.A</option>
                <option value="655"> 655 - BANCO VOTORANTIM S.A.</option>
                <option value="656"> 656 - BANCO MATRIX S.A</option>
                <option value="657"> 657 - BANCO TECNICORP S.A</option>
                <option value="658"> 658 - BANCO PORTO REAL S.A</option>
                <option value="702"> 702 - BANCO SANTOS S.A</option>
                <option value="705"> 705 - BANCO INVESTCORP S.A.</option>
                <option value="707"> 707 - BANCO DAYCOVAL S.A</option>
                <option value="711"> 711 - BANCO VETOR S.A.</option>
                <option value="713"> 713 - BANCO CINDAM S.A</option>
                <option value="715"> 715 - BANCO VEGA S.A</option>
                <option value="718"> 718 - BANCO OPERADOR S.A</option>
                <option value="719"> 719 - BANCO PRIMUS S.A</option>
                <option value="720"> 720 - BANCO MAXINVEST S.A</option>
                <option value="721"> 721 - BANCO CREDIBEL S.A</option>
                <option value="722"> 722 - BANCO INTERIOR DE SAO PAULO S.A</option>
                <option value="724"> 724 - BANCO PORTO SEGURO S.A</option>
                <option value="725"> 725 - BANCO FINABANCO S.A</option>
                <option value="726"> 726 - BANCO UNIVERSAL S.A</option>
                <option value="728"> 728 - BANCO FITAL S.A</option>
                <option value="729"> 729 - BANCO FONTE S.A</option>
                <option value="730"> 730 - BANCO COMERCIAL PARAGUAYO S.A</option>
                <option value="731"> 731 - BANCO GNPP S.A.</option>
                <option value="732"> 732 - BANCO PREMIER S.A.</option>
                <option value="733"> 733 - BANCO NACOES S.A.</option>
                <option value="734"> 734 - BANCO GERDAU S.A</option>
                <option value="735"> 735 - BACO POTENCIAL</option>
                <option value="736"> 736 - BANCO UNITED S.A</option>
                <option value="737"> 737 - THECA</option>
                <option value="738"> 738 - MARADA</option>
                <option value="739"> 739 - BGN</option>
                <option value="740"> 740 - BCN BARCLAYS</option>
                <option value="741"> 741 - BRP</option>
                <option value="742"> 742 - EQUATORIAL</option>
                <option value="743"> 743 - BANCO EMBLEMA S.A</option>
                <option value="744"> 744 - THE FIRST NATIONAL BANK OF BOSTON</option>
                <option value="745"> 745 - CITIBAN N.A.</option>
                <option value="746"> 746 - MODAL S\A</option>
                <option value="747"> 747 - RAIBOBANK DO BRASIL</option>
                <option value="748"> 748 - SICREDI</option>
                <option value="749"> 749 - BRMSANTIL SA</option>
                <option value="750"> 750 - BANCO REPUBLIC NATIONAL OF NEW YORK (BRA</option>
                <option value="751"> 751 - DRESDNER BANK LATEINAMERIKA-BRASIL S/A</option>
                <option value="752"> 752 - BANCO BANQUE NATIONALE DE PARIS BRASIL S</option>
                <option value="753"> 753 - BANCO COMERCIAL URUGUAI S.A.</option>
                <option value="755"> 755 - BANCO MERRILL LYNCH S.A</option>
                <option value="756"> 756 - BANCO COOPERATIVO DO BRASIL S.A.</option>
                <option value="757"> 757 - BANCO KEB DO BRASIL S.A.</option>
            </select> </p>
            Agência: <p><input type="number" required="" name="bankAgency" maxlength="5"/></p>
            Dígito verificador da agência:(caso não possua digite 0) <p><input type="number"  name="bankAgencyDV" maxlength="1"/></p>
            Conta: <p><input type="number" required name="bankAccount" maxlength="13"/></p>
            Dígito verificador da conta:<p><input type="number"  required name="bankAccountDV" maxlength="2"/></p>
            <p>Tipo de conta:<select name="accountType">
                <option value="contaCorrente"> Conta Corrente </option>
                <option value="contaPoupanca"> Conta Poupança </option>
                <option value="contaCorrente_conjunta"> Conta Corrente Conjunta </option>
                <option value="contaPoupanca_conjunta"> Conta Poupança Conjunta </option>
                </select> </p>
            Documento do titular da conta: <p><input type="number" required name="bankAccountDocument"/></p>
            Nome do titular da conta: <p><input type="text" required name="bankAccountOwner" maxlength="30"/></p>
            <input type="submit" value="Cadastrar conta"/>
        </form>
    </body>
</html>
