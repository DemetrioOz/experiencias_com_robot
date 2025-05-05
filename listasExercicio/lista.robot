*** Variables ***
@{MESES}   janeiro
...        fevereiro
...        março
...        abril
...        maio
...        junho
...        julho
...        agosto
...        setembro
...        outubro
...        novembro
...        dezembro
...    

*** Test Cases ***
Imprimir Meses com FOR
    FOR    ${MES}    IN    @{MESES}
        Log To Console    ${MES}
    END
