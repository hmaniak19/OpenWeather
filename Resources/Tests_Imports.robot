*** Settings ***
Resource  ./API/Endpoints.robot
Resource  ./WEB/PO/LoginPage.robot
Resource  ./WEB/PO/TopNav.robot
Resource  ./WEB/PO/HomePage.robot
Resource  ./WEB/PO/MainPage.robot
Resource  ./WEB/PO/UserSettings.robot
Resource  ./Steps/CommonWebSteps.robot
Resource  ./Steps/MainPageSteps.robot
Resource  ./Steps/LoginSteps.robot
Resource  ./Steps/UserSettingsSteps.robot
Resource  ./Steps/ApiSteps.robot
Resource  ./Global_Variables.robot
Library  SeleniumLibrary
Library  String
Library  RequestsLibrary
Library  JSONLibrary