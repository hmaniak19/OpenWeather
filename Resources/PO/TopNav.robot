*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LOGO_LOCATOR} =  class:logo
${SIGN_IN_LINK} =  //li[@class="user-li"]/a
${USER_MENU} =  id:user-dropdown


*** Keywords ***
Verify Logo Loaded
    Wait Until Page Contains Element  ${LOGO_LOCATOR}

Go to Login Page
    Wait Until Page Contains Element  ${SIGN_IN_LINK}
    Click Element  ${SIGN_IN_LINK}

Verify User Is Signed In
    Wait Until Page Contains Element  ${USER_MENU}


