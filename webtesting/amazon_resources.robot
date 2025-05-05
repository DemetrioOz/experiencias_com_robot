*** Settings ***
Library  SeleniumLibrary

*** Variables *** 
${URL}    https://www.amazon.com.br/
${MENU_ELETRONICOS}    //a[contains(@href,'electronics')]
${HEADER_ELETRONICOS}    //h1[contains(-,'Eletrônicos e Tecnologia')]

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot    Close Browser

Acessar a home page do site da Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}


Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@class='a-color-base a-link-normal a-block'][contains(.,'${NOME_CATEGORIA}')]
    

Digitar o nome de produto "${PRODUTO}" no campo de Pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de Pesquisa
    Click Element    locator=nav-search-submit-button

O sistema deve exibir a tela com o resultado da pesquisa, listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[constains(.,'${PRODUTO}')])[3]
    
  
# Gherkin Steps

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site da Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "${TITULO}"
    Verificar se o título da página fica "${TITULO}"

E o texto "${FRASE}" deve ser exibido na página
    Verificar se aparece a frase "${FRASE}"

E a categoria "${NOME_CATEGORIA}"
    Verificar se aparece a categoria "${NOME_CATEGORIA}"

Quando pesquisar pelo produto "${PRODUTO}"
    Digitar o nome de produto "${PRODUTO}" no campo de Pesquisa

E um produto da linha "${PRODUTO}" deve ser mostrado na página
    O sistema deve exibir a tela com o resultado da pesquisa, listando o produto "${PRODUTO}"