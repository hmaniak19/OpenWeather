*** Settings ***
Resource  ../../Tests_Imports.robot


*** Variables ***
${LOGIN_EMAIL_LOCATOR} =  //input[@id="user_email"]
${LOGIN PASSWORD_LOCATOR} =  //input[@id="user_password"]
${LOGIN_SUBMIT_LOCATOR} =  //input[@value="Submit"]
${LOGIN_ERROR_TEXT_LOCATOR} =  //div[@class="panel-body"]
${LOGIN_ERROR_TEXT} =  Invalid Email or password.


*** Keywords ***
Fill In User Email Field
    [Documentation]  Fill in email field on Login form
    [Arguments]  ${user_email}
    Wait Until Element Is Enabled  ${LOGIN_EMAIL_LOCATOR}
    Input Text  ${LOGIN_EMAIL_LOCATOR}  ${user_email}

Fill In User Password Field
    [Documentation]  Fill in password field on Login form
    [Arguments]  ${user_password}
    Wait Until Element Is Enabled  ${LOGIN PASSWORD_LOCATOR}
    Input Password  ${LOGIN PASSWORD_LOCATOR}  ${user_password}

Click Login Submit
    [Documentation]  Click on Submit button on Login form
    Wait Until Element Is Visible  ${LOGIN_SUBMIT_LOCATOR}
    CLick Element  ${LOGIN_SUBMIT_LOCATOR}

Check Login Error Displayed
    [Documentation]  Check that Login error displayed on Login form after failed login
    Wait Until Element Is Visible  ${LOGIN_ERROR_TEXT_LOCATOR}  timeout=10 seconds
    Element Should Contain  ${LOGIN_ERROR_TEXT_LOCATOR}  ${LOGIN_ERROR_TEXT}

Check Login Form Displayed
    [Documentation]  Check user's email locator on Login form
    Wait Until Element Is Visible  ${LOGIN_EMAIL_LOCATOR}

