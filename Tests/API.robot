*** Settings ***
Resource  ../Resources/Tests_Imports.robot
Library    Collections

*** Variables ***
${CITY_NAME} =  Belmopan
${CITY_ID} =  3582672
${CITY_LON} =  -88.7667
${CITY_LAT} =  17.25
${STANDART_UNITS} =  standard
${METRIC_UNITS} =  metric
${IMPERIAL_UNITS} =  imperial


*** Test Cases ***
Get Weather Of the City By Name, Coordinates, ID
    BuiltIn.Log  Step 1: I get the weather of the city by name and check that received coordinates are equal to the given ones
    ${lon_by_api}  ${lat_by_api} =  ApiSteps.Get Longitude And Latitude From Get Weather Request With Name Param   city=${CITY_NAME}
    ApiSteps.Check Received Longitude And Latitude Equal To Expected  received_lon=${lon_by_api}
    ...                                                               received_lat=${lat_by_api}
    ...                                                               expected_lon=${CITY_LON}
    ...                                                               expected_lat=${CITY_LAT}
    BuiltIn.Log  Step 2: I get the weather of the city by coordinates and check that received name is equal to the given one
    ${city_by_api} =  ApiSteps.Get City Name From Get Weather Request With Coord Param  lon=${CITY_LON}
    ...                                                                                 lat=${CITY_LAT}
    ApiSteps.Check Received City Name Equal To Expected  received_name=${city_by_api}
    ...                                                  expected_name=${CITY_NAME}
    BuiltIn.Log  Step 3: I get the weather of the city by ID and check that received name is equal to the given one
    ${city_by_api} =  ApiSteps.Get City Name From Get Weather Request With ID Param  id=${CITY_ID}
    ApiSteps.Check Received City Name Equal To Expected  received_name=${city_by_api}
    ...                                         expected_name=${CITY_NAME}

Get Temperature Of The City In Defferent Units And Check The Units
    [Template]  Get Temperature Of The City In Different Units And Check The Units
    case=Case 1: pass standard units and check that received temperature is in standard units  city_name=${CITY_NAME}  units=standard
    case=Case 2: pass metric units and check that received temperature is in metric units  city_name=${CITY_NAME}  units=metric
    case=Case 3: pass imperial units and check that received temperature is in imperial units  city_name=${CITY_NAME}  units=imperial
    case=Case 4: pass invalid units and check that received temperature is in standard units  city_name=${CITY_NAME}  units=invalid
    case=Case 5: don't pass units and check that received temperature is in standard units  city_name=${CITY_NAME}


*** Keywords ***
Get Temperature Of The City In Different Units And Check The Units
    [Arguments]  ${case}
    ...          ${city_name}
    ...          ${units}=${EMPTY}
    BuiltIn.Log  Step 1: I Get temperature by city name and check the units are in the correct range
    ${city_temp_by_api} =  ApiSteps.Get Temperature Of The City By Name  city=${city_name}
    ...                                                                  units=${units}
    Log  ${city_temp_by_api}
    ApiSteps.Check Units Are In Correct Range  temp=${city_temp_by_api}
    ...                                        units=${units}


