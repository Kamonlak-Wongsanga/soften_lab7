*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Open Form
    Open Browser To Form Page
    
Record Success
    Input Firstname    ${FIRST NAME} 
    Input Lastname    ${LAST NAME}
    Input destination    ${DESTINATION}
    Input contactperson    ${CONTACT PERSON}
    Input relationship    ${RELATIONSHIP}
    Input phone    ${PHONE}
    Submit Credentials
    Form Page Should Be Open
    text should be Please enter a valid email address
    Sleep    2s 
    [Teardown]    Close Browser
    