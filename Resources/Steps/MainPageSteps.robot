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
    [Documentation]  Get The Temperature (Number) Of The City On The Main Page
    ${current_city_temperature} =  MainPage.Get Current City Temperature
    ${city_temp_splitted_list} =  Split String  ${current_city_temperature}  °
    ${current_city_temp_by_web} =  Get From List  ${city_temp_splitted_list}  0
    [Return]  ${current_city_temp_by_web}



