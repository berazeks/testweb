*** Settings ***
Library        SeleniumLibrary
Library        String


*** Variables ***
${URL}      http://automationpractice.com/index.php

*** Keywords ***

Dado que estou na página home do site
    Go To           http://automationpractice.com/index.php
    Title Should Be  My Store

Quando eu clicar no botão superior direito "${LOGAR}"
    Wait Until Element is Visible     //a[contains(text(), "${LOGAR}")]
    Click Element                     //a[contains(text(), "${LOGAR}")]
