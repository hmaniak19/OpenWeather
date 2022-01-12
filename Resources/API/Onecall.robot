Resource  ../Tests_Imports.robot

*** Keywords ***
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