*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LOGIN_USERNAME_LOCATOR} =  //input[@id="user_email"]
${LOGIN PASSWORD_LOCATOR} =  //input[@id="user_password"]
${LOGIN_SUBMIT_LOCATOR} =  //input[@value="Submit"]
${LOGIN_ERROR_TEXT_LOCATOR} =  //div[@class="panel-body"]


*** Keywords ***
Populate Login Form And Submit
    [Arguments]    ${username}
    ...            ${password}
    Verify Login Form Displayed
    Input Text  ${LOGIN_USERNAME_LOCATOR}  ${username}
    Input Password  ${LOGIN PASSWORD_LOCATOR}  ${password}
    CLick Element  ${LOGIN_SUBMIT_LOCATOR}

Verify Login Form Displayed
    Wait Until Page Contains Element  ${LOGIN_USERNAME_LOCATOR}

Verify Login Error Displayed
    [Arguments]  ${login_error_text}
    Wait Until Page Contains Element  ${LOGIN_ERROR_TEXT_LOCATOR}  timeout=10 seconds
    Element Should Contain  ${LOGIN_ERROR_TEXT_LOCATOR}  ${login_error_text}






