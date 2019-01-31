*** Settings ***
Library  SeleniumLibrary

Resource   ${EXECDIR}/Central/Common.robot
Resource   ${EXECDIR}/Central/Variables.robot

*** Variables ***



*** Keywords ***

BenefitsDashboard
    Navigate to Login Page
    Enter Invaild Credentials
    Enter Valid Credentials
    Edit An Employee
    Add An Employee
    Delete An Employee
    Add An Employee w/ Dependants
    Edit An Employee w/ Dependants


Navigate to Login Page
    [Tags]  Go to Paylocity QA Challenge
    Log To Console  Navigating to the QA Challenge
    go to   ${QAChallenge}
    maximize browser window
    Capture Page Screenshot

Enter Invaild Credentials
    [Tags]  Enter Invalid Credentials
    Log To Console  Submitting an empty form
    Wait Until Element is Visible  ${LoginButton}  5
    Click Button    ${LoginButton}
    Wait Until Element is Visible  ${InvalidAttempt}  5
    Click Element  ${UserNameField}
    Input Text  ${UserNameField}  test
    Click Element   ${PasswordField}
    Input Text  ${PasswordField}  test
    Click Button  ${LoginButton}

Enter Valid Credentials
    [Tags]  Enter Valid Credentials
    Log To Console  Submitting w/ valid credentials
    Click Element  ${UserNameField}
    Input Text  ${UserNameField}  testUser
    Click Element  ${PasswordField}
    Input Text  ${PasswordField}  Test1234
    Click Button  ${LoginButton}


Add An Employee
    [Tags]  Add An Employee
    ${BeneCost1} =    Evaluate    ${EmployeeBeneCost} / ${PayChecks}
    ${NetPay1} =  Evaluate   ${GrossPay} - ${BeneCost1}
    ${NetPay1} =  Convert to number  ${NetPay1}  2
    Log To Console  Add An Employee
    Wait Until Element is Visible  ${BenefitsDashboardHeader}  5
    Click Button  ${AddEmployeeButton}
    Wait Until Element is Visible  ${AddEmployeeHeader}
    Click Element  ${AddFirstName}
    Input Text  ${AddFirstName}      Hello
    Click Element  ${AddLastName}
    Input Text  ${AddLastName}      World
    Click Button  ${SubmitButton}
    Should be equal as numbers   ${NetPay1}   1961.54
    Element should be visible  //td[contains(.,'1961.54')]  5
    Capture Page Screenshot


Edit An Employee
    [Tags]  Edit An Employee
    Log To Console  Edit An Employee
    Click Element  ${EditEmployee}
    Wait Until Element is Visible  ${AddEmployeeHeader}  5
    Click Element  ${AddFirstName}
    Input Text  ${AddFirstName}      Edit First
    Click Element  ${AddLastName}
    Input Text  ${AddLastName}      Edit Last
    Click Button  ${SubmitButton}
    Wait Until Element is Visible  ${FirstNameEdit}  4
    Wait Until Element is Visible  ${LastNameEdit}   4
    Wait Until Element is Visible  ${1DependantBeneCost}  4
    Capture Page Screenshot

Delete An Employee
    [Tags]  Delete An Employee
    Log To Console  Delete An Employee
    Click Element  ${DeleteEmployeeButton}
    Wait Until Element is Not Visible  ${DeleteEmployeeButton}  10
    Capture Page Screenshot


Add An Employee w/ Dependants
    [Tags]  Add An Employee w/ Dependants
    [Arguments]  ${Dependants}
    ${DependantCount}=  Set Variable  ${Dependants}
    ${BeneDepCostPerWeek} =    Evaluate    ${DependantBeneCost} / ${PayChecks}
    ${BeneDepCostPerWeek} =   Convert to number  ${BeneDepCostPerWeek}  2
    ${NumDepCost} =  Evaluate  ${BeneDepCostPerWeek} * ${DependantCount}
    ${NumDepCost} =  Convert to number  ${NumDepCost}  2
    ${NetPayDep} =  Evaluate  ${GrossPay} - ${DailyEmployeeBeneCost} - ${NumDepCost}
    Log To Console  Add An Employee w/ Dependants
    Click Button  ${AddEmployeeButton}
    Wait Until Element is Visible  ${AddEmployeeHeader}
    Click Element  ${AddFirstName}
    Input Text  ${AddFirstName}      Hello
    Click Element  ${AddLastName}
    Input Text  ${AddLastName}      World
    Click Element  ${DependantsField}
    Input Text  ${DependantsField}  ${DependantCount}
    Click Button  ${SubmitButton}
    Wait Until Element is Visible  ${AddDependantVerify}  4
    Should be equal as numbers  ${NetPayDep}  1884.62
    Element should be visible  //td[contains(.,'1884.62')]
    Capture Page Screenshot


Edit An Employee w/ Dependants
    [Tags]  Edit An Employee w/ Dependants
    Log To Console  Edit An Employee w/ Dependants
    Wait Until Element is Visible   ${EditEmployee}  4
    Wait Until Element is Visible  ${1Dependant}  4
    Element Should be Visible  ${1DependantBeneCost}
    Click Element  ${EditEmployee}
    Wait Until Element is Visible  ${AddEmployeeHeader}
    Click Element  ${DependantsField}
    Input Text  ${DependantsField}  3
    Click Button  ${SubmitButton}
    Wait Until Element is Visible  ${3Dependants}  4
    Element Should be Visible  ${3DependantsBeneCost}  4
    Capture Page Screenshot

