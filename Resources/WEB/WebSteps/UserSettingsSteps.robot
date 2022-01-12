*** Settings ***
Resource  ../../Tests_Imports.robot


*** Keywords ***
Input New Username And Save
    [Documentation]  Input username name, click Save on User settings page, check successfuul message displayed
    [Arguments]  ${new_username}
    UserSettingsPage.Input Username  username=${new_username}
    UserSettingsPage.Click Save
    UserSettingsPage.Check Successfull Message Displayed