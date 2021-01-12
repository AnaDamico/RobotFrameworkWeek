
*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***
Login com sucesso
    Go To                           ${url}/login
    Input Text                      css:input[name=username]      stark
    Input Text                      css:input[name=password]      jarvis!
    Click Element                   class:btn-login
    Page Should Contain             Olá, Tony Stark. Você acessou a área logada!

Senha Invalida
    Go To                           ${url}/login
    Input Text                      css:input[name=username]        stark
    Input Text                      css:input[name=password]        jarvis123
    Click Element                   class:btn-login

    ${message}=                     Get Web Element                 id:flash

    Should Contain                  ${message.text}=                Senha é invalida!


Usuario Invalido
    Go To                           ${url}/login
    Input Text                      css:input[name=username]        stark123
    Input Text                      css:input[name=password]        jarvis!
    Click Element                   class:btn-login

    ${message}=                     Get Web Element                 id:flash

    Should Contain                  ${message.text}=                O usuário informado não está cadastrado!