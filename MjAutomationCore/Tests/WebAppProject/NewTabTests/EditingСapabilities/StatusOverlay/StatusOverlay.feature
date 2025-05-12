@retry(2)
Feature: StatusOverlay
Check functionality of the Status Overlay

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '36' via the side tool bar

@MindManager @EditingCapabilities @StatusOverlays @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2354] @Upd_Qase
Scenario: Check_that_Status_Overlay_Location_can_be_changed
	When User left click on the Overlay panel
	Then 'settings' dropdown menu is displayed to User
	When User clicks button with 'top-right' name in 'settings' menu
	Then Overlay panel is located by approximate '1377' X axis and approximate '102' Y axis
	When User left click on the Overlay panel
	Then 'settings' dropdown menu is displayed to User
	When User clicks button with 'bottom-left' name in 'settings' menu
	Then Overlay panel is located by approximate '13' X axis and approximate '649' Y axis
	When User left click on the Overlay panel
	Then 'settings' dropdown menu is displayed to User
	When User clicks button with 'bottom-right' name in 'settings' menu
	Then Overlay panel is located by approximate '1321' X axis and approximate '646' Y axis
	When User left click on the Overlay panel
	Then 'settings' dropdown menu is displayed to User
	When User clicks button with 'top-left' name in 'settings' menu
	Then Overlay panel is located by approximate '5' X axis and approximate '102' Y axis
	When User left click on the Overlay panel
	Then 'settings' dropdown menu is displayed to User
	When User clicks button with 'hide' name in 'settings' menu
	Then Overlay panel is not displayed

@MindManager @EditingCapabilities @StatusOverlays @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-505] @Upd_Qase
Scenario: Check_that_Status_Overlay_can_be_hidden
	Then Overlay panel is located by approximate '5' X axis and approximate '93' Y axis
	When User left click on the Overlay panel
	Then 'settings' dropdown menu is displayed to User
	When User clicks button with 'hide' name in 'settings' menu
	Then Overlay panel is not displayed