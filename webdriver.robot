*** Settings ***
Library           SeleniumLibrary

*** Variables ***  
${CHROME_BROWSER_PATH}    C:/Users/fernk/ChromeForTesting/chrome-win64/chrome.exe
${CHROME_DRIVER_PATH}    C:/Users/fernk/ChromeForTesting/chromedriver-win64/chromedriver.exe   
${URL}                    https://computing.kku.ac.th/index
*** Test Cases ***
TC_001: Start Chrome For Testing

    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    # [selenium >= 4.10] `chrome_options` change to `options`
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${URL}
