*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      http://${SERVER}/Form.html
${COMPLETE URL}      http://${SERVER}/Complete.html
${CHROME_PATH}    C:/Users/fernk/ChromeForTesting/chrome-win64/chrome.exe
${CHROMEDRIVER}    C:/Users/fernk/ChromeForTesting/chromedriver-win64/chromedriver.exe  
${FROM URL}     http://${SERVER}/Form.html
${FIRST NAME}    Somsong
${LAST NAME}    Sandee
${DESTINATION}    Europe
${CONTACT PERSON}    Sodsai Sandee
${RELATIONSHIP}    MOTHER
${EMAIL}    somsong@kkumail.com
${PHONE}     081-111-1234

*** Keywords ***
Open Browser To Form Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${options.binary_location}    Set Variable    ${CHROME_PATH}
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r'${CHROMEDRIVER}')    sys, selenium.webdriver.chrome.service
    Create WebDriver    Chrome    options=${options}    service=${service}
    Go To    ${FROM URL}
    Maximize Browser Window
    Form Page Should Be Open

Open Browser To Complete Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${options.binary_location}    Set Variable    ${CHROME_PATH}
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r'${CHROMEDRIVER}')    sys, selenium.webdriver.chrome.service
    Create WebDriver    Chrome    options=${options}    service=${service}
    Go To    ${${COMPLETE URL} }
    Maximize Browser Window
    Complete Page Should Be Open

Form Page Should Be Open
    Title Should Be    Customer Inquiry

Complete Page Should Be Open
    Title Should Be    Completed

Input Firstname
    [Arguments]    ${FIRST NAME}
    Input Text    firstname    ${FIRST NAME}

Input Lastname
    [Arguments]    ${LAST NAME}
    Input Text    lastname    ${LAST NAME}

Input destination
    [Arguments]    ${DESTINATION}
    input Text    destination     ${DESTINATION}

Input contactperson
    [Arguments]    ${CONTACT PERSON}
    Input Text    contactperson    ${CONTACT PERSON}

Input relationship
    [Arguments]    ${RELATIONSHAIP}
    INput Text    relationship    ${RELATIONSHAIP}

Input email
    [Arguments]    ${EMAIL}
    Input Text    email    ${EMAIL}

Input phone
    [Arguments]    ${PHONE}
    Input Text    phone    ${PHONE}

Submit Credentials
    Click Button    submitButton

Text Should be Our agent will contact you shortly
    Element Text Should Be    xpath=//h1    Our agent will contact you shortly.
Text Should be Thank you for your patient.
    Element Text Should Be    xpath=//h2    Thank you for your patient.