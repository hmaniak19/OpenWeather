*** Settings ***
Resource  ../Resources/CalculationsApp.robot
Library  DateTime

# robot  -d results tests/calculations.robot


*** Variables ***
${WAITING_TIME_SECS} =  10


*** Test Cases ***
Check the result of calculation
    [Documentation]  We verify sum of two values
    [Template]    The sum of ${First_value} and ${Second_value} should be ${Expected}
    1  1  2
    3  9  12

Check the time differ
    [Documentation]  We get current time, wait for some time and check that new time differs from the first one by waiting time
    ${current_date_time} =  Get Current Date  result_format=%Y-%m-%d %H:%M:%S
    Sleep    ${WAITING_TIME_SECS}
    ${new_date_time} =  Get Current Date  result_format=%Y-%m-%d %H:%M:%S
    Verify that ${current_date_time} differs from ${new_date_time} by ${WAITING_TIME_SECS}

#    FOR TESTING:
#    ${differ} =  Subtract Date From Date  2021-09-30 23:59:59  2021-09-30 23:59:49
#    ${new_differ} =  Evaluate  int(abs(${differ}))
#    Log    ${new_differ}


*** Keywords ***
The sum of ${First_value} and ${Second_value} should be ${Expected}
    ${Result} =    Evaluate    ${First_value} + ${Second_value}
    Should Be Equal As Numbers    ${Result}     ${Expected}

Verify that ${Future_date} differs from ${Current_date} by ${Waiting_time}
    ${Differ} =  Subtract Date From Date   ${Future_date}  ${Current_date}
    ${Int_differ} =  Evaluate  int(abs(${Differ}))
    Should Be Equal As Integers    ${Int_differ}  ${Waiting_time}









