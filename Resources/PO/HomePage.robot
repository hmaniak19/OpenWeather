*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${USER_NAV_TABS_LOCATOR} =  //ul[@id="myTab"]


*** Keywords ***
Verify Home Page Loaded
    [Documentation]  Verify Home URL and that user's navigation tab displayed
    Wait Until Location Is  ${HOME_URL}
    Wait Until Page Contains Element  ${USER_NAV_TABS_LOCATOR}
