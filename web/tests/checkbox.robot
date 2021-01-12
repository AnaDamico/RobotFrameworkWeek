*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Variables ***
${check_thor}       id:thor
${check_iron}       css:input[value='iron-man']
${check_panter}     xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Marcando opção com o ID
    Go to                               ${url}/checkboxes
    Select Checkbox                     ${check_thor}
    Checkbox Should Be Selected         ${check_thor}
    
Marcando opção com Css Selector
    Go to                               ${url}/checkboxes
    Select Checkbox                     ${check_iron}
    Checkbox Should Be Selected         ${check_iron}
    
Marcando opção com Xpath
    Go to                               ${url}/checkboxes
    Select Checkbox                     ${check_panter}
    Checkbox Should Be Selected         ${check_panter}
    
