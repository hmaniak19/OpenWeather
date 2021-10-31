*** Settings ***
Resource  ./PO/LoginPage.robot
Resource  ./PO/TopNav.robot
Resource  ./PO/HomePage.robot
Resource  ./PO/UserSettings.robot
Resource  ./Steps/CommonWeb.robot
Resource  ./Steps/LoginSteps.robot
Resource  ./Steps/UserSettingsSteps.robot
Resource  ./Steps/ApiSteps.robot
Resource  ./Global_Variables.robot
Library  SeleniumLibrary
Library  String
Library  RequestsLibrary
Library  JSONLibrary