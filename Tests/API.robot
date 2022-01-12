*** Settings ***
Resource  ../Resources/Tests_Imports.robot


*** Variables ***
${CITY_NAME} =  Belmopan
${CITY_ID} =  3582672
${CITY_LON} =  -88.7667
${CITY_LAT} =  17.25
${STANDART_UNITS} =  standard
${METRIC_UNITS} =  metric
${IMPERIAL_UNITS} =  imperial


*** Test Cases ***
Get City Weather By Name, Coordinates, ID
    BuiltIn.Log  Step 1: I get the weather of the city by name and check that received coordinates are equal to the given ones
    ${lon_by_api}  ${lat_by_api} =  ApiSteps.Get City Longitude And Latitude By Name  city=${CITY_NAME}
    ApiSteps.Check Received Longitude And Latitude Equal To Expected  received_lon=${lon_by_api}
    ...                                                               received_lat=${lat_by_api}
    ...                                                               expected_lon=${CITY_LON}
    ...                                                               expected_lat=${CITY_LAT}
    BuiltIn.Log  Step 2: I get the weather of the city by coordinates and check that received name is equal to the given one
    ${city_by_api} =  ApiSteps.Get City Name By Coords  lon=${CITY_LON}
    ...                                                 lat=${CITY_LAT}
    ApiSteps.Check Received City Name Equal To Expected  received_name=${city_by_api}
    ...                                                  expected_name=${CITY_NAME}
    BuiltIn.Log  Step 3: I get the weather of the city by ID and check that received name is equal to the given one
    ${city_by_api} =  ApiSteps.Get City Name By ID  id=${CITY_ID}
    ApiSteps.Check Received City Name Equal To Expected  received_name=${city_by_api}
    ...                                                  expected_name=${CITY_NAME}

Get City Temperature And Check The Units
    [Template]  Get City Temperature In Different Units And Check The Units
    case=Case 1: pass standard units and check that received temperature is in standard units  city_name=${CITY_NAME}  units=standard
    case=Case 2: pass metric units and check that received temperature is in metric units  city_name=${CITY_NAME}  units=metric
    case=Case 3: pass imperial units and check that received temperature is in imperial units  city_name=${CITY_NAME}  units=imperial
    case=Case 4: pass invalid units and check that received temperature is in standard units  city_name=${CITY_NAME}  units=invalid
    case=Case 5: don't pass units and check that received temperature is in standard units  city_name=${CITY_NAME}


*** Keywords ***
Get City Temperature In Different Units And Check The Units
    [Arguments]  ${case}
    ...          ${city_name}
    ...          ${units}=${EMPTY}
    BuiltIn.Log  Step 1: I Get temperature by city name and check the units are in the correct range
    ${city_temp_by_api} =  ApiSteps.Get City Temperature By Name  city=${city_name}
    ...                                                           units=${units}
    ApiSteps.Check Units Are In Correct Range  temp=${city_temp_by_api}
    ...                                        units=${units}


