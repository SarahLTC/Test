*** Settings ***
Documentation     A test suite containing tests related to invalid class creation.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Create Class Page
Suite Teardown    Close Browser
Test Setup        Go To Create Class Page
Test Template     Create Class With Empty Fields Should Fail
Resource          resource.robot

*** Test Cases ***                                            TITLE
Empty Title                                                   ${EMPTY}          ${VALID DESCRIPTION}    ${VALID DIFFICULTY}    ${VALID LANGUAGE}
Empty Description                                             ${VALID TITLE}    ${EMPTY}                ${VALID DIFFICULTY}    ${VALID LANGUAGE}
Empty Difficulty                                              ${VALID TITLE}    ${VALID DESCRIPTION}    ${INVALID INDEX}       ${VALID LANGUAGE}
Empty Language                                                ${VALID TITLE}    ${VALID DESCRIPTION}    ${VALID DIFFICULTY}    ${INVALID INDEX}
Empty Title And Description                                   ${EMPTY}          ${EMPTY}                ${VALID DIFFICULTY}    ${VALID LANGUAGE}
Empty Title And Difficulty                                    ${EMPTY}          ${VALID DESCRIPTION}    ${INVALID INDEX}       ${VALID LANGUAGE}
Empty Title And Language                                      ${EMPTY}          ${VALID DESCRIPTION}    ${VALID DIFFICULTY}    ${INVALID INDEX}
Empty Description And Difficulty                              ${VALID TITLE}    ${EMPTY}                ${INVALID INDEX}       ${VALID LANGUAGE}
Empty Description And Language                                ${VALID TITLE}    ${EMPTY}                ${VALID DIFFICULTY}    ${INVALID INDEX}
Empty Difficulty And Language                                 ${VALID TITLE}    ${VALID DESCRIPTION}    ${INVALID INDEX}       ${INVALID INDEX}
Empty Title And Description And Difficulty                    ${EMPTY}          ${EMPTY}                ${INVALID INDEX}       ${VALID LANGUAGE}
Empty Title And Description And Language                      ${EMPTY}          ${EMPTY}                ${VALID DIFFICULTY}    ${INVALID INDEX}
Empty Title And Difficulty And Language                       ${EMPTY}          ${VALID DESCRIPTION}    ${INVALID INDEX}       ${INVALID INDEX}
Empty Description And Difficulty And Language                 ${VALID TITLE}    ${EMPTY}                ${INVALID INDEX}       ${INVALID INDEX}
Empty Title And Description And Difficulty And Language       ${EMPTY}          ${EMPTY}                ${INVALID INDEX}       ${INVALID INDEX}

*** Keywords ***
Create Class With Empty Fields Should Fail
    [Arguments]    ${title}    ${description}    ${difficulty}    ${language}
    Input Title    ${title}
    Input Description    ${description}
    Input Difficulty    ${difficulty}
    Input Language    ${language}
    Submit Class
    Create Class Should Have Failed

Create Class Should Have Failed
    Location Should Be    ${ERROR URL}
    Title Should Be    Error Page
