*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${url}              http://training-wheels-protocol.herokuapp.com/

*** Keywords ***
Nova sessão
    Open Browser                        ${url}                        headlesschrome

Encerra sessão
    Capture Page Screenshot
    Close Browser