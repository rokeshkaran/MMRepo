@retry(2)
Feature: MissingInfoStates
Check that correct overlay is displayed for missing information

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @StatusOverlays @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-514] @Upd_Qase
Scenario: Verify_that_Missing_Information_overlay_is_displayed_when_filter_is_applied
	Then menu button with 'filter' name is not displayed on 'OverlayPanelPageElement' container
	When User clicks 'Filter' button of side Toolbox
	When User checks 'Priority 2' checkbox to 'Priority' group in 'General' section on Filter panel
	Then text 'Map information hidden byFilters' is displayed in toast notification on Overlay panel
	Then menu button with 'filter' name is displayed in 'status-missing-info' state on Overlay panel
	When User clicks menu button with 'filter' name in 'OverlayPanelPageElement' container
	Then 'filter' Menu is displayed to User
	When User clicks button with 'remove-filter' name in 'filter' menu
	Then 'Priority 2' checkbox is unchecked to 'Priority' group in 'General' section on Filter panel
	Then menu button with 'filter' name is not displayed on 'OverlayPanelPageElement' container

@MindManager @EditingCapabilities @StatusOverlays @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-517] @Upd_Qase
Scenario: Verify_that_Missing_Information_overlay_is_displayed_if_map_has_hidden_info
	Then menu button with 'filter' name is not displayed on 'OverlayPanelPageElement' container
	When User clicks 'Filter' button of side Toolbox
	When User checks 'Priority 2' checkbox to 'Priority' group in 'General' section on Filter panel
	Then text 'Map information hidden byFilters' is displayed in toast notification on Overlay panel
	Then menu button with 'filter' name is displayed in 'status-missing-info' state on Overlay panel
	When User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	When User clicks menu button with 'filter' name in 'OverlayPanelPageElement' container
	Then 'filter' Menu is displayed to User
	When User clicks button with 'show-settings' name in 'filter' menu
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	Then 'Priority 2' checkbox is checked to 'Priority' group in 'General' section on Filter panel
	When User clicks menu button with 'filter' name in 'OverlayPanelPageElement' container
	Then 'filter' Menu is displayed to User
	When User clicks button with 'remove-filter' name in 'filter' menu
	Then 'Priority 2' checkbox is unchecked to 'Priority' group in 'General' section on Filter panel
	Then menu button with 'filter' name is not displayed on 'OverlayPanelPageElement' container