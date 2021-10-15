*** Settings ***
Resource  ../Tests_Imports.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***


*** Test Cases ***
Failed Login Attempts
    [Template]  Sign In With Invalid Credentials Should Fail
    Case 1: User enters invalid email and valid password  invalid email  ${VALID_USER_PASSWORD}
    Case 1: User enters valid email and invalid password  ${VALID_USER_EMAIL}  invalid password
    Case 1: User didn't enter anything on login page  ${EMPTY}  ${EMPTY}


*** Keywords ***
Sign In With Invalid Credentials Should Fail
    [Arguments]  ${CASE}  ${USER_EMAIL}  ${USER_PASSWORD}
    TopNav.Go to Login Page
    LoginPage.Populate Login Form And Sumbit  ${USER_EMAIL}  ${USER_PASSWORD}
    LoginPage.Verify Login Error Displayed