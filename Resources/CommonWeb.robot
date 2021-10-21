*** Settings ***
Library  SeleniumLibrary
Resource  ../Tests_Imports.robot


*** Variables ***


*** Keywords ***
Begin Web Test
    Open Browser  about:blank   ${BROWSER}
    DesktopShared.Navigate To  ${START_URL}
    TopNav.Verify Logo Loaded

End Web Test
    close all browsers