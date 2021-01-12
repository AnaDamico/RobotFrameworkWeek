*** Settings ***
Library     app.py


*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=          Welcome     Ana
    Should Be Equal     ${result}   Ola Ana, Bem vindo(a)!