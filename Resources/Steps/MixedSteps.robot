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

Check Sunrise And Sunset In WEB Equal To API
    [Documentation]  Check That Date, Sunrise And Sunset Of A Day From Web Are Equal Date From API
    [Arguments]  ${WEB_day_forecast_dict}
    ...          ${API_day_forecast_dict}
    Should Be Equal    ${WEB_day_forecast_dict.date}    ${API_day_forecast_dict.date}
    Should Be Equal    ${WEB_day_forecast_dict.sunrise}    ${API_day_forecast_dict.sunrise}
    Should Be Equal    ${WEB_day_forecast_dict.sunset}    ${API_day_forecast_dict.sunset}

Check Sunrise And Sunset Time For Today
    [Documentation]  Click on the first row in 8-day Forecast Table, get its sunrise and sunset and compare with API
    [Arguments]  ${API_Forecast}
    MainPage.Open Detailed Weather For Current Date
    ${today_forecast} =  MainPageSteps.Get Sunrise And Sunset For Selected Day
    MixedSteps.Check Sunrise And Sunset In WEB Equal To API  WEB_day_forecast_dict=${today_forecast}
    ...                                                      API_day_forecast_dict=${API_forecast[0]}

Check Sunrise And Sunset Time For Future Days Range
    [Documentation]  Click on the Next Day in 8-day Forecast Table, get its sunrise and sunset and compare with API
    [Arguments]  ${days_range}
    ...          ${API_Forecast}
    FOR  ${index}  IN RANGE  ${days_range}
        MainPage.Click On The Next Day In Options Scroller
        ${daily_forecast} =  MainPageSteps.Get Sunrise And Sunset For Selected Day
        Check Sunrise And Sunset In WEB Equal To API  WEB_day_forecast_dict=${daily_forecast}
        ...                                           API_day_forecast_dict=${API_Forecast[${index+1}]}
    END

Check Sunrise And Sunset Time For Previous Days Range
    [Documentation]  Click on the Previous Day in 8-day Forecast Table, get its sunrise and sunset and compare with API
    [Arguments]  ${days_range}
    ...          ${API_Forecast}
    FOR  ${index}  IN RANGE  -2  -2-${days_range}  -1
        MainPage.Click On The Previous Day In Options Scroller
        ${daily_forecast} =  MainPageSteps.Get Sunrise And Sunset For Selected Day
        Check Sunrise And Sunset In WEB Equal To API  WEB_day_forecast_dict=${daily_forecast}
        ...                                           API_day_forecast_dict=${API_Forecast[${index}]}
    END