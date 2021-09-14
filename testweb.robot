*** Settings ***
Resource   resources.robot
Resource   home.robot
Resource   login.robot
Library         String

Test Setup     Abrir navegador
Test Teardown  Fechar navegador

*** Variables ***


*** Test Case ***

# Cadastrar usuário
Caso de Teste 01: Cadastrar Cliente
    Dado que estou na página home do site
    Quando eu clicar no botão superior direito "Sign in"
    E inserir um e-mail válido
    E clicar no botão "Create an account"
    E preencher os campos obrigatórios
    E clicar em Register para finalizar o cadastro
    Então a página de gerenciamento da conta deve ser exibida

# Logar com o usuário cadastrado do Caso de teste 01
Caso de Teste 02: Login de usuário cadastrado
    Dado que estou na página home do site
    Quando eu clicar no botão superior direito "Sign in"
    E inserir um e-mail válido cadastrado
    E inserir um password
    E clicar no botão Sign in
    Então a página de gerenciamento da conta deve ser exibida

# Logar com o usuário inváldio
Caso de Teste 03: Login de usuário inválido
    Dado que estou na página home do site
    Quando eu clicar no botão superior direito "Sign in"
    E inserir um e-mail inválido
    E inserir um password
    E clicar no botão Sign in
    Então é exibida mensagem de erro "Authentication failed"

#Logar com usuário em branco
Caso de Teste 04: Login em branco
    Dado que estou na página home do site
    Quando eu clicar no botão superior direito "Sign in"
    E clicar no botão Sign in
    Então é exibida mensagem de erro "An email address required"
