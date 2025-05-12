@retry(2)
Feature: PublishStates
Check that correct overlay is displayed when the map has been published

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @StatusOverlays @PublishStates @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-511] @Upd_Qase
Scenario: Verify_that_correct_overlay_is_displayed_when_the_map_has_been_published
	When User clicks menu button with 'share' name in 'ToolbarPageElement' container
	Then 'share' Menu is displayed to User
	When User clicks button with 'publish' name in 'share' menu
	Then header 'Publish Complete!' is displayed on page
	When User clicks 'Done' button
	Then Web Editor page is displayed to the User
	Then menu button with 'publish' name is displayed in 'status-publish-ok' state on Overlay panel
	When User clicks menu button with 'publish' name in 'OverlayPanelPageElement' container
	Then 'publish' Menu is displayed to User
	When User clicks 'CT' topic on Canvas
	When User presses the 'Enter' key on the keyboard
	Then 'Main Topic' topic is displayed on Canvas
	Then menu button with 'publish' name is displayed in 'status-publish-alert' state on Overlay panel
	When User clicks menu button with 'publish' name in 'OverlayPanelPageElement' container
	Then 'publish' Menu is displayed to User
	When User clicks button with 'update' name in 'publish' menu
	Then header 'Update Complete!' is displayed on page
	When User clicks 'Done' button
	Then Web Editor page is displayed to the User
	Then menu button with 'publish' name is displayed in 'status-publish-ok' state on Overlay panel
	When User clicks menu button with 'publish' name in 'OverlayPanelPageElement' container
	Then 'publish' Menu is displayed to User
	When User clicks button with 'unpublish' name in 'publish' menu
	Then header 'Un-publish Complete!' is displayed on page
	When User switches to iframe
	When User waits for data loading
	When User clicks 'Done' button
	When User switches to default content
	Then Web Editor page is displayed to the User
	Then menu button with 'publish' name is not displayed on 'OverlayPanelPageElement' container