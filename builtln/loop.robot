*** Test Cases ***
Testing format FOR
    # old format FOR
    new format FOR
    Cria cadastro de produtos (For aninhado)
    For com multiplos parametros
    Tradicional
    Apenas quantidade de laçoes informada (limite superior)
    Aritmético
    Intervalos especificos
    

*** Keywords ***
# old format FOR
    # :FOR  ${animal}  IN  gato  cachorro  cavalo
    #     Log    o animal desse laço é: ${animal}!
    #     Log    Vamos para o próximo animal da Lista...

new format FOR
    FOR  ${animal}  IN  gato  cachorro  cavalo
        Log    O animal desse laço é: ${animal}!    
        Log    Vamos para o próximo animal da lista...
    END

Cria cadastro de produtos (For aninhado)
    FOR  ${PRODUTO}  IN  baby look  camiseta  blusa
        Imprime tamanhos para o produto  ${PRODUTO}
    END

Imprime tamanhos para o produto
    [Arguments]  ${PRODUTO}
    FOR  ${TAMANHO}  IN  P  M  G
        Log    Produto: ${PRODUTO} - Tamanho: ${TAMANHO}
    END

For com multiplos parametros
    FOR  ${INDEX}  ${ENGLISH}  ${FINNISH}  ${PORTUGUESE}  IN
    ...  1         cat         kissa       gato
    ...  2         dog         koira       cachorro
    ...  3         horse       hevonen     cavalo
        Log  Animal ${INDEX}:\nEm inglês: ${ENGLISH}\nEm Finlandês: ${FINNISH}\nEm português: ${PORTUGUESE}
    END

For com numeração
    FOR    ${INDEX}    ${ITEM}    IN ENUMERATE    P    M    G    GG    XG    XXG
        Log    Item da lista: ${ITEM} - Posição do item na lista: ${INDEX}
    END

#### opções IN RANGE

Tradicional
    [Documentation]    Percorre de 1 até 10
    FOR    ${index}    IN RANGE    1    11
        Log    ${index}
    END

Apenas quantidade de laçoes informada (limite superior)
    [Documentation]    Percorre de 0 até 9
    FOR    ${index}    IN RANGE    10
        Log    ${index}
    END

Aritmético
    [Documentation]    Percorre de 0 até 5
    ${var}    Set Variable    ${5}
    FOR    ${index}    IN RANGE    ${var} + 1
        Log    ${index}
    END

Intervalos especificos
    [Documentation]    Percorre de 0 até 30, pulando de 5 em 5
    FOR    ${index}    IN RANGE    0    31    5
        Log    ${index} 
    END