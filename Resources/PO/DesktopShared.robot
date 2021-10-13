*** Settings ***
Library  SeleniumLibrary
Resource  ./TopNav.robot


*** Variables ***
${LOGIN_LOADER_LOCATOR} =  //div[@class="owm-loader"]


*** Keywords ***
Navigate To
    [Arguments]    ${start_url}
    Go To    ${start_url}
    Wait Until Page Contains Element    ${LOGIN_LOADER_LOCATOR}
    Wait Until Page Does Not Contain Element    ${LOGIN_LOADER_LOCATOR}  timeout=10 seconds
    TopNav.Verify Logo Loaded




