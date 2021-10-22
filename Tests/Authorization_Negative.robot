*** Settings ***
Resource  ../Tests_Imports.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test


*** Variables ***
${LOGIN_ERROR_TEXT} =  Invalid Email or password.


*** Test Cases ***
Failed Login Attempts
    [Template]  Sign In With Invalid Credentials Should Fail
    case=User enters invalid email and valid password  user_email=invalid email  user_password=${VALID_USER_PASSWORD}
    case=User enters valid email and invalid password  user_email=${VALID_USER_EMAIL}  user_password=invalid password
    case=User didn't enter anything on login page  user_email=${EMPTY}  user_password=${EMPTY}


*** Keywords ***
Sign In With Invalid Credentials Should Fail
    [Arguments]  ${case}
    ...          ${user_email}
    ...          ${user_password}
    TopNav.Navigate to Login Page
    LoginPage.Populate Login Form And Submit  username=${user_email}
    ...                                       password=${user_password}
    LoginPage.Verify Login Error Displayed  login_error_text=${LOGIN_ERROR_TEXT}
    LoginPage.Verify Login Form Displayed
