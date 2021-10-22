*** Settings ***
Resource  ../Tests_Imports.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test


*** Variables ***
${LOGIN_ERROR_TEXT} =  Invalid Email or password.


*** Test Cases ***
Succussfull Login
    [Setup]  Run Keywords  Begin Web Test
    ...      AND           TopNav.Navigate to Login Page
    BuiltIn.Log    Step 1: I populate login form and click Sign in
    LoginPage.Populate Login Form And Submit  username=${VALID_USER_EMAIL}
    ...                                       password=${VALID_USER_PASSWORD}
    HomePage.Verify Home Page Loaded
    HomePage.Verify User Navigation Tabs Displayed
    TopNav.Verify User Menu Exists

User Successfull Login After Failed Attempt
    [Setup]  Run Keywords  Begin Web Test
    ...      AND           TopNav.Navigate to Login Page
    BuiltIn.Log    Step 1: I enter valid email and invalid password and click Sign in
    LoginPage.Populate Login Form And Submit  username=${VALID_USER_EMAIL}
    ...                                       password=invalid password
    LoginPage.Verify Login Error Displayed  login_error_text=${LOGIN_ERROR_TEXT}
    BuiltIn.Log    Step 2: I enter valid email and password and click Sign in
    LoginPage.Populate Login Form And Submit  username=${VALID_USER_EMAIL}
    ...                                       password=${VALID_USER_PASSWORD}
    HomePage.Verify Home Page loaded
    HomePage.Verify User Navigation Tabs Displayed
    TopNav.Verify User Menu Exists












