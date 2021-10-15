*** Settings ***
Resource  ../Tests_Imports.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***
#${NEW_USERNAME} =  TestUpdated

*** Test Cases ***
User Changes Username
#    [Setup]  Run Keywords  Begin Web Test
#     ...                   TopNav.Go to Login Page
#     ...                   LoginPage.Populate Login Form And Sumbit  ${VALID_USER_EMAIL}  ${VALID_USER_PASSWORD}
#    ...                    TopNav.Verify User Is Signed In
#    ...                    TopNav.Go To User Profile
    TopNav.Go to Login Page
    LoginPage.Populate Login Form And Sumbit  ${VALID_USER_EMAIL}  ${VALID_USER_PASSWORD}
    TopNav.Verify User Is Signed In
    TopNav.Go To User Profile
    BuiltIn.Log  Step 1: I enter new username
    UserSettings.Input New Username And Save
    TopNav.Navigate To Main Page
    TopNav.Verify User Menu Includes Username  ${NEW_USERNAME}

