*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LOGIN_USERNAME_LOCATOR} =  id:user_email
${LOGIN PASSWORD_LOCATOR} =  id:user_password
${LOGIN_SUBMIT_LOCATOR} =  //input[@value="Submit"]
${LOGIN_ERROR_LOCATOR} =  //div[@class="panel panel-red"]


*** Keywords ***
Populate Login Form And Sumbit
    [Arguments]    ${username}
    ...            ${password}
    Wait Until Page Contains Element  ${LOGIN_USERNAME_LOCATOR}
    Input Text  ${LOGIN_USERNAME_LOCATOR}  ${username}
    Input Password  ${LOGIN PASSWORD_LOCATOR}  ${password}
    CLick Element  ${LOGIN_SUBMIT_LOCATOR}

Verify Login Error Displayed
    Wait Until Page Contains Element  ${LOGIN_ERROR_LOCATOR}  timeout=10 seconds






