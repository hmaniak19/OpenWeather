*** Settings ***
Library  SeleniumLibrary
Resource  ../../Tests_Imports.robot


*** Variables ***
${LOGIN_LOADER_LOCATOR} =  //div[@class="owm-loader"]


*** Keywords ***
Navigate To Base URL
    [Arguments]    ${base_url}
    Go To    ${base_url}
    Wait Until Page Contains Element    ${LOGIN_LOADER_LOCATOR}
    Wait Until Page Does Not Contain Element    ${LOGIN_LOADER_LOCATOR}  timeout=10 seconds

Sign in
    TopNav.Navigate to Login Page
    LoginPage.Populate Login Form And Submit  username=${VALID_USER_EMAIL}
    ...                                       password=${VALID_USER_PASSWORD}
    HomePage.Verify Home Page loaded




