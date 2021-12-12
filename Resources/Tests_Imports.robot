*** Settings ***
Resource  ./API/Endpoints.robot
Resource  ./WEB/PO/LoginPage.robot
Resource  ./WEB/PO/TopNav.robot
Resource  ./WEB/PO/HomePage.robot
Resource  ./WEB/PO/MainPage.robot
Resource  ./WEB/PO/UserSettings.robot
Resource  ./Steps/ApiSteps.robot
Resource  ./Steps/CommonWebSteps.robot
Resource  ./Steps/LoginSteps.robot
Resource  ./Steps/MainPageSteps.robot
Resource  ./Steps/MixedSteps.robot
Resource  ./Steps/UserSettingsSteps.robot
Resource  ./Global_Variables.robot
Library  SeleniumLibrary
Library  String
Library  RequestsLibrary
Library  JSONLibrary