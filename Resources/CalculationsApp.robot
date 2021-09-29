*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Keywords ***
Count sum of two values
    ${Sum} =  Evaluate  ${FIRST_VALUE} + ${SECOND_VALUE}
    Should Be Equal As Numbers  ${Sum}  ${RESULT}


