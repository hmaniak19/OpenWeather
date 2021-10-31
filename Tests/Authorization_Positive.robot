*** Settings ***
Resource  ../Resources/Tests_Imports.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test


*** Variables ***


*** Test Cases ***
Succussfull Login
    [Setup]  Run Keywords  Begin Web Test
    ...      AND           TopNav.Navigate to Login Page
    BuiltIn.Log    Step 1: I populate login form and click Sign in
    LoginSteps.Populate Login Form And Submit  user_email=${VALID_USER_EMAIL}
    ...                                        user_password=${VALID_USER_PASSWORD}
    HomePage.Verify Home Page Loaded
    TopNav.Verify User Menu Exists

User Successfull Login After Failed Attempt
    [Setup]  Run Keywords  Begin Web Test
    ...      AND           TopNav.Navigate to Login Page
    BuiltIn.Log    Step 1: I enter valid email and invalid password and click Sign in
    LoginSteps.Populate Login Form And Submit  user_email=${VALID_USER_EMAIL}
    ...                                        user_password=invalid password
    LoginPage.Check Login Error Displayed
    BuiltIn.Log    Step 2: I enter valid password and click Sign in
    LoginPage.Fill In User Password Field  user_password=${VALID_USER_PASSWORD}
    LoginPage.Click Login Submit
    HomePage.Verify Home Page Loaded
    TopNav.Verify User Menu Exists












