*** Settings ***
Documentation    Suite de testes do cadastro de dog walkers

Library    Browser

***Test Cases ***
Deve poder cadastrar um novo dog walkers

    ${name}             Set Variable            Kellen Teste 
    ${email}            Set Variable            kellen@test.com 
    ${cpf}              Set Variable            00000014141   
    ${cep}              Set Variable            04534011
    ${nomeRua}          Set Variable            Rua Joaquim Floriano
    ${bairro}           Set Variable            Itaim Bibi 
    ${UF}               Set Variable            São Paulo/SP
    ${numero}           Set Variable            1000
    ${complemento}      Set Variable            Apto Test
    ${cnh}              Set Variable            toretto.jpg
    
    #Steps com as validações
    Go to singup page
    Fill signup form    ${name}     ${email}    ${cpf}  ${cep}    ${nomeRua}    ${bairro}   ${UF}   ${numero}   ${complemento}      ${cnh} 
    Submit signup form
    Popup should be     Recebemos o seu cadastro e em breve retornaremos o contato.


*** Keywords ***

Go to singup page
    New Browser    browser=chromium                     headless=False
    New Page       https://walkdog.vercel.app/signup

    Wait For Elements State    form h1    visible    5000
    Get Text                   form h1    equal      Faça seu cadastro

Fill signup form
    [Arguments]     ${name}     ${email}    ${cpf}  ${cep}    ${nomeRua}    ${bairro}   ${UF}   ${numero}   ${complemento}      ${cnh} 
    Fill Text           css=input[name=name]                            ${name}
    Fill Text           css=input[name=email]                           ${email}
    Fill Text           input[placeholder="CPF somente números"]        ${cpf}
    Fill Text           css=input[placeholder*="CEP"]                   ${cep}

    Click               css=input[type=button][value$=CEP]
    
    Get Property        css=input[name=addressStreet]       value   equal   ${nomeRua}
    Get Property        css=input[name=addressDistrict]     value   equal   ${bairro}
    Get Property        css=input[name=addressCityUf]       value   equal   ${UF}
    Fill Text           css=input[name=addressNumber]                       ${numero}
    Fill Text           css=input[name=addressDetails]                      ${complemento}
    
    Upload File By Selector    input[type=file]     ${EXECDIR}/${cnh}

Submit signup form
    Click               css=.button-register

Popup should be
    [Arguments]                ${expected_text}
    Wait For Elements State     css=.swal2-html-container       visible     5
    Get Text                    css=.swal2-html-container       equal       ${expected_text}
        
       
