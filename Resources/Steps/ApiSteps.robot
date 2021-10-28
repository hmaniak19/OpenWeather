*** Settings ***
Resource  ../../Tests_Imports.robot

Library    Collections

*** Variables ***


*** Keywords ***
Get Weather Of The City By Name
    [Arguments]  ${city}
    ${params} =    Create Dictionary    q=${city}   appid=${API_KEY}
    ${response} =    GET  ${API_URL}/weather  params=${params}
    Status Should Be    OK    ${response}
    ${city_weather} =  Convert To Dictionary  ${response.json()}[main]
    ${city_coord} =  Convert To Dictionary  ${response.json()}[coord]
    [Return]  ${city_weather}  ${city_coord}

Get Weather Of The City By Coord
    [Arguments]  ${lon}  ${lat}
    ${params} =    Create Dictionary    lat=${lat}  lon=${lon}   appid=${API_KEY}
    ${response} =    GET  ${API_URL}/weather  params=${params}
    ${city_weather} =  Convert To Dictionary  ${response.json()}[main]
    ${city_name} =  Set Variable  ${response.json()}[name]
    [Return]  ${city_weather}  ${city_name}

Get Weather Of The City By ID
    [Arguments]  ${id}
    ${params} =    Create Dictionary    id=${id}   appid=${API_KEY}
    ${response} =    GET  ${API_URL}/weather  params=${params}
    ${city_weather} =  Convert To Dictionary  ${response.json()}[main]
    ${city_name} =  Set Variable  ${response.json()}[name]
    [Return]  ${city_weather}  ${city_name}

Verify Received Coords Equal To Expected
    [Arguments]  ${received_coord}  ${expected_coord}
    Should Be Equal As Strings    ${received_coord}    ${expected_coord}

Verify Received City Name Equal To Expected
    [Arguments]  ${received_name}  ${expected_name}
    Should Be Equal As Strings    ${received_name}    ${expected_name}


