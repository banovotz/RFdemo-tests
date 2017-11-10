*** Settings ***
Library     Selenium2Library
Library     PageObjectLibrary
Library     ./pageobjects/LoginPage/LoginPage.py
Library     ./pageobjects/DashboardPage/DashboardPage.py
Library     ./pageobjects/ErrorPage/ErrorPage.py

Variables    ./config/config.py


*** Keywords ***

Each Test Teardown
    Capture Page Screenshot
    Close Browser

the user is on the login page
    go to page  LoginPage

the user provides correct credentials
    enter username  ${USERNAME}
    enter password  ${PASSWORD}
    click login button

the user should be redirected to his dashboard
    The current page should be  DashboardPage

the logged in user is on his dashboard
    enter username  ${USERNAME}
    enter password  ${PASSWORD}
    click login button
    go to  ${DASHBOARD_URL}

the user visits the login page
    go to   ${ROOT_WEB_DIR}

the user should stay on his dashboard
    The current page should be  DashboardPage

the user provides incorrect credentials
    enter username  "Pero"
    enter password  "12345"
    click login button

the user should be redirected to error page
    The current page should be  ErrorPage

the user is not logged in
    Go to page  LoginPage

the user visits his dashboard
    go to page   DashboardPage

the user should see the error
    The current page should be  ErrorPage





