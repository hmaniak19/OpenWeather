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
    BuiltIn.Log  Step 1: I search for the city
    MainPageSteps.Search For The City  city_name=${CITY_NAME}
    ...                                country=${COUNTRY}
    ...                                city_id=${CITY_ID}
    MainPageSteps.Verify Search Result City  city_name=${CITY_NAME}
    MainPageSteps.Verify Search Result Date
    BuiltIn.Log  Step 2: I get 8 days forecast in web and check it is the same as from API
    @{web_forecast} =  MainPageSteps.Get 8 Days Forecast In Web
    @{api_forecast} =  ApiSteps.Get 8 Days Forecast For A City By API  lon=${city_lon}
    ...                                                                lat=${city_lat}
    Check 8 Days Forecast In Web Equal To API  web_forecast_list=@{web_forecast}
    ...                                        api_forecast_list=@{api_forecast}

Get 5 Days Sunrise and Sunset Forecast For A City
    [Setup]  Run Keywords  Begin Web Test
    ...      AND           Precondition For Test "Get 5 Days Sunrise and Sunset Forecast For A City"
    BuiltIn.Log  Step 1: I search for the city
    MainPageSteps.Search For The City  city_name=${CITY_NAME}
    ...                                country=${COUNTRY}
    ...                                city_id=${CITY_ID}
    MainPageSteps.Verify Search Result City  city_name=${CITY_NAME}
    MainPageSteps.Verify Search Result Date
    BuiltIn.Log  Step 2: I get sunrise and sunset time for today and check it is the same as from API
    MixedSteps.Check Sunrise And Sunset Time For Today  API_Forecast=${API_Forecast}
    BuiltIn.Log  Step 3: I click on the next day 4 times, get its sunrise and sunset time and check it is the same as from API
    MixedSteps.Check Sunrise And Sunset Time For Future Days Range    days_range=4
    ...                                                               API_Forecast=${API_Forecast}
    BuiltIn.Log  Step 4: I click on the previous day 3 times, get its sunrise and sunset time and check it is the same as from API
    MixedSteps.Check Sunrise And Sunset Time For Previous Days Range  days_range=3
    ...                                                               API_Forecast=${API_Forecast}


*** Keywords ***
Precondition For Test "Get 8 Days Forecast For A City"
    [Documentation]  Navigate to Main Page and Sign in
    LoginSteps.Sign in
    TopNav.Navigate To Main Page
    MainPageSteps.Verify Main Page Loaded


Precondition For Test "Get 5 Days Sunrise and Sunset Forecast For A City"
    [Documentation]  Navigate to Main Page, Sign in, Get sunrise and sunset values for a city for 5 days via API
    LoginSteps.Sign in
    TopNav.Navigate To Main Page
    MainPageSteps.Verify Main Page Loaded
    MainPage.Accept Cookies
    ${API_Forecast} =  ApiSteps.Get 5 Days Sunrise and Sunset Forecast For A City By API    lon=${CITY_LON}
    ...                                                                                     lat=${CITY_LAT}
    Set Test Variable    ${API_Forecast}

Check 8 Days Forecast In Web Equal To API
    [Documentation]  Check That Date, Sunrise And Sunset Of A Day From Web Are Equal Date From API
    [Arguments]  ${web_forecast_list}  ${api_forecast_list}
    ${web_list_count} =  Get Length    ${web_forecast_list}
    ${api_list_count} =  Get Length    ${api_forecast_list}
    Should Be Equal As Numbers    ${web_list_count}    ${api_list_count}
    FOR    ${index}    IN RANGE    ${web_list_count}
        ${web_weather} =  Get From List    ${web_forecast_list}    ${index}
        ${api_weather} =  Get From List    ${api_forecast_list}    ${index}
        Should Be Equal    ${web_weather.date}    ${api_weather.date}
        Should Be Equal    ${web_weather.temp_max}    ${api_weather.temp_max}
        Should Be Equal    ${web_weather.temp_min}    ${api_weather.temp_min}
        Should Be Equal    ${web_weather.weather}    ${api_weather.weather}
    END













