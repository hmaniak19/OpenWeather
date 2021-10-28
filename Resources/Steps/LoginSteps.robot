*** Settings ***
Resource  ../../Tests_Imports.robot


*** Keywords ***
Populate Login Form And Submit
    [Arguments]  ${user_email}
    ...          ${user_password}
    LoginPage.Fill In User Email Field    ${user_email}
    LoginPage.Fill In User Password Field    ${user_password}
    LoginPage.Click Login Submit

Sign in
    TopNav.Navigate to Login Page
    LoginSteps.Populate Login Form And Submit  user_email=${VALID_USER_EMAIL}
    ...                                        user_password=${VALID_USER_PASSWORD}
    HomePage.Verify Home Page Loaded



