*** Settings ***
Library        RequestsLibrary
Library        String
Library        json
Library        Collections

*** Variables ***
${URL}    https://serverest.dev/


*** Keywords ***
Criar sessão na ServeRest
     ${HEADERS}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=serverest    url=${URL}

Criar um usuário novo
    ${PALAVRA_ALEATORIA}    Generate Random String    length=4    chars=[LETTERS]
    ${PALAVRA_ALEATORIA}    Convert To Lower Case    ${PALAVRA_ALEATORIA} 
    Set Test Variable    ${EMAIL_TESTE}    ${PALAVRA_ALEATORIA}@emailteste.com
    Log    ${EMAIL_TESTE}

Cadastrar um usuário criado na ServeRest
    ${BODY}    Create Dictionary    
    ...    nome=Fulano da Silva    
    ...    email=${EMAIL_TESTE}    
    ...    password=teste1234    
    ...    administrador=true

    Log    ${BODY}

    Criar sessão na ServeRest
    ${RESPOSTA}    POST On Session    
    ...    alias=serverest
    ...    url=${URL}/usuarios
    ...    json=${BODY}

    Log    ${RESPOSTA.json()}
    Set Test Variable    ${JSON_RETORNO}    ${RESPOSTA.json()}

Conferir se o usuário foi cadastrado corretamente
    Log    ${JSON_RETORNO}
    Dictionary Should Contain Item    ${JSON_RETORNO}    message    Cadastro realizado com sucesso

Vou repetir o cadastro do usuário
    [Arguments]    ${EMAIL_TESTE}
    ${BODY}    Create Dictionary    
    ...    nome=Fulano da Silva    
    ...    email=${EMAIL_TESTE}    
    ...    password=teste1234    
    ...    administrador=true

    Log    ${BODY}

    Criar sessão na ServeRest
    ${RESPOSTA}    POST On Session    
    ...    alias=serverest
    ...    url=${URL}/usuarios
    ...    json=${BODY}

    Log    ${RESPOSTA.json()}
    Set Test Variable    ${JSON_RETORNO}    ${RESPOSTA.json()}
Verificar se a API não permitiu o cadastro repitido