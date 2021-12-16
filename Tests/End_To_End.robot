*** Settings ***
Resource  ../Resources/Tests_Imports.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***
${CITY_ID} =  2643123
${CITY_NAME} =  Manchester
${COUNTRY} =  GB
${STANDART_UNITS} =  standard
${METRIC_UNITS} =  metric
${IMPERIAL_UNITS} =  imperial
${CITY_LON} =  -2.2374
${CITY_LAT} =  53.4809


*** Test Cases ***
Get Temperature By API And In Web And Verify They Are Equal
    BuiltIn.Log  Step 1: I get city temperature in WEB in Celsius(Metric) and check it is the same as from API
    MainPageSteps.Search For The City  city_name=${CITY_NAME}
    ...                                country=${COUNTRY}
    ...                                city_id=${CITY_ID}
    MixedSteps.Check Temperature In Web Using API Data  city_name=${CITY_NAME}
    ...                                                 units=${METRIC_UNITS}
    BuiltIn.Log  Step 2: I click Imperial(Fahrenheit) and get city temperature in WEB and check it is the same as from API
    MainPageSteps.Change Units To Imperial
    MixedSteps.Check Temperature In Web Using API Data  city_name=${CITY_NAME}
    ...                                                 units=${IMPERIAL_UNITS}

Get 8 Days Forecast For A City
    [Setup]  Run Keywords  Begin Web Test
    ...      AND           Precondition For Test "Get 8 Days Forecast For A City"
    BuiltIn.Log  Step 1: I search for the city and get 8 days forecast in web and check it is the same as from API
    MainPageSteps.Search For The City  city_name=${CITY_NAME}
    ...                                country=${COUNTRY}
    ...                                city_id=${CITY_ID}
    MainPageSteps.Verify Correct City Displayed  city_name=${CITY_NAME}
    MainPageSteps.Verify Current Date Displayed
    MixedSteps.Check 8 Days Forecast In Web Using API Data  city_lon=${CITY_LON}  city_lat=${CITY_LAT}


*** Keywords ***
Precondition For Test "Get 8 Days Forecast For A City"
    [Documentation]  Navigate to Main Page and Sign in
    LoginSteps.Sign in
    TopNav.Navigate To Main Page
    MainPageSteps.Verify Main Page Loaded












