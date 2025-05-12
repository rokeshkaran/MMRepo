@retry(2)
Feature: Progress
Check that Progress icons can be added,edited and remove via 'Task info' side panel

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @SidePanel @Progress @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-731] @Upd_Qase
Scenario: Verify_that_Progress_icon_can_be_added_via_Task_info_side_panel
	When User clicks 'CT' topic on Canvas
	Then Topic Border is highlight blue color in 'CT' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	Then following items is displayed in 'Progress' section of 'PanelByName' side panel with 'Task Information' header:
		| Items     |
		| Not done  |
		| 25% done  |
		| 50% done  |
		| 75% done  |
		| Task done |
	When User clicks '75% done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '75% done' Icon is displayed to the 'CT' Topic

@MindManager @SidePanel @Progress @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-732] @Upd_Qase
Scenario: Verify_it_is_possible_to_edit_Progress_from_Task_Information_panel
	When User clicks 'MT2' topic on Canvas
	Then Topic Border is highlight blue color in 'MT2' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	Then '50% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	When User clicks 'Not done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '50% done' item is displayed as unselected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Not done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Not done' Icon is displayed to the 'MT2' Topic

@MindManager @SidePanel @Progress @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-733] @Upd_Qase
Scenario: Verify_it_is_possible_to_remove_a_Progress_icon_from_a_Topic_via_the_Task_Information_Menu
	When User clicks 'MT2' topic on Canvas
	Then Topic Border is highlight blue color in 'MT2' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User clicks '50% done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '50% done' item is displayed as unselected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '50% done' Icon is not displayed to the 'MT2' Topic