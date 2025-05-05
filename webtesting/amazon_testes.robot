
*** Settings ***
Documentation  Essa suite testa o site da Amazon.com.br
Resource       amazon_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador

*** Test Cases *** 

Caso de teste numero 1 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste Verifica o menu eletrônicos do site da Amazon
    ...              e verifica a categoria Computadores e Informática
    [Tags]           menus categorias
    Acessar a home page do site da Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
  

Caso de teste numero 2 - Pesquisa de um Produto
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca_produtos lista_busca
    Acessar a home page do site da Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de Pesquisa
    Clicar no botão de Pesquisa
    O sistema deve exibir a tela com o resultado da pesquisa, listando o produto "Console Xbox Series S"
