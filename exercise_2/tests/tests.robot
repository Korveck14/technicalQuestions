*** Settings ***
Library   ../lib/HTMLHandler.py

*** Keywords ***
Website Status
    [Arguments]  ${url}  ${exp_urls_working}  ${exp_num_of_rows}
    [Documentation]  Validate that all the urls of a website are working and the number of rows of a table.
    ${urls_working}  Check URLs from Website
    ${num_of_rows}   Get Number of Rows from Website
    Run Keyword and Continue on Failure  Should Be Equal  ${urls_working}  ${exp_urls_working}
    Run Keyword and Continue on Failure  Should Be Equal  ${num_of_rows}   ${exp_num_of_rows}

*** Test Cases ***
Test Website Status
    [Template]  Website Status
    www.facebook.com   ${True}   ${10}
    www.instagram.com  ${True}   ${20}
    www.wikipedia.com  ${False}  ${999}
    www.youtube.com    ${True}   ${20}

# The expected from the test cases are invented for this exercise
