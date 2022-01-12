*** Settings ***
Resource  ../../Tests_Imports.robot


*** Variables ***
${START_LOADER_LOCATOR} =  //div[@class="owm-loader"]
${SEARCH_BLOCK_LOCATOR} =  //div[@class="search-container"]//input[@placeholder="Search city"]
${SEARCH_BUTTON_LOCATOR} =  //button[@type="submit"]
${CITY_IN_SEARCH_DROPDOWN_LOCATOR} =  //ul[@class="search-dropdown-menu"]//span[contains(text(),'${city_name}, ${country}')]
${METRIC_LOCATOR} =  //div[@class="option" and contains(text(),'Metric')]
${IMPERIAL_LOCATOR} =  //div[@class="option" and contains(text(),'Imperial')]
${CURRENT_CITY_TEMP_LOCATOR} =  //div[@class="current-container mobile-padding"]//span[@class="heading"]
${CURRENT_DATETIME_LOCATOR} =  //div[@class="current-container mobile-padding"]//span[@class="orange-text"]
${CURRENT_CITY_LOCATOR} =  //div[@class="current-container mobile-padding"]//h2
${DAY_LIST_ROW_LOCATOR} =  //ul[@class="day-list"]//li
${ALLOW_ALL_COOKIES_LOCATOR} =  //button[@class="stick-footer-panel__link"]
${SUNRISE_TIME_LOCATOR} =  //span[@class="label" and contains(text(), 'Sunrise')]/following-sibling::span[@class="value"]
${SUNSET_TIME_LOCATOR} =  //span[@class="label" and contains(text(), 'Sunset')]/following-sibling::span[@class="value"]
${SELECTED_DAY_IN_OPTIONS_SCROLLER} =  //ul[@class="options-scroller"]/li[@class="active"]
${NEXT_DAY_IN_OPTIONS_SCROLLER} =  //ul[@class="options-scroller"]/li[@class="active"]/following-sibling::li[1]
${PREVIOUS_DAY_IN_OPTIONS_SCROLLER} =  //ul[@class="options-scroller"]/li[@class="active"]/preceding-sibling::li[1]


*** Keywords ***
Navigate To Base URL
    [Documentation]  Navigate to base URL
    Go To    ${BASE_URL}

Type City Name In The Search
    [Documentation]  Enter City Name In The Search Block
    [Arguments]  ${city_name}
    Wait Until Element Is Visible    ${SEARCH_BLOCK_LOCATOR}
    Input Text    ${SEARCH__BLOCK_LOCATOR}    ${city_name}

Get Current City Temperature
    [Documentation]  Get The Temperature Of The City On The Main Page with degrees and units (Format: 6°C)
    Wait Until Element Is Visible    ${CURRENT_CITY_TEMP_LOCATOR}
    ${current_city_temperature} =  Get Text    ${CURRENT_CITY_TEMP_LOCATOR}
    [Return]  ${current_city_temperature}

Get Current City Name
    [Documentation]  Get The Name Of The City On The Main Page (Format: Manchester, GB)
    Wait Until Element Is Visible    ${CURRENT_CITY_LOCATOR}
    ${current_city_name} =  Get Text    ${CURRENT_CITY_LOCATOR}
    [Return]  ${current_city_name}

Get Current DateTime
    [Documentation]  Get Current Datetime On The Main Page (Format: Dec 16, 04:54am)
    Wait Until Element Is Visible    ${CURRENT_DATETIME_LOCATOR}
    ${current_datetime} =  Get Text    ${CURRENT_DATETIME_LOCATOR}
    [Return]  ${current_datetime}

Get Web Elements List Of 8 Days Forecast
    [Documentation]  Get list of all rows web elements in 8-day forecast
    Wait Until Element Is Visible  ${DAY_LIST_ROW_LOCATOR}  timeout=10 seconds
    @{web_elements_list} =  Get WebElements  ${DAY_LIST_ROW_LOCATOR}
    [Return]  @{web_elements_list}

Get Selected Date From Day Detailed View In 8-day Forecast
    [Documentation]  Get Date From Day Detailed View In 8-day Forecast
    Wait Until Element Is Visible    ${SELECTED_DAY_IN_OPTIONS_SCROLLER}
    ${selected_date} =  Get Text    ${SELECTED_DAY_IN_OPTIONS_SCROLLER}
    [Return]  ${selected_date}

Get Sunrise Time
    [Documentation]  Get Sunrise Time From Day Detailed View In 8-day Forecast
    Wait Until Element Is Visible    ${SUNRISE_TIME_LOCATOR}
    ${sunrise_time} =  Get Text    ${SUNRISE_TIME_LOCATOR}
    [Return]  ${sunrise_time}

Get Sunset Time
    [Documentation]  Get Sunset Time From Day Detailed View In 8-day Forecast
    Wait Until Element Is Visible    ${SUNSET_TIME_LOCATOR}
    ${sunset_time} =  Get Text    ${SUNSET_TIME_LOCATOR}
    [Return]  ${sunset_time}

Accept Cookies
    [Documentation]  Click "Allow All" button on Cookies Alert
    Wait Until Element Is Visible    ${ALLOW_ALL_COOKIES_LOCATOR}
    Click Element    ${ALLOW_ALL_COOKIES_LOCATOR}

Click On City Name In Search Dropdown
    [Documentation]  Click On City Name In Search Dropdown That Contains City Name And Country Given In Arguments
    [Arguments]  ${city_name}
    ...          ${country}
    Wait Until Element Is Visible    ${CITY_IN_SEARCH_DROPDOWN_LOCATOR}
    Click Element    ${CITY_IN_SEARCH_DROPDOWN_LOCATOR}

Click Search
    [Documentation]  Click On the Search Button In The Search Block
    Wait Until Element Is Visible    ${SEARCH_BUTTON_LOCATOR}
    Click Element    ${SEARCH_BUTTON_LOCATOR}

Click Imperial
    [Documentation]  Click On Imerial Option On Home Page
    Wait Until Element Is Visible    ${IMPERIAL_LOCATOR}
    Click Element    ${IMPERIAL_LOCATOR}

Click On The Next Day In Options Scroller
    [Documentation]  Click On The Next Day In Options Scroller. One Of The Days Should Be Clicked already.
    Wait Until Element Is Visible    ${NEXT_DAY_IN_OPTIONS_SCROLLER}
    Click Element    ${NEXT_DAY_IN_OPTIONS_SCROLLER}

Click On The Previous Day In Options Scroller
    [Documentation]  Click On The Previous Day In Options Scroller. One Of The Days Should Be Clicked already.
    Wait Until Element Is Visible    ${PREVIOUS_DAY_IN_OPTIONS_SCROLLER}
    Click Element    ${PREVIOUS_DAY_IN_OPTIONS_SCROLLER}

Open Detailed Weather For Current Date
    [Documentation]  Click On The First Row In 8-day Forecast Table
    Wait Until Element Is Visible  ${DAY_LIST_ROW_LOCATOR}  timeout=10 seconds
    ${day_element} =  Get WebElement  ${DAY_LIST_ROW_LOCATOR}
    Click Element    ${day_element}



