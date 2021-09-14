*** Settings ***
Library        SeleniumLibrary
Library        String


*** Variables ***
${LOWER}          qwertyuiopasdfghjklzxcvbnm
&{PESSOA}      nome=Marcel  sobrenome=Kai  senha=12345
&{ENDERECO}    nome=Marcel  sobrenome=Kai  rua=23 de maio  cidade=SAO PAULO  cep=00000  tel=987639199  estado=Arizona
*** Keywords ***
gerar email
    ${EMAIL}=    Generate Random String    5    [LETTERS]
    Set Global Variable    ${EMAIL}

E inserir um e-mail válido
    gerar email
    Wait Until Element Is Visible    //*[@id="email_create"]
    Input Text  //*[@id="email_create"]  ${EMAIL}@hotmail.com

E inserir um e-mail inválido
    Input Text  //*[@id="email"]  L4tesTeX@hotmail.com

E inserir um e-mail válido cadastrado
    Input Text  //*[@id="email"]  ${EMAIL}@hotmail.com

E inserir um password
    Input Text  //*[@id="passwd"]                    ${PESSOA.senha}

E clicar no botão Sign in
    Click Element  //*[@id="SubmitLogin"]

E clicar no botão "Create an account"
    Click Element  //*[@id="SubmitCreate"]

E preencher os campos obrigatórios
    Wait Until Element Is Visible    //*[@id="customer_firstname"]
    Input Text  //*[@id="customer_firstname"]        ${PESSOA.nome}
    Input Text  //*[@id="customer_lastname"]         ${PESSOA.sobrenome}
    Input Text  //*[@id="email"]                     ${EMAIL}@hotmail.com
    Input Text  //*[@id="passwd"]                    ${PESSOA.senha}
    Input Text  //*[@id="firstname"]                 ${ENDERECO.nome}
    Input Text  //*[@id="lastname"]                  ${ENDERECO.sobrenome}
    Input Text  //*[@id="address1"]                  ${ENDERECO.rua}
    Input Text  //*[@id="city"]                      ${ENDERECO.cidade}
    sleep  2
    Click Element   //*[@name="id_state"]
    Select From List By Label  //*[@id="id_state"]   ${ENDERECO.estado}
    Input Text  //*[@id="postcode"]                  ${ENDERECO.cep}
    Input Text  //*[@id="phone"]                     ${ENDERECO.tel}

E clicar em Register para finalizar o cadastro
    Click Element   //*[@id="submitAccount"]

Então a página de gerenciamento da conta deve ser exibida
    Page Should Contain Element  //*[@id="center_column"]//h1[@class="page-heading"][contains(text(), "My account")]

Então é exibida mensagem de erro "${MENSAGEM_ERRO}"
    Wait Until Element is Visible    //*[@id="center_column"]/div[1]
    Page Should Contain Element      //*[@id="center_column"]/div[1]/ol/li[contains(text(), "${MENSAGEM_ERRO}")]
