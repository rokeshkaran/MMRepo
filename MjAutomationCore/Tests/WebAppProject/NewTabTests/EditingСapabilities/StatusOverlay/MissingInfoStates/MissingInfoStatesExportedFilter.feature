@retry(2)
Feature: MissingInfoStatesExportedFilter
Check that correct overlay is displayed for missing information for exported filter

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath            |
		| auto_test_SRND.mmap | ExportedFilter.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @StatusOverlays @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-516] @Upd_Qase
Scenario: Verify_that_Missing_Information_overlay_is_displayed_when_Exported_filter_is_applied
	Then menu button with 'filter' name is displayed in 'status-missing-info' state on Overlay panel
	When User clicks menu button with 'filter' name in 'OverlayPanelPageElement' container
	Then 'filter' Menu is displayed to User
	When User clicks button with 'remove-filter' name in 'filter' menu
	Then menu button with 'filter' name is not displayed on 'OverlayPanelPageElement' container