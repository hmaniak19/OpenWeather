*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LOGO_LOCATOR} =  //li[@class="logo"]
${SIGNIN_LINK_LOCATOR} =  //li[@class="user-li"]/a
${USER_MENU_LOCATOR} =  //div[@id="user-dropdown"]
${USER_PROFILE_LINK} =  //a[@href="/home"]
#user-dropdown-menu > li:nth-child(4) > a

*** Keywords ***
Verify Logo Loaded
    Wait Until Page Contains Element  ${LOGO_LOCATOR}

Navigate To Main Page
    Verify Logo Loaded
    Click Element  ${LOGO_LOCATOR}

Go to Login Page
    Wait Until Page Contains Element  ${SIGNIN_LINK_LOCATOR}
    Click Element  ${SIGNIN_LINK_LOCATOR}

Verify User Is Signed In
    TopNav.Verify User Menu Exists

Verify User Menu Exists
    Wait Until Page Contains Element  ${USER_MENU_LOCATOR}

Verify User Menu Includes Username
    [Arguments]  ${expected_username}
    Verify User Menu Exists
    ${username} =  get text  ${USER_MENU_LOCATOR}
    Should Be Equalas Strings  ${username}  ${expected_username}


Go To User Profile
    Wait Until Page Contains Element  ${USER_MENU_LOCATOR}
    Click Element  ${USER_MENU_LOCATOR}
    Wait Until Page Contains Element  ${USER_PROFILE_LINK}
    Click Link  ${USER_PROFILE_LINK}





