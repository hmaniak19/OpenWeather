*** Settings ***
Resource  ../Resources/CalculationsApp.robot
Library  DateTime

# robot  -d results tests/calculations.robot


*** Variables ***
${WAITING_TIME_SECS} =  10


*** Test Cases ***
Check the result of calculation
    [Documentation]  We verify sum of two values
    [Template]    The Sum Of ${First_value} And ${Second_value} Should Be ${Expected}
    1  1  2
    3  9  12

Check the time differ
    [Documentation]  We get current time, wait for some time and check that new time differs from the first one by waiting time
    ${Current_date_time} =  Get Current Date  result_format=%Y-%m-%d %H:%M:%S
    Sleep    ${WAITING_TIME_SECS}
    ${New_date_time} =  Get Current Date  result_format=%Y-%m-%d %H:%M:%S
    Verify That ${Current_date_time} Differs From ${New_date_time} By ${WAITING_TIME_SECS}

#    FOR TESTING:
#    ${differ} =  Subtract Date From Date  2021-09-30 23:59:59  2021-09-30 23:59:49
#    ${new_differ} =  Evaluate  int(abs(${differ}))
#    Log    ${new_differ}


*** Keywords ***
The Sum Of ${First_value} And ${Second_value} Should Be ${Expected}
    ${Result} =    Evaluate    ${First_value} + ${Second_value}
    Should Be Equal As Numbers    ${Result}     ${Expected}

Verify That ${Future_date} Differs From ${Current_date} By ${Waiting_time}
    ${Differ} =  Subtract Date From Date   ${Future_date}  ${Current_date}
    ${Abs_differ} =  Evaluate  abs(${Differ})
    Should Be Equal As Integers    ${Abs_differ}  ${Waiting_time}









