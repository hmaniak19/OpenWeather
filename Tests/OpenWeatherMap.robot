*** Settings ***
Resource  ../Resources/PO/LoginPage.robot
Resource  ../Resources/CommonWeb.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test
# robot  -d results tests/calculations.robot


*** Variables ***
${BROWSER} =  ff
${URL} =  https://openweathermap.org/

*** Test Cases ***
Valid login
    LoginPage.Sign in with valid credentials



#Invalid login


*** Keywords ***
Login with invalid credentials should fail
