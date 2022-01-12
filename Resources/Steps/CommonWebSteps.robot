*** Settings ***
Resource  ../Tests_Imports.robot


*** Keywords ***
Begin Web Test
    [Documentation]  Open browser, navigate to Base URL
    Open Browser  about:blank   ${BROWSER}
    MainPage.Navigate To Base URL
    MainPageSteps.Verify Main Page Loaded
    TopNav.Verify Logo Loaded

End Web Test
    [Documentation]  Closes all browsers
    close all browsers