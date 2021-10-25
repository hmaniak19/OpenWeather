*** Settings ***
Library  SeleniumLibrary
Resource  ../../Tests_Imports.robot


*** Keywords ***
Input New Username And Save
    [Documentation]  Input username name, click Save on User settings page, check successfuul message displayed
    [Arguments]  ${new_username}
    UserSettings.Input Username  username=${new_username}
    UserSettings.Click Save
    UserSettings.Check Successfull Message Displayed