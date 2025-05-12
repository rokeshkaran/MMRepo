@retry(2)
Feature: FileStates
	Check File State in the Status Overlay

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User

@MindManager @EditingCapabilities @StatusOverlays @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-507] @Upd_Qase
Scenario: Check_that_Status_Overlay_when_co_editing_is_available_on_the_map
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then menu button with 'coedit' name is displayed in 'co-editing' state on Overlay panel

@MindManager @EditingCapabilities @StatusOverlays @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-508] @Upd_Qase
Scenario: Verify_that_the_correct_overlay_is_displayed_to_user_with_view_permission
	When User shares 'auto_test_SRND.mmap' MindManager cloud file with 'r' permission to '1' user email via API
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel
	When User clicks on 'file' button on the Overlay panel
	Then button with 'read-only' name is displayed in 'file' menu
	When User clicks on 'file' button on the Overlay panel
	Then 'file' Menu is not displayed to User