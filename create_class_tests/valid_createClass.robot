*** Settings ***
Documentation     A test suite with a single test for valid class creation.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Class Creation
    Open Browser To Create Class Page
    Input Title    Class A
    Input Description    A class
    Input Difficulty    1
    Input Language    2
    Submit Class
    Result Page Should Be Open
    [Teardown]    Close Browser
