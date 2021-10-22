*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${USER_NAV_TABS_LOCATOR} =  //ul[@id="myTab"]


*** Keywords ***
Verify Home Page Loaded
    Wait Until Location Is  ${HOME_URL}
    Wait Until Page Contains Element  ${USER_NAV_TABS_LOCATOR}
