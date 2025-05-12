@retry(2)
Feature: Priority
Check that Priority icons can be added,edited and remove via 'Task info' side panel

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @SidePanel @Priority @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-728] @Upd_Qase
Scenario: Verify_that_Priority_icon_can_be_added_via_Task_info_side_panel
	When User clicks 'CT' topic on Canvas
	Then Topic Border is highlight blue color in 'CT' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	Then following items is displayed in 'Priority' section of 'PanelByName' side panel with 'Task Information' header:
		| Items      |
		| Priority 1 |
		| Priority 2 |
		| Priority 3 |
		| Priority 4 |
		| Priority 5 |
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 1' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 1' Icon is displayed to the 'CT' Topic

@MindManager @SidePanel @Priority @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-729] @Upd_Qase
Scenario: Verify_it_is_possible_to_edit_Priority_from_Task_Information_panel
	When User clicks 'MT2' topic on Canvas
	Then Topic Border is highlight blue color in 'MT2' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	Then 'Priority 2' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 2' item is displayed as unselected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 1' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 1' Icon is displayed to the 'MT2' Topic

@MindManager @SidePanel @Priority @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-730] @Upd_Qase
Scenario: Verify_it_is_possible_to_remove_topic_Priority_icon_from_Task_Information_menu
	When User clicks 'MT2' topic on Canvas
	Then Topic Border is highlight blue color in 'MT2' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'Priority 2' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	When User clicks 'Priority 2' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 2' item is displayed as unselected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 2' Icon is not displayed to the 'CT' Topic