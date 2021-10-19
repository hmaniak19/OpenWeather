*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LOGIN_USERNAME_LOCATOR} =  //input[@id="user_email"]
${LOGIN PASSWORD_LOCATOR} =  //input[@id="user_password"]
${LOGIN_SUBMIT_LOCATOR} =  //input[@value="Submit"]
${LOGIN_ERROR_TEXT_LOCATOR} =  //div[@class="panel-body"]


*** Keywords ***
Populate Login Form And Sumbit
    [Arguments]    ${username}
    ...            ${password}
    Wait Until Page Contains Element  ${LOGIN_USERNAME_LOCATOR}
    Input Text  ${LOGIN_USERNAME_LOCATOR}  ${username}
    Input Password  ${LOGIN PASSWORD_LOCATOR}  ${password}
    CLick Element  ${LOGIN_SUBMIT_LOCATOR}

Verify Login Form Displayed
    Wait Until Page Contains Element  ${LOGIN_USERNAME_LOCATOR}

Verify Login Error Displayed
    [Arguments]  ${expected_error_text}
    Wait Until Page Contains Element  ${LOGIN_ERROR_TEXT_LOCATOR}  timeout=10 seconds
    ${login_error_text} =  Get Text  ${LOGIN_ERROR_TEXT_LOCATOR}
    Should Be Equalas Strings  ${login_error_text}  ${expected_error_text}  ignore_case=true






