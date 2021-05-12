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
${VALID TITLE}     Class A
${VALID DESCRIPTION}    A class
${VALID DIFFICULTY}    1
${VALID LANGUAGE}    2
${INVALID INDEX}    0
${CREATE CLASS URL}      http://${SERVER}/createClass.html
${RESULT URL}    http://${SERVER}/classCreated.html
${ERROR URL}      http://${SERVER}/classCreationError.html

*** Keywords ***
Open Browser To Create Class Page
    Open Browser    ${CREATE CLASS URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Create Class Page Should Be Open

Create Class Page Should Be Open
    Title Should Be    Create class

Go To Create Class Page
    Go To    ${CREATE CLASS URL}
    Create Class Page Should Be Open

Input Title
    [Arguments]    ${title}
    Input Text    title_field    ${title}

Input Description
    [Arguments]    ${description}
    Input Text    description_field    ${description}

Input Difficulty
    [Arguments]    ${difficulty}
    Select From List By Index    difficulty_field    ${difficulty}

Input Language
    [Arguments]    ${language}
    Select From List By Index    language_field    ${language}

Submit Class
    Click Button    submit_button

Result Page Should Be Open
    Location Should Be    ${RESULT URL}
    Title Should Be    Result Page
