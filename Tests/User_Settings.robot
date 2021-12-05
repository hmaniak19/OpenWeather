*** Settings ***
Resource  ../Resources/Tests_Imports.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test


*** Variables ***


*** Test Cases ***
User Changes Username
    [Setup]  Run Keywords  Begin Web Test
    ...      AND           Precondition for test "User Changes Username"
    BuiltIn.Log  Step 1: I enter new username
    UserSettingsSteps.Input New Username And Save  new_username=${NEW_USERNAME}
    TopNav.Navigate To Main Page
    TopNav.Verify Username  expected_username=${NEW_USERNAME}


*** Keywords ***
Precondition for test "User Changes Username"
    [Documentation]  Navigate to Login Page, Sign in, Navigate to User Profile
    TopNav.Navigate to Login Page
    LoginSteps.Sign in
    TopNav.Navigate To User Profile
    ${NEW_USERNAME} =  String.Generate Random String
    Set Test Variable   ${NEW_USERNAME}

