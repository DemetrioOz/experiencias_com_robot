*** Variables ***
&{DIAS_POR_MES}      
...    janeiro=31
...    fevereiro=28
...    março=31
...    abril=30
...    maio=31
...    junho=30
...    julho=31
...    agosto=31
...    setembro=30
...    outubro=31
...    novembro=30
...    dezembro=31

*** Test Cases ***
Imprimir dias do Mes
    FOR    ${MES}    ${DIAS}    IN    &{DIAS_POR_MES}
      Log To Console    Em ${MES} há ${DIAS} dias!
    END