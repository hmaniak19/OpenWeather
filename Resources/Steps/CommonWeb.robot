*** Settings ***
Resource  ../../Tests_Imports.robot


*** Variables ***
${START_LOADER_LOCATOR} =  //div[@class="owm-loader"]


*** Keywords ***
Begin Web Test
    Open Browser  about:blank   ${BROWSER}
    Navigate To Base URL
    TopNav.Verify Logo Loaded

End Web Test
    close all browsers

Navigate To Base URL
    Go To    ${BASE_URL}
    Wait Until Page Contains Element    ${START_LOADER_LOCATOR}
    Wait Until Page Does Not Contain Element    ${START_LOADER_LOCATOR}  timeout=10 seconds