*** Settings ***
Resource  ../Resources/CalculationsApp.robot


*** Variables ***
${FIRST_VALUE} =  3
${SECOND_VALUE} =  9
${RESULT} =  12
${TIME} =  10


*** Test Cases ***
#Check sum of two numbers
#    CalculationsApp.Count sum of two values

Check time
    ${Sec1} =  Get Time  sec
    Sleep    ${TIME} seconds
    ${Sec2} =  Get Time  sec
    ${Differ} =  Evaluate  ${Sec2} - ${Sec1}
    Should Be Equal As Numbers  ${Differ}  ${TIME}









