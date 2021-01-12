
*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***
Login com sucesso
    Go To                           ${url}/login
    Login With                      stark  jarvis!
    Page Should Contain             Olá, Tony Stark. Você acessou a área logada!

Senha Invalida
    Go To                           ${url}/login
    Login With                      stark  jarvis123
    ${message}=                     Get Web Element                 id:flash
    Should Contain                  ${message.text}=                Senha é invalida!

Usuario Invalido
    Go To                               ${url}/login
    Login With                          stark123      jarvis!

    # Input Text                        css:input[name=username]                stark123
    # Input Text                        css:input[name=password]                jarvis!
    # Click Element                     class:btn-login
    # ${message}=                       Get Web Element                         id:flash
    # Should Contain                    ${message.text}=                        O usuário informado não está cadastrado!

    Should Contain Login Alert          O usuário informado não está cadastrado!


*** Keywords ***
Login With
    [Arguments]     ${uname}        ${pass}

    Input Text                      css:input[name=username]      ${uname}
    Input Text                      css:input[name=password]      ${pass}
    Click Element                   class:btn-login

Should Contain Login Alert
    [Arguments]                     ${expect_message}=       
    ${message}=                     Get Web Element                 id:flash
    Should Contain                  ${message.text}=                Senha é invalida!