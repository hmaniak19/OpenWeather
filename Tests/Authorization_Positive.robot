*** Settings ***
Resource  ../Tests_Imports.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***


*** Test Cases ***
Succussfull Login
    BuiltIn.Log    Step 1: I go to login page, enter email and password and click Sign in
    TopNav.Go to Login Page
    LoginPage.Populate Login Form And Sumbit  ${VALID_USER_EMAIL}  ${VALID_USER_PASSWORD}
    TopNav.Verify User Is Signed In

User Successfull Login After Failed Attempt
    BuiltIn.Log    Step 1: I go to login page, enter valid email and invalid password and click Sign in
    TopNav.Go to Login Page
    LoginPage.Populate Login Form And Sumbit  ${VALID_USER_EMAIL}  invalid password
    LoginPage.Verify Login Error Displayed
    BuiltIn.Log    Step 2: I enter valid email and password and click Sign in
    LoginPage.Populate Login Form And Sumbit  ${VALID_USER_EMAIL}  ${VALID_USER_PASSWORD}
    TopNav.Verify User Is Signed In
    UserNavTabs.Verify User Navigation Tabs Displayed






