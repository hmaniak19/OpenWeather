*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LOGO_LOCATOR} =  //li[@class="logo"]
${SIGNIN_LINK_LOCATOR} =  //li[@class="user-li"]/a
${USER_MENU_LOCATOR} =  //div[@id="user-dropdown"]


*** Keywords ***
Verify Logo Loaded
    Wait Until Page Contains Element  ${LOGO_LOCATOR}

Go to Login Page
    Wait Until Page Contains Element  ${SIGNIN_LINK_LOCATOR}
    Click Element  ${SIGNIN_LINK_LOCATOR}

Verify User Menu Exists
    Wait Until Page Contains Element  ${USER_MENU_LOCATOR}


