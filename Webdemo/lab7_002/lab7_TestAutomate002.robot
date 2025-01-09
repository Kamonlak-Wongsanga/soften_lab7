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
    
    Input contactperson    ${CONTACT PERSON}
    Input relationship    ${RELATIONSHIP}
    Input email    ${EMAIL}
    Input phone    ${PHONE}
    Submit Credentials
    Complete Page Should Be Open
    Text Should be Our agent will contact you shortly
    Text Should be Thank you for your patient.
    Sleep    2s 
    [Teardown]    Close Browser
    