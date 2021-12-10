*** Settings ***
Resource  ../../Tests_Imports.robot


*** Variables ***
${LOGO_LOCATOR} =  //li[@class="logo"]
${SIGNIN_LINK_LOCATOR} =  //li[@class="user-li"]/a
${USER_MENU_LOCATOR} =  //div[@id="user-dropdown"]
${USER_PROFILE_LINK} =  //a[@href="/home"]
${SEARCH_BAR_LOCATOR} =  //div[@id="desktop-menu"]//input[@placeholder="Weather in your city"]


*** Keywords ***
Navigate To Main Page
    [Documentation]  Navigate to main page by clicking on Logo
    Verify Logo Loaded
    Click Element  ${LOGO_LOCATOR}

Navigate to Login Page
    [Documentation]  Navigate to Login Form by clicking on Sign in link
    Wait Until Element Is Visible  ${SIGNIN_LINK_LOCATOR}
    Click Element  ${SIGNIN_LINK_LOCATOR}

Navigate To User Profile
    [Documentation]  Navigate to User Profile link from the user's menu
    Wait Until Element Is Visible  ${USER_MENU_LOCATOR}
    Click Element  ${USER_MENU_LOCATOR}
    Wait Until Element Is Visible  ${USER_PROFILE_LINK}
    Click Link  ${USER_PROFILE_LINK}

Verify Logo Loaded
    [Documentation]  Check Logo locator
    Wait Until Element Is Visible  ${LOGO_LOCATOR}

Verify User Menu Exists
    [Documentation]  Check User Menu locator
    Wait Until Page Contains Element  ${USER_MENU_LOCATOR}

Verify Username
    [Documentation]  Check that user's name at the Top navigation bar is equal to the name passed in Arguments
    [Arguments]  ${expected_username}
    Verify User Menu Exists
    Element Should Contain  ${USER_MENU_LOCATOR}  ${expected_username}







