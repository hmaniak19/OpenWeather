*** Settings ***
Resource  ../Tests_Imports.robot


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

Check 8 Days Forecast In Web Using API Data
    [Documentation]  Get 8 days forecast in web and check it is the same as from API
    [Arguments]  ${city_lon}
    ...          ${city_lat}
    @{web_forecast} =  MainPageSteps.Get 8 Days Forecast In Web
    @{api_forecast} =  ApiSteps.Get 8 Days Forecast For A City By API  lon=${city_lon}  lat=${city_lat}
    ${web_list_count} =  Get Length    ${web_forecast}
    ${api_list_count} =  Get Length    ${api_forecast}
    Should Be Equal As Numbers    ${web_list_count}    ${api_list_count}
    
    FOR    ${index}    IN RANGE    ${web_list_count}
        ${web_weather} =  Get From List    ${web_forecast}    ${index}
        ${api_weather} =  Get From List    ${api_forecast}    ${index}
        ${web_date} =  Get From Dictionary  ${web_weather}  date
        ${api_date} =  Get From Dictionary  ${api_weather}  date
        Should Be Equal    ${web_date}    ${api_date}
        ${web_temp_max} =  Get From Dictionary  ${web_weather}  temp_max
        ${api_temp_max} =  Get From Dictionary  ${api_weather}  temp_max
        Should Be Equal    ${web_temp_max}    ${api_temp_max}
        ${web_temp_min} =  Get From Dictionary  ${web_weather}  temp_min
        ${api_temp_min} =  Get From Dictionary  ${api_weather}  temp_min
        Should Be Equal    ${web_temp_min}    ${api_temp_min}
        ${web_weather_decr} =  Get From Dictionary  ${web_weather}  weather
        ${api_weather_decr} =  Get From Dictionary  ${api_weather}  weather
        Should Be Equal    ${web_weather_decr}    ${api_weather_decr}
    END