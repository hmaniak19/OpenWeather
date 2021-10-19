*** Settings ***
Resource  ../Tests_Imports.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test


*** Variables ***


*** Test Cases ***
Succussfull Login
    [Setup]  Run Keywords  Begin Web Test
    ...      AND           TopNav.Go to Login Page
    BuiltIn.Log    Step 1: I populate login form and click Sign in
    LoginPage.Populate Login Form And Sumbit  ${VALID_USER_EMAIL}
    ...                                       ${VALID_USER_PASSWORD}
    HomePage.Verify Home Page loaded
    HomePage.Verify User Navigation Tabs Displayed
    TopNav.Verify User Menu Exists

User Successfull Login After Failed Attempt
    [Setup]  Run Keywords  Begin Web Test
    ...      AND           TopNav.Go to Login Page
    BuiltIn.Log    Step 1: I enter valid email and invalid password and click Sign in
    LoginPage.Populate Login Form And Sumbit  ${VALID_USER_EMAIL}  invalid password
    LoginPage.Verify Login Error Displayed
    BuiltIn.Log    Step 2: I enter valid email and password and click Sign in
    LoginPage.Populate Login Form And Sumbit  ${VALID_USER_EMAIL}  ${VALID_USER_PASSWORD}
    HomePage.Verify Home Page loaded
    HomePage.Verify User Navigation Tabs Displayed
    TopNav.Verify User Menu Exists












