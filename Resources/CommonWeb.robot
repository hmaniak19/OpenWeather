*** Settings ***
Library  SeleniumLibrary
Resource  ../Tests_Imports.robot


*** Variables ***


*** Keywords ***
Begin Web Test
    open browser  about:blank   ${BROWSER}
    DesktopShared.Navigate To  ${START_URL}
    TopNav.Verify Logo Loaded

End Web Test
    close all browsers