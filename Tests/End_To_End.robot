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


#    Wait Until Element Is Visible  ${DAY_LIST_ROW_LOCATOR}  timeout=10 seconds
#    @{days_list} =  Get WebElements  ${DAY_LIST_ROW_LOCATOR}
#
#    @{web_list} =  Create List
#    FOR  ${day}  IN  @{days_list}
#        ${day_text} =  Get Text    ${day}
#        ${day_list} =  Split String  ${day_text}  \n
#        ${date} =  Get From List    ${day_list}    0
#        ${temp} =  Get From List    ${day_list}    1
#        ${temp_max}  ${temp_min} =  Get Temp Max And Temp Min  string0=${temp}
#        ${weather} =  Get From List    ${day_list}    2
#        &{web_day_dict} =  Create Dictionary  date=${date}  temp_max=${temp_max}  temp_min=${temp_min}  weather=${weather}
#        Append To List    ${web_list}  ${web_day_dict}
#        Log    ${day_text}  #'Thu, Dec 16\n9 / 6°C\nscattered clouds'
#        Log    ${web_day_dict}
#    END
#    Log  ${web_list}
#
#    ${params} =    Create Dictionary    lat=${CITY_LAT}  lon=${CITY_LON}   exclude=minutely,hourly,alerts  appid=${API_KEY}
#    ${response} =  Endpoints.Send One Call Request    ${params}
#    ${week_info} =  Set variable  ${response.json()}[daily]
#    @{week_list} =  Collections.Convert To List  ${week_info}
#    @{api_list} =  Create List
#    FOR  ${day}  IN  @{week_list}
#        Log  ${day}
#        ${date_value} =  Get From Dictionary  ${day}   dt
#        ${correct_date} =  Convert Date    ${date_value}   result_format=%a, %b %d
#
#        ${all_temp} =  Get From Dictionary  ${day}   temp
#        ${temp_max} =  Get From Dictionary  ${all_temp}  max
#        ${temp_max_celcius} =  Convert To Number    ${temp_max-273.15}  0
#        ${temp_max_celcius} =  Convert To Integer    ${temp_max_celcius}
#        ${temp_min} =  Get From Dictionary  ${all_temp}  min
#        ${temp_min_celcius} =  Convert To Number    ${temp_min-273.15}  0
#        ${temp_min_celcius} =  Convert To Integer  ${temp_min_celcius}
#
#        ${all_weather} =  Get From Dictionary  ${day}   weather
#        ${all_weather} =  Get From List  ${all_weather}  0
#        ${weather_descr} =  Get From Dictionary  ${all_weather}   description
#        &{api_day_dict} =  Create Dictionary  date=${correct_date}  temp_max=${temp_max_celcius}  temp_min=${temp_min_celcius}  weather=${weather_descr}
#        Append To List    ${api_list}  ${api_day_dict}
#    END
#    Log  ${api_list}
#
#    ${web_list_count} =  Get Length    ${web_list}
#    ${api_list_count} =  Get Length    ${api_list}
#    Should Be Equal As Numbers    ${web_list_count}    ${api_list_count}
#
#    FOR    ${index}    IN RANGE    ${web_list_count}
#        ${web_weather} =  Get From List    ${web_list}    ${index}
#        ${api_weather} =  Get From List    ${api_list}    ${index}
#        ${web_date} =  Get From Dictionary  ${web_weather}  date
#        ${api_date} =  Get From Dictionary  ${api_weather}  date
#        Should Be Equal    ${web_date}    ${api_date}
#        ${web_temp_max} =  Get From Dictionary  ${web_weather}  temp_max
#        ${api_temp_max} =  Get From Dictionary  ${api_weather}  temp_max
#        Should Be Equal    ${web_temp_max}    ${api_temp_max}
#        ${web_temp_min} =  Get From Dictionary  ${web_weather}  temp_min
#        ${api_temp_min} =  Get From Dictionary  ${api_weather}  temp_min
#        Should Be Equal    ${web_temp_min}    ${api_temp_min}
#        ${web_weather_decr} =  Get From Dictionary  ${web_weather}  weather
#        ${api_weather_decr} =  Get From Dictionary  ${api_weather}  weather
#        Should Be Equal    ${web_weather_decr}    ${api_weather_decr}
#    END

*** Keywords ***
Precondition For Test "Get 8 Days Forecast For A City"
    [Documentation]  Navigate to Main Page and Sign in
    LoginSteps.Sign in
    TopNav.Navigate To Main Page
    MainPageSteps.Verify Main Page Loaded












