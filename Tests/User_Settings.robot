*** Settings ***
Resource  ../Resources/Tests_Imports.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test


*** Variables ***


*** Test Cases ***
User Changes Username
    [Setup]  Run Keywords  Begin Web Test
    ...      AND           TopNav.Navigate to Login Page
    ...      AND           LoginSteps.Sign in
    ...      AND           TopNav.Navigate To User Profile
    BuiltIn.Log  Step 1: I enter new username
    ${NEW_USERNAME} =  String.Generate Random String
    UserSettingsSteps.Input New Username And Save  new_username=${NEW_USERNAME}
    TopNav.Navigate To Main Page
    TopNav.Verify User Menu Includes Username  expected_username=${NEW_USERNAME}


