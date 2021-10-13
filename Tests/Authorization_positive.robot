*** Settings ***
Resource  ../Resources/PO/DesktopShared.robot
Resource  ../Resources/PO/LoginPage.robot
Resource  ../Resources/PO/TopNav.robot
Resource  ../Resources/CommonWeb.robot
Resource  ../Global.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***


*** Test Cases ***
Succussfull Login
    BuiltIn.Log    Step 1: I go to login page, enter email and password and click Sign in
    Sign In With Valid Credentials  ${VALID_USER_EMAIL}  ${VALID_USER_PASSWORD}
    Verify User Is Signed In


*** Keywords ***
Sign In With Valid Credentials
    [Arguments]  ${username}  ${password}
    TopNav.Go to Login Page
    LoginPage.Populate Login Form And Sumbit  ${username}  ${password}

Verify User Is Signed In
    TopNav.Verify User Menu Exists


