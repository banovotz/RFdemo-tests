*** Settings ***
Library     Selenium2Library
Library     PageObjectLibrary
Library     ./pageobjects/LoginPage/LoginPage.py
Library     ./pageobjects/DashboardPage/DashboardPage.py

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

