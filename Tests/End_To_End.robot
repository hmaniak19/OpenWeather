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


*** Test Cases ***
Get Temperature By API And In Web And Verify They Are Equal
    BuiltIn.Log  Step 1: I get city temperature in WEB in Celsius(Metric) and check it is the same as from API
    MainPageSteps.Search For The City  city_name=${CITY_NAME}
    ...                                country=${COUNTRY}
    ...                                city_id=${CITY_ID}
    Check Temperature in Web using API data  city_name=${CITY_NAME}
    ...                                      units=${METRIC_UNITS}
    BuiltIn.Log  Step 2: I click Imperial(Fahrenheit) and get city temperature in WEB and check it is the same as from API
    MainPage.Click Imperial
    Check Temperature in Web using API data  city_name=${CITY_NAME}
    ...                                      units=${IMPERIAL_UNITS}


*** Keywords ***
Check Temperature In Web Using API Data
    [Documentation]  Get temperature by API, Get temperature in WEB and check they are equal
    [Arguments]  ${city_name}
    ...          ${units}
    ${city_temp_by_web_search} =  MainPageSteps.Get Current City Temperature
    ${city_temp_by_api} =  ApiSteps.Get City Temperature By Name  city=${city_name}
    ...                                                           units=${units}
    ${city_temp_by_api_rounded} =  Convert To Number    ${city_temp_by_api}  0
    Should Be Equal As Numbers    ${city_temp_by_api_rounded}    ${city_temp_by_web_search}








