*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${LOGIN_LOADER} =  //*[@class="owm-loader"]
${SIGN_IN_LINK} =  //*[@class="user-li"]/a
${LOGIN_USERNAME_LOCATOR} =  id:user_email


*** Keywords ***
Sign in with valid credentials
    Go To    ${URL}
    Wait Until Page Contains Element    ${LOGIN_LOADER}
    Wait Until Page Does Not Contain Element    ${LOGIN_LOADER}
    Click Element  ${SIGN_IN_LINK}
    Wait Until Page Contains Element  ${LOGIN_USERNAME_LOCATOR}



