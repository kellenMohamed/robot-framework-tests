*** Settings ***
Documentation        Suite de testes da home page

Library    Browser


*** Test Cases ***
Home page deve estar online
    New Browser    browser=chromium    headless=False
    New Page        https://walkdog.vercel.app/

    #Sleep       5
    Get Text    h1    equal    Cuidado e diversão em cada passo
    Get Text    p     equal    Quer gerar uma renda extra passeando com pets? Faça parte da nossa comunidade de dog walkers.
    
    Take Screenshot


