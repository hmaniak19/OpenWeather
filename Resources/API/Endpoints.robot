*** Settings ***
Resource  ../Tests_Imports.robot

*** Keywords ***
Send Get Weather Request
    [Documentation]  Send GET /weather request And Get Its Response
    [Arguments]  ${params}
    ${response} =    GET  ${API_URL}/weather  params=${params}
    Status Should Be    OK    ${response}
    [Return]  ${response}

Get Weather By Name
    [Documentation]  Get response from GET /weather request with City Name param
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
    ${response} =    Send Get Weather Request  params=${params}
    [Return]  ${response.json()}


Get Weather By ID
    [Documentation]  Get response from GET /weather request with City ID param
    [Arguments]  ${id}
    ${params} =    Create Dictionary    id=${id}   appid=${API_KEY}
    ${response} =    Send Get Weather Request  params=${params}
    [Return]  ${response.json()}

Get Weather By Coords
    [Documentation]  Get response from GET /weather request with City Coordinates param
    [Arguments]  ${lon}
    ...          ${lat}
    ${params} =    Create Dictionary    lat=${lat}  lon=${lon}   appid=${API_KEY}
    ${response} =    Send Get Weather Request  params=${params}
    [Return]  ${response.json()}

Send One Call Request
    [Documentation]  Send GET /onecall request And Get Its Response
    [Arguments]  ${params}
    ${response} =    GET  ${API_URL}/onecall  params=${params}
    Status Should Be    OK    ${response}
    [Return]  ${response}

Get 8 Days Forecast For A City
    [Documentation]  Get response from GET /onecall request with City Coordinates param, execlude
    [Arguments]  ${lon}
    ...          ${lat}
    ${params} =    Create Dictionary    lat=${lat}  lon=${lon}   execlude=minutely,hourly,alerts    appid=${API_KEY}
    ${api_forecast} =    Send One Call Request  params=${params}
    [Return]  ${api_forecast.json()}[daily]


