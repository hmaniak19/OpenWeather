*** Settings ***
Resource  ../Tests_Imports.robot


*** Keywords ***
Search For The City
    [Documentation]  Search For The City And Click Search Button
    [Arguments]  ${city_name}
    ...          ${country}
    ...          ${city_id}
    MainPage.Type City Name In The Search    city_name=${city_name}
    MainPage.Click Search
    MainPage.Click On City Name In Search Dropdown  city_name=${city_name}
    ...                                             country=${country}
    Wait Until Location Is  ${BASE_URL}city/${city_id}

Get Current City Temperature
    [Documentation]  Get The Temperature (only Number) Of The City On The Main Page (remove units)
    ${current_city_temperature} =  MainPage.Get Current City Temperature
    ${city_temp_splitted_list} =  Split String  ${current_city_temperature}  °
    ${current_city_temp_by_web} =  Get From List  ${city_temp_splitted_list}  0
    [Return]  ${current_city_temp_by_web}

Change Units To Imperial
    [Documentation]  Click on Imperial and check that loader disappears
    MainPage.Click Imperial
    Check Loader Disappears

Verify Main Page Loaded
    [Documentation]  Verify that url is correct and loader disappears
    Wait Until Location Is  ${BASE_URL}
    Check Loader Disappears

Check Loader Disappears
    [Documentation]  Check that loader appears and disappears when all info is loaded on the page
    Wait Until Page Contains Element    ${START_LOADER_LOCATOR}
    Wait Until Page Does Not Contain Element    ${START_LOADER_LOCATOR}



