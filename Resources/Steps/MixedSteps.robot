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