*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LOGO_LOCATOR} =  //li[@class="logo"]
${SIGNIN_LINK_LOCATOR} =  //li[@class="user-li"]/a
${USER_MENU_LOCATOR} =  //div[@id="user-dropdown"]
${USER_PROFILE_LINK} =  //a[@href="/home"]


*** Keywords ***
Navigate To Main Page
    Verify Logo Loaded
    Click Element  ${LOGO_LOCATOR}

Navigate to Login Page
    Wait Until Page Contains Element  ${SIGNIN_LINK_LOCATOR}
    Click Element  ${SIGNIN_LINK_LOCATOR}

Navigate To User Profile
    Wait Until Page Contains Element  ${USER_MENU_LOCATOR}
    Click Element  ${USER_MENU_LOCATOR}
    Wait Until Page Contains Element  ${USER_PROFILE_LINK}
    Click Link  ${USER_PROFILE_LINK}

Verify Logo Loaded
    Wait Until Page Contains Element  ${LOGO_LOCATOR}

Verify User Menu Exists
    Wait Until Page Contains Element  ${USER_MENU_LOCATOR}

Verify User Menu Includes Username
    [Arguments]  ${expected_username}
    Verify User Menu Exists
    Element Should Contain  ${USER_MENU_LOCATOR}  ${expected_username}







