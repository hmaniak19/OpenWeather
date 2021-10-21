*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${USER_NAV_TABS_LOCATOR} =  //ul[@id="myTab"]


*** Keywords ***
Verify User Navigation Tabs Displayed
    Wait Until Page Contains Element  ${USER_NAV_TABS_LOCATOR}

Verify Home Page Loaded
    Wait Until Location Is  ${HOME_URL}
