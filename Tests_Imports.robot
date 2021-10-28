*** Settings ***
Resource  ./Resources/PO/LoginPage.robot
Resource  ./Resources/PO/TopNav.robot
Resource  ./Resources/PO/HomePage.robot
Resource  ./Resources/PO/UserSettings.robot
Resource  ./Resources/Steps/CommonWeb.robot
Resource  ./Resources/Steps/LoginSteps.robot
Resource  ./Resources/Steps/UserSettingsSteps.robot
Resource  ./Resources/Steps/ApiSteps.robot
Resource  ./Global.robot
Library  SeleniumLibrary
Library  String
Library  RequestsLibrary
Library  JSONLibrary