*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LOGO_LOCATOR} =  //li[@class="logo"]
${SIGNIN_LINK_LOCATOR} =  //li[@class="user-li"]/a
${USER_MENU_LOCATOR} =  //div[@id="user-dropdown"]
${USER_PROFILE_LINK} =  //a[@href="/home"]


*** Keywords ***
Navigate To Main Page
    [Documentation]  Navigate to main page by clicking on Logo
    Verify Logo Loaded
    Click Element  ${LOGO_LOCATOR}

Navigate to Login Page
    [Documentation]  Navigate to Login Form by clicking on Sign in link
    Wait Until Page Contains Element  ${SIGNIN_LINK_LOCATOR}
    Click Element  ${SIGNIN_LINK_LOCATOR}

Navigate To User Profile
    [Documentation]  Navigate to User Profile link from the user's menu
    Wait Until Page Contains Element  ${USER_MENU_LOCATOR}
    Click Element  ${USER_MENU_LOCATOR}
    Wait Until Page Contains Element  ${USER_PROFILE_LINK}
    Click Link  ${USER_PROFILE_LINK}

Verify Logo Loaded
    [Documentation]  Check Logo locator
    Wait Until Page Contains Element  ${LOGO_LOCATOR}

Verify User Menu Exists
    [Documentation]  Check User Menu locator
    Wait Until Page Contains Element  ${USER_MENU_LOCATOR}

Verify User Menu Includes Username
    [Documentation]  Check that user's name at the Top navigation bar is equal to the name passed in Arguments
    [Arguments]  ${expected_username}
    Verify User Menu Exists
    Element Should Contain  ${USER_MENU_LOCATOR}  ${expected_username}







