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
    Input email    ${EMAIL} 
    Input invalid phone    ${INVALID PHONE}  
    Sleep    2s 
    Submit Credentials
    Form Page Should Be Open
    text should be Please enter a valid phone number, e.g., 081-234-5678, 081 2345678, or 081.234.5678)
    [Teardown]    Close Browser
    