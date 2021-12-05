*** Settings ***
Resource  ../Resources/Tests_Imports.robot


*** Variables ***
${CITY_ID} =  2643123
${CITY_NAME} =  Manchester
${COUNTRY} =  GB
${STANDART_UNITS} =  standard
${METRIC_UNITS} =  metric
${IMPERIAL_UNITS} =  imperial


*** Test Cases ***
Get Temperature By API And In Web And Verify They Are Equal
    BuiltIn.Log  Step 1: I get city temperature by city name by API in Celsius(Metric) units
    ${city_temp_by_api_celsius} =  ApiSteps.Get City Temperature By Name  city=${CITY_NAME}
    ...                                                           units=${METRIC_UNITS}
    BuiltIn.Log  Step 2: I get city temperature by city name in WEB in Celsius(Metric) units
    CommonWebSteps.Begin Web Test
    MainPageSteps.Search For The City  city_name=${CITY_NAME}
    ...                                country=${COUNTRY}
    ...                                city_id=${CITY_ID}
    ${city_temp_by_web_search_celsius} =  MainPageSteps.Get Current City Temperature
    BuiltIn.Log  Step 3: Compare temperature in Celsius
    ApiSteps.Check Temperature by API and in WEB Equal  ${city_temp_by_api_celsius}
    ...                                                 ${city_temp_by_web_search_celsius}
    BuiltIn.Log  Step 4: I get city temperature by city name by API in Fahrenheit(Imperial) units
    ${city_temp_by_api_fahrenheit} =  ApiSteps.Get City Temperature By Name  city=${CITY_NAME}
    ...                                                                      units=${IMPERIAL_UNITS}
    BuiltIn.Log  Step 5: I click on Imperial option and get city temperature in WEB in Fahrenheit(Imperial) units
    MainPage.Click Imperial
    ${city_temp_by_web_search_fahrenheit} =  MainPageSteps.Get Current City Temperature
    BuiltIn.Log  Step 6: Compare temperature in Fahrenheit
    ApiSteps.Check Temperature by API and in WEB Equal  ${city_temp_by_api_celsius}
    ...                                                 ${city_temp_by_web_search_celsius}
    CommonWebSteps.End Web Test








