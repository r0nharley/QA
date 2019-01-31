*** Settings ***
Documentation  Paylocity QA Challenge

Resource   ${EXECDIR}/Central/Common.robot
Resource   ${EXECDIR}/Central/DashboardWorkflow.robot
Resource   ${EXECDIR}/Central/Variables.robot


Test Setup  Begin Web Test
Test Teardown  End Web Test


*** Variables ***

${BROWSER}   chrome



*** Test Cases ***

Navigate to Page
    Log To Console  Navigating to QA Challenge
    DashboardWorkflow.Navigate to Login Page

Enter Invalid Credentials
    Log to Console  Enter Invalid Credentials
    DashboardWorkflow.Navigate to Login Page
    DashboardWorkflow.Enter Invaild Credentials

Enter Valid Credentials
    Log to Console  Enter Valid Credentials
    DashboardWorkflow.Navigate to Login Page
    DashboardWorkflow.Enter Valid Credentials

Edit An Employee
    Log to Console  Edit An Employee
    DashboardWorkflow.Navigate to Login Page
    DashboardWorkflow.Enter Valid Credentials
    DashboardWorkflow.Edit An Employee

Delete An Employee
    Log to Console  Delete An Employee
    DashboardWorkflow.Navigate to Login Page
    DashboardWorkflow.Enter Valid Credentials
    DashboardWorkflow.Delete An Employee

Add An Employee
    Log to Console  Add An Employee
    DashboardWorkflow.Navigate to Login Page
    DashboardWorkflow.Enter Valid Credentials
    DashboardWorkflow.Add An Employee

Edit An Employee w/ Dependants
    Log to Console  Edit An Employee w/ Dependants
    DashboardWorkflow.Navigate to Login Page
    DashboardWorkflow.Enter Valid Credentials
    DashboardWorkflow.Edit An Employee w/ Dependants

Add An Employee w/ Dependants
    Log to Console  Add An Employee w/ Dependants
    DashboardWorkflow.Navigate to Login Page
    DashboardWorkflow.Enter Valid Credentials
    DashboardWorkflow.Add An Employee w/ Dependants  4