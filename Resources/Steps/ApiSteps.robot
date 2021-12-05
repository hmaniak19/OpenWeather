*** Settings ***
Resource  ../Tests_Imports.robot
Library    Collections

*** Variables ***


*** Keywords ***
Get City Temperature By Name
    [Documentation]  Get city temprerature by name from GET /Weather request
    [Arguments]  ${city}
    ...          ${units}=${EMPTY}
    ${response} =  Endpoints.Get Weather By Name  city=${city}
    ...                                           units=${units}
    [Return]  ${response}[main][temp]

Get City Longitude And Latitude By Name
    [Documentation]  Get city longitude and latitude by name from GET /Weather request
    [Arguments]  ${city}
    ${response} =    Endpoints.Get Weather By Name  city=${city}
    ${city_lon} =  Set Variable  ${response}[coord][lon]
    ${city_lat} =  Set Variable  ${response}[coord][lat]
    [Return]  ${city_lon}  ${city_lat}

Get City Name By Coords
    [Documentation]  Get city name by coordinates from GET /Weather request
    [Arguments]  ${lon}
    ...          ${lat}
    ${response} =    Get Weather By Coords  lat=${lat}
    ...                                     lon=${lon}
    [Return]  ${response}[name]

Get City Name By ID
    [Documentation]  Get city name by ID from GET /Weather request
    [Arguments]  ${id}
    ${response} =  Get Weather By ID  id=${id}
    [Return]  ${response}[name]

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
    [Documentation]  Check that temperature found by API and by WEB is equal
    [Arguments]  ${city_temp_by_api}
    ...          ${city_temp_by_web}
    ${city_temp_by_api_rounded} =  Convert To Number    ${city_temp_by_api}  0
    Should Be Equal As Numbers    ${city_temp_by_api_rounded}    ${city_temp_by_web}



