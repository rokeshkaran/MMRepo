@retry(2)
Feature: BackgroundMenu
Check functionality background menu

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar

@MindManager @Side_Toolbox @Background @BackgroundMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-849] @Upd_Qase
Scenario: Verify_that_backgroundMenu_can_be_opened_from_top_panel
	When User clicks menu button with 'design' name in 'ToolbarPageElement' container
	Then 'design' Menu is displayed to User
	When User clicks button with 'background' name in 'design' menu
	Then 'Background' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Color:' subsection is displayed in the 'Background' section with 'Design' header
	Then 'Image:' subsection is displayed in the 'Background' section with 'Design' header

@MindManager @Side_Toolbox @background @BackgroundMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-850] @Upd_Qase
Scenario: Verify_that_backgroundMenu_can_be_opened_by_right_click_on_map_area
	When User right-click on Canvas
	When User clicks button with 'background' name in 'blank-contextmenu' menu
	Then 'Background' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Color:' subsection is displayed in the 'Background' section with 'Design' header
	Then 'Image:' subsection is displayed in the 'Background' section with 'Design' header

@MindManager @Side_Toolbox @background @BackgroundMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-851] @Upd_Qase
Scenario: Verify_that_User_can_collapse_background_section_in_design_menu
	When User right-click on Canvas
	When User clicks button with 'background' name in 'blank-contextmenu' menu
	Then 'Background' section is displayed on 'PanelByName' side panel with 'Design' header
	Then 'Color:' subsection is displayed in the 'Background' section with 'Design' header
	Then 'Image:' subsection is displayed in the 'Background' section with 'Design' header
	When User clicks 'Background' section header of 'PanelByName' side panel with 'Design' header
	Then 'Background' section is displayed as collapsed of 'PanelByName' side panel with 'Design' header