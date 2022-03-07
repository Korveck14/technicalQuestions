*** Settings ***
Library   ../lib/HTMLHandler.py

*** Keywords ***
Website Status
    [Arguments]  ${url}  ${exp_urls_working}  ${exp_num_of_rows}
    [Documentation]  Validate that all the urls of a website are working and the number of rows of its table.
    ${urls_working}  Check URLs from Website          ${url}
    ${num_of_rows}   Get Number of Rows from Website  ${url}
    Run Keyword and Continue on Failure  Should Be Equal  ${urls_working}  ${exp_urls_working}
    Run Keyword and Continue on Failure  Should Be Equal  ${num_of_rows}   ${exp_num_of_rows}

*** Test Cases ***
Test Website Status
    [Template]  Website Status
    www.novafori.com/our-platform  ${True}   ${10}
    www.novafori.com/data-science  ${True}   ${20}
    www.novafori.com/case-studies  ${False}  ${999}
    www.novafori.com/contact-us    ${True}   ${20}

# The expected from the test cases are fictional
