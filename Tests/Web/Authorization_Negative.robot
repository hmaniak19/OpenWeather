*** Settings ***
Resource  ../../Resources/Tests_Imports.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test


*** Variables ***


*** Test Cases ***
Failed Login Attempts
    [Template]  Sign In With Invalid Credentials Should Fail
    case=User enters invalid email and valid password  user_email=${INVALID_USER_EMAIL}  user_password=${VALID_USER_PASSWORD}
    case=User enters valid email and invalid password  user_email=${VALID_USER_EMAIL}  user_password=${INVALID_USER_PASSWORD}
    case=User didn't enter anything on login page  user_email=${EMPTY}  user_password=${EMPTY}


*** Keywords ***
Sign In With Invalid Credentials Should Fail
    [Documentation]  It is a Template to check failed login test with invalid username/password
    [Arguments]  ${case}
    ...          ${user_email}
    ...          ${user_password}
    TopNav.Navigate to Login Page
    LoginSteps.Populate Login Form And Submit  user_email=${user_email}
    ...                                        user_password=${user_password}
    LoginPage.Check Login Error Displayed
    LoginPage.Check Login Form Displayed
