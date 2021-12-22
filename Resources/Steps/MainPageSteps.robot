*** Settings ***
Resource  ../Tests_Imports.robot


*** Keywords ***
Search For The City
    [Documentation]  Search For The City And Click Search Button
    [Arguments]  ${city_name}
    ...          ${country}
    ...          ${city_id}
    MainPage.Type City Name In The Search    city_name=${city_name}
    MainPage.Click Search
    MainPage.Click On City Name In Search Dropdown  city_name=${city_name}
    ...                                             country=${country}
    Wait Until Location Is  ${BASE_URL}city/${city_id}

Get Current City Temperature
    [Documentation]  Get The Temperature (only Number) Of The City On The Main Page (remove units)
    ${current_city_temperature} =  MainPage.Get Current City Temperature
    ${city_temp_splitted_list} =  Split String  ${current_city_temperature}  °
    ${current_city_temp_by_web} =  Get From List  ${city_temp_splitted_list}  0
    [Return]  ${current_city_temp_by_web}

Get Current City Name
    [Documentation]  Get The Name Of The City On The Main Page (remove country)
    ${current_city_name_full} =  MainPage.Get Current City Name
    ${city_name_splitted_list} =  Split String  ${current_city_name_full}  ,
    ${current_city_name} =  Get From List  ${city_name_splitted_list}  0
    [Return]  ${current_city_name}

Get Current Date
    [Documentation]  Convert Current Date format on the Main Page from "Dec 16, 04:54am" to "Dec 16"
    ${current_datetime} =  MainPage.Get Current DateTime
    ${current_date_splitted_list} =  Split String  ${current_datetime}  ,
    ${current_date} =  Get From List  ${current_date_splitted_list}  0
    [Return]  ${current_date}

Get 8 Days Forecast In Web
    [Documentation]  Get list with 8 dictionaries (with 8-day forecast)  where one dictionary=one day weather.
    ...              Format: {'date': 'Thu, Dec 16', 'temp_max': 10, 'temp_min': 6, 'weather': 'broken clouds'}
    @{web_elements_list} =  MainPage.Get Web Elements List Of 8 Days Forecast
    @{web_forecast} =  Create List
    FOR  ${day_element}  IN  @{web_elements_list}
        ${day_text} =  Get Text    ${day_element}
        ${day_list} =  Split String  ${day_text}  \n
        ${date} =  Get From List    ${day_list}    0
        ${temp} =  Get From List    ${day_list}    1
        ${temp_max}  ${temp_min} =  MainPageSteps.Get Temp Max And Temp Min Of A Day  day_temp=${temp}
        ${weather} =  Get From List    ${day_list}    2
        &{web_day_dict} =  Create Dictionary  date=${date}  temp_max=${temp_max}  temp_min=${temp_min}  weather=${weather}
        Append To List    ${web_forecast}  ${web_day_dict}
    END
    [Return]  @{web_forecast}

Get Temp Max And Temp Min Of A Day
    [Documentation]  Get temp max and temp min from the string "9 / 6°C"
    [Arguments]  ${day_temp}
    ${day_temp} =  Split String    ${day_temp}   /
    ${temp_max} =  Get From List    ${day_temp}    0
    ${temp_max} =  Convert To Integer    ${temp_max}
    ${temp_min} =  Get From List    ${day_temp}    1
    ${temp_min} =  Split String    ${temp_min}   °
    ${temp_min} =  Get From List    ${temp_min}    0
    ${temp_min} =  Convert To Integer    ${temp_min}
    [Return]  ${temp_max}  ${temp_min}

Get Sunrise And Sunset For Selected Day
    [Documentation]  Click on Details of current day and get sunrise and sunset time
    ...              Format: {'date': 'Thu, Dec 16', 'sunrise': '08:02am', 'sunset': '03:51pm'}
    ${selected_date} =  MainPage.Get Selected Date From Day Detailed View In 8-day Forecast
    ${sunrise_time} =  MainPage.Get Sunrise Time
    ${sunset_time} =  MainPage.Get Sunset Time
    &{web_day_dict} =  Create Dictionary  date=${selected_date}  sunrise=${sunrise_time}  sunset=${sunset_time}
    [Return]  &{web_day_dict}

Get Sunrise And Sunset For The Next Day
    [Arguments]  ${current_day}

Get Sunrise And Sunset For The Previous Day
    [Arguments]  ${current_day}

Change Units To Imperial
    [Documentation]  Click on Imperial and check that loader disappears
    MainPage.Click Imperial
    Check Loader Disappears

Verify Main Page Loaded
    [Documentation]  Verify that url is correct and loader disappears
    Wait Until Location Is  ${BASE_URL}
    Check Loader Disappears

Check Loader Disappears
    [Documentation]  Check that loader appears and disappears when all info is loaded on the page
#    Wait Until Page Contains Element    ${START_LOADER_LOCATOR}
    Wait Until Page Does Not Contain Element    ${START_LOADER_LOCATOR}  timeout=10 seconds

Verify Correct City Displayed
    [Documentation]  Verifies that city given in Arguments is displayed on the Main Page
    [Arguments]  ${city_name}
    ${city_name_in_web} =  MainPageSteps.Get Current City Name
    Should Be Equal    ${city_name_in_web}    ${city_name}

Verify Current Date Displayed
    [Documentation]  Verifies today's date is displayed on the Main Page
    ${current_date_in_web} =  MainPageSteps.Get Current Date
    ${current_date} =  DateTime.Get Current Date  result_format=%b %d
    Should Be Equal  ${current_date_in_web}  ${current_date}




