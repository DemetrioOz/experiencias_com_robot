*** Settings ***
Resource    ../resources/api_testing_usuarios.resource

*** Variables ***

*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso ServeRest
    Criar um usuário novo
    Cadastrar um usuário criado na ServeRest
    Conferir se o usuário foi cadastrado corretamente

Cenário 02: Cadastrar um novo usuário com sucesso ServeRest
    Criar um usuário novo
    Cadastrar um usuário criado na ServeRest
    Vou repetir o cadastro do usuário
    Verificar se a API não permitiu o cadastro repitido