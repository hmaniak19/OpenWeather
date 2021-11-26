*** Settings ***
Resource  ../Tests_Imports.robot

Library    Collections

*** Variables ***


*** Keywords ***
Get Response From GET Weather request
    [Documentation]  Send GET /weather request And Get Its Response
    [Arguments]  ${params}
    ${response} =    GET  ${API_URL}/weather  params=${params}
    Status Should Be    OK    ${response}
    [Return]  ${response}

Get Weather Of The City By Name
    [Arguments]  ${city}
    ...          ${units}=${EMPTY}
    IF  "${units}" == "${EMPTY}"
        ${params} =    Create Dictionary    q=${city}
        ...                                 appid=${API_KEY}
    ELSE
        ${params} =    Create Dictionary    q=${city}
        ...                                 appid=${API_KEY}
        ...                                 units=${units}
    END
    ${response} =    Get Response From GET Weather request  params=${params}
    ${city_weather} =  Convert To Dictionary  ${response.json()}[main]
    [Return]  ${city_weather}

Get Temperature Of The City By Name
    [Arguments]  ${city}
    ...          ${units}=${EMPTY}
    ${city_weather} =  Get Weather Of The City By Name  city=${city}
    ...                                                 units=${units}
    [Return]  ${city_weather}[temp]

Get Longitude And Latitude From Get Weather Request With Name Param
    [Arguments]  ${city}
    ${params} =    Create Dictionary    q=${city}   appid=${API_KEY}
    ${response} =    Get Response From GET Weather request  params=${params}
    ${city_lon} =  Set Variable  ${response.json()}[coord][lon]
    ${city_lat} =  Set Variable  ${response.json()}[coord][lat]
    [Return]  ${city_lon}  ${city_lat}

Get City Name From Get Weather Request With Coord Param
    [Arguments]  ${lon}
    ...          ${lat}
    ${params} =    Create Dictionary    lat=${lat}  lon=${lon}   appid=${API_KEY}
    ${response} =    Get Response From GET Weather request  params=${params}
    ${city_name} =  Set Variable  ${response.json()}[name]
    [Return]  ${city_name}

Get City Name From Get Weather Request With ID Param
    [Arguments]  ${id}
    ${params} =    Create Dictionary    id=${id}   appid=${API_KEY}
    ${response} =    Get Response From GET Weather request  params=${params}
    ${city_name} =  Set Variable  ${response.json()}[name]
    [Return]  ${city_name}

Check Received Longitude And Latitude Equal To Expected
    [Arguments]  ${received_lon}
    ...          ${received_lat}
    ...          ${expected_lon}
    ...          ${expected_lat}
    Should Be Equal As Numbers  ${received_lon}    ${expected_lon}
    Should Be Equal As Numbers  ${received_lat}  ${expected_lat}

Check Received City Name Equal To Expected
    [Arguments]  ${received_name}
    ...          ${expected_name}
    Should Be Equal As Strings    ${received_name}    ${expected_name}

Check Units Are In Correct Range
    [Arguments]  ${temp}
    ...          ${units}
    IF  "${units}"=="${METRIC_UNITS}"
        Should Be True    -10<${temp}<49
    ELSE IF  "${units}"=="${IMPERIAL_UNITS}"
        Should Be True    50<${temp}<120.2
    ELSE
        Should Be True    283.15<${temp}<322.15
    END



