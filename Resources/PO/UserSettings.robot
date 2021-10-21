*** Settings ***
Library  SeleniumLibrary
Library  String


*** Variables ***
${USERNAME_LOCATOR} =  //input[@id="profile_form_username"]
${USER_SETTINGS_SAVE_LOCATOR} =  //input[@value="Save"]
${USER_PROFILE_SUCCESS_ALERT} =  //div[@class="panel-body"]
${PROFILE_UPDATED_SUCCESS_TEXT} =  Profile was updated successfully


*** Keywords ***
Input New Username And Save
    [Arguments]  ${new_username}
    Wait Until Page Contains Element  ${USERNAME_LOCATOR}
    Input Text  ${USERNAME_LOCATOR}  ${new_username}
    CLick Element  ${USER_SETTINGS_SAVE_LOCATOR}
    Wait Until Page Contains Element  ${USER_PROFILE_SUCCESS_ALERT}
    Element Should Contain    ${USER_PROFILE_SUCCESS_ALERT}    ${PROFILE_UPDATED_SUCCESS_TEXT}  ignore_case=true