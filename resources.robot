*** Settings ***
Library        SeleniumLibrary
Library        String


*** Variables ***
${LOWER}          qwertyuiopasdfghjklzxcvbnm

${URL}      http://automationpractice.com/index.php
${BROWSER}  chrome
*** Keywords ***

Abrir navegador
    Open Browser    http://automationpractice.com/index.php   ${BROWSER}

Fechar navegador
    Close Browser
