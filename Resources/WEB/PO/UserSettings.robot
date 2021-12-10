*** Settings ***
Resource  ../../Tests_Imports.robot


*** Variables ***
${USERNAME_LOCATOR} =  //input[@id="profile_form_username"]
${USER_SETTINGS_SAVE_LOCATOR} =  //input[@value="Save"]
${USER_PROFILE_SUCCESS_ALERT} =  //div[@class="panel-body"]
${PROFILE_UPDATED_SUCCESS_TEXT} =  Profile was updated successfully


*** Keywords ***
Input Username
    [Documentation]  Fill in username field on User Settings page
    [Arguments]  ${username}
    Wait Until Element Is Visible  ${USERNAME_LOCATOR}
    Input Text  ${USERNAME_LOCATOR}  ${username}

Click Save
    [Documentation]  Click Save on User Settings page
    Wait Until Element Is Visible  ${USER_SETTINGS_SAVE_LOCATOR}
    CLick Element  ${USER_SETTINGS_SAVE_LOCATOR}

Check Successfull Message Displayed
    [Documentation]  Check successfull message displayed on User Settings page
    Wait Until Element Is Visible  ${USER_PROFILE_SUCCESS_ALERT}
    Element Should Contain    ${USER_PROFILE_SUCCESS_ALERT}    ${PROFILE_UPDATED_SUCCESS_TEXT}  ignore_case=true
