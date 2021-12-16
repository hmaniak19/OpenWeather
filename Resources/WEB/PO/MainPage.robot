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



