*** Settings ***
Library  SeleniumLibrary
Resource  ../../Tests_Imports.robot


*** Variables ***
${LOGIN_LOADER_LOCATOR} =  //div[@class="owm-loader"]


*** Keywords ***
Navigate To
    [Arguments]    ${start_url}
    Go To    ${start_url}
    Wait Until Page Contains Element    ${LOGIN_LOADER_LOCATOR}
    Wait Until Page Does Not Contain Element    ${LOGIN_LOADER_LOCATOR}  timeout=10 seconds

Sign in
    TopNav.Go to Login Page
    LoginPage.Populate Login Form And Sumbit  ${VALID_USER_EMAIL}
    ...                                       ${VALID_USER_PASSWORD}
    HomePage.Verify Home Page loaded




