*** Settings ***
Library      Selenium2Library
Variables    ./config/config.py
Resource     keywords.robot

Test Setup  Open Browser    ${ROOT_WEB_DIR}     ${BROWSER}
Test Teardown   Each Test Teardown

*** Test Cases ***
Valid Login
    Given the user is on the login page
    When the user provides correct credentials
    Then the user should be redirected to his dashboard

Logged in user shouldn't see login form
    Given the logged in user is on his dashboard
    When the user visits the login page
    Then the user should stay on his dashboard

Invalid login
    Given the user is on the login page
    When the user provides incorrect credentials
    Then the user should be redirected to error page

User that is not logged in shouldnt see the dashboard
    Given the user is not logged in
    When the user visits his dashboard
    Then the user should be redirected to error page

