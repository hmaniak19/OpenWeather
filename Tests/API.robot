*** Settings ***
Resource  ../Tests_Imports.robot

Library    Collections

*** Variables ***
${CITY_NAME} =  Belmopan
${CITY_ID} =  3582672
${BELMOPAN_LON} =  -88.7667
${BELMOPAN_LAT} =  17.25
${BELMOPAN_COORD} =  {'lon': -88.7667, 'lat': 17.25}


*** Test Cases ***
Get Weather Of the City Belmopan By City Name And Check Its Coordinates
    ${weather}  ${coord} =  Get Weather Of The City By Name  city=${CITY_NAME}
    Verify Received Coords Equal To Expected  received_coord=${coord}  expected_coord=${BELMOPAN_COORD}

Get Weather Of the City Belmopan By Its Coordinates And Check Its Name
    ${weather}  ${city} =  Get Weather Of The City By Coord  lon=${BELMOPAN_LON}  lat=${BELMOPAN_LAT}
    Verify Received City Name Equal To Expected  received_name=${city}  expected_name=${CITY_NAME}

Get Weather Of the City Belmopan By ID And Check Its Name
    ${weather}  ${city} =  Get Weather Of The City By ID  id=${CITY_ID}
    Verify Received City Name Equal To Expected  received_name=${city}  expected_name=${CITY_NAME}

