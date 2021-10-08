*** Settings ***
Resource  ../Resources/PO/DesktopShared.robot
Resource  ../Resources/PO/LoginPage.robot
Resource  ../Resources/PO/TopNav.robot
Resource  ../Resources/CommonWeb.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test
# robot  -d results tests/openweathermap.robot


*** Variables ***
${BROWSER} =  ff
${URL} =  https://openweathermap.org/
${VALID_ USER_EMAIL} =  hanna.maniak19@gmail.com
${VALID_USER_PASSWORD} =  52Mon1489!


*** Test Cases ***
Succussfull Login
    Sign In With Valid Credentials

Failed Login Attempts
    [Template]  Sign In With Invalid Credentials Should Fail
    invalid email  ${VALID_USER_PASSWORD}
    ${VALID_USER_EMAIL}  invalid password
    ${EMPTY}  ${EMPTY}


*** Keywords ***
Sign In With Valid Credentials
    DesktopShared.Navigate To  ${URL}
    TopNav.Go to Login Page
    LoginPage.Populate Login Form And Sumbit  ${VALID_USER_EMAIL}  ${VALID_USER_PASSWORD}
    TopNav.Verify User Is Signed In

Sign In With Invalid Credentials Should Fail
    [Arguments]  ${USER_EMAIL}  ${USER_PASSWORD}
    DesktopShared.Navigate To  ${URL}
    TopNav.Go to Login Page
    LoginPage.Populate Login Form And Sumbit  ${USER_EMAIL}  ${USER_PASSWORD}
    LoginPage.Verify Login Error Displayed


