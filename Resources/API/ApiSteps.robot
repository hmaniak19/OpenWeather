*** Settings ***
Resource  ../Tests_Imports.robot


*** Keywords ***
Get City Temperature By Name
    [Documentation]  Get city temprerature by name from GET /Weather request
    [Arguments]  ${city}
    ...          ${units}=${EMPTY}
    ${response} =  WeatherEndpoint.Get Weather By Name  city=${city}
    ...                                           units=${units}
    [Return]  ${response}[main][temp]

Get City Longitude And Latitude By Name
    [Documentation]  Get city longitude and latitude by name from GET /Weather request
    [Arguments]  ${city}
    ${response} =    WeatherEndpoint.Get Weather By Name  city=${city}
    ${city_lon} =  Set Variable  ${response}[coord][lon]
    ${city_lat} =  Set Variable  ${response}[coord][lat]
    [Return]  ${city_lon}  ${city_lat}

Get City Name By Coords
    [Documentation]  Get city name by coordinates from GET /Weather request
    [Arguments]  ${lon}
    ...          ${lat}
    ${response} =    WeatherEndpoint.Get Weather By Coords  lat=${lat}
    ...                                               lon=${lon}
    [Return]  ${response}[name]

Get City Name By ID
    [Documentation]  Get city name by ID from GET /Weather request
    [Arguments]  ${id}
    ${response} =  WeatherEndpoint.Get Weather By ID  id=${id}
    [Return]  ${response}[name]

Get Date From Day Weather JSON
    [Documentation]  Get Date in format 'Thu, Dec 16'
    [Arguments]  ${day_weather_json}
    ${date_value} =  Get Value From Json  ${day_weather_json}   $.dt
    ${date} =  DateTime.Convert Date    ${date_value[0]}   result_format=%a, %b %d
    [Return]  ${date}

Get Max Temperature In Celsius From Day Weather JSON
    [Documentation]  Get Max Temperature in format '25'
    [Arguments]  ${day_weather_json}
    ${temp_max} =  Get Value From Json  ${day_weather_json}  $.temp.max
    ${temp_max_celcius} =  Convert To Number    ${temp_max[0]-273.15}  0
    ${temp_max_celcius} =  Convert To Integer    ${temp_max_celcius}
    [Return]  ${temp_max_celcius}

Get Min Temperature In Celsius From Day Weather JSON
    [Documentation]  Get Min Temperature in format '8'
    [Arguments]  ${day_weather_json}
    ${temp_min} =  Get Value From Json  ${day_weather_json}  $.temp.min
    ${temp_min_celcius} =  Convert To Number    ${temp_min[0]-273.15}  0
    ${temp_min_celcius} =  Convert To Integer    ${temp_min_celcius}
    [Return]  ${temp_min_celcius}

Get Weather Description From Day Weather JSON
    [Documentation]  Get Weather Description in format 'broken clouds'
    [Arguments]  ${day_weather_json}
    ${weather_descr} =  Get Value From Json  ${day_weather_json}  $.weather[0].description
    [Return]  ${weather_descr}[0]

Get 8 Days Forecast For A City By API
    [Documentation]  Get list with 8 dictionaries (with 8-day forecast)  where one dictionary=one day weather.
    ...              Format: {'date': 'Thu, Dec 16', 'temp_max': 10, 'temp_min': 6, 'weather': 'broken clouds'}
    [Arguments]  ${lon}
    ...          ${lat}
    ${api_all_weather_forecast} =  OnecallEndpoint.Get 8 Days Forecast For A City  lon=${lon}  lat=${lat}
    @{api_all_weather_forecast} =  Collections.Convert To List  ${api_all_weather_forecast}
    @{api_forecast} =  Create List
    FOR  ${day}  IN  @{api_all_weather_forecast}
        ${date} =  Get Date From Day Weather JSON  day_weather_json=${day}
        ${temp_max_celcius} =  Get Max Temperature In Celsius From Day Weather JSON  day_weather_json=${day}
        ${temp_min_celcius} =  Get Min Temperature In Celsius From Day Weather JSON  day_weather_json=${day}
        ${weather_descr} =  Get Weather Description From Day Weather JSON  day_weather_json=${day}

        &{api_day_dict} =  Create Dictionary  date=${date}  temp_max=${temp_max_celcius}  temp_min=${temp_min_celcius}  weather=${weather_descr}
        Append To List  ${api_forecast}  ${api_day_dict}
    END
    [Return]  @{api_forecast}

Get 5 Days Sunrise and Sunset Forecast For A City By API
    [Documentation]  Get list with 5 dictionaries (5-day forecast)  where one dictionary=one day info.
    ...              Format: {'date': 'Thu, Dec 16', 'sunrise': '08:02am', 'sunset': '03:51pm'}
    [Arguments]  ${lon}
    ...          ${lat}
    ${api_all_weather_forecast} =  OnecallEndpoint.Get 8 Days Forecast For A City  lon=${lon}  lat=${lat}
    @{api_all_weather_forecast} =  Collections.Convert To List  ${api_all_weather_forecast}
    @{api_forecast} =  Create List
    FOR  ${index}  IN RANGE  5
        ${day} =  Get From List    ${api_all_weather_forecast}    ${index}

        ${date} =  Get Date From Day Weather JSON  day_weather_json=${day}

        ${sunrise_timestamp} =  Get From Dictionary  ${day}   sunrise
        ${sunrise} =  ConvertTools.Convert Timestamp To Time  ${sunrise_timestamp}

        ${sunset_timestamp} =  Get From Dictionary  ${day}   sunset
        ${sunset} =  ConvertTools.Convert Timestamp To Time  ${sunset_timestamp}

        &{api_day_dict} =  Create Dictionary  date=${date}  sunrise=${sunrise}  sunset=${sunset}
        Append To List  ${api_forecast}  ${api_day_dict}
    END
    [Return]  @{api_forecast}

Check Received Longitude And Latitude Equal To Expected
    [Documentation]  Check that received Longitude And Latitude are equal to expected
    [Arguments]  ${received_lon}
    ...          ${received_lat}
    ...          ${expected_lon}
    ...          ${expected_lat}
    Should Be Equal As Numbers  ${received_lon}    ${expected_lon}
    Should Be Equal As Numbers  ${received_lat}  ${expected_lat}

Check Received City Name Equal To Expected
    [Documentation]  Check that received city name is equal to expected
    [Arguments]  ${received_name}
    ...          ${expected_name}
    Should Be Equal As Strings    ${received_name}    ${expected_name}

Check Units Are In Correct Range
    [Documentation]  Check temperature is in logic range
    [Arguments]  ${temp}
    ...          ${units}
    IF  "${units}"=="${METRIC_UNITS}"
        Should Be True    -10<${temp}<49
    ELSE IF  "${units}"=="${IMPERIAL_UNITS}"
        Should Be True    50<${temp}<120.2
    ELSE
        Should Be True    283.15<${temp}<322.15
    END

Check Temperature by API and in WEB Equal
    [Documentation]  Check that temperature found by API and by WEB are equal
    [Arguments]  ${city_temp_by_api}
    ...          ${city_temp_by_web}
    ${city_temp_by_api_rounded} =  Convert To Number    ${city_temp_by_api}  0
    Should Be Equal As Numbers    ${city_temp_by_api_rounded}    ${city_temp_by_web}





