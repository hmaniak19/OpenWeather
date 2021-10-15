*** Settings ***
Library  SeleniumLibrary
Library  String


*** Variables ***
${USERNAME_LOCATOR} =  //input[@id="profile_form_username"]
${USER_SETTINGS_SAVE_LOCATOR} =  //input[@value="Save"]
${USER_PROFILE_SUCCESS_ALERT} =  //div[@class="panel-body"]


*** Keywords ***
Input New Username And Save
    Wait Until Page Contains Element  ${USERNAME_LOCATOR}
    ${random_string} =  String.Generate Random String
    Set Global Variable  ${NEW_USERNAME}  ${random_string}
    Input Text  ${USERNAME_LOCATOR}  ${NEW_USERNAME}
    CLick Element  ${USER_SETTINGS_SAVE_LOCATOR}
    Verify Success Message Displayed

Verify Success Message Displayed
    Wait Until Page Contains Element  ${USER_PROFILE_SUCCESS_ALERT}
    ${success_text} =  get text  ${USER_PROFILE_SUCCESS_ALERT}
    Should Be Equalas Strings  ${success_text}  Profile was updated successfully  ignore_case=true