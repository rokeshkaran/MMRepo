@retry(2)
Feature: EditAndAddFromTheSidePane
Verify that can be edit and add from the Side Pane

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @Edit_And_Add_From_Side_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-885] @Health_Check @Upd_Qase
Scenario: Check_that_task_progress_and_priority_can_be_edited_via_the_side_panel
	When User clicks 'CT' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	When User clicks 'Priority 5' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	When User clicks 'Task done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 5' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Task done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	When User clicks 'Priority 2' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 2' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	When User clicks '25% done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '25% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 2' Icon is displayed to the 'CT' Topic
	Then '25% done' Icon is displayed to the 'CT' Topic

@MindManager @Edit_And_Add_From_Side_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-886] @Upd_Qase
Scenario: Check_that_Flag_Smile_Arrow_icons_can_be_edited_via_the_side_pane
	When User clicks 'CT' topic on Canvas
	When User clicks 'Icons' button of side Toolbox
	When User clicks 'Right' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Move' item in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Sad' item in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	When User clicks Close button of 'PanelByName' side panel with 'Icons' header
	Then 'PanelByName' side panel with 'Icons' header is not displayed to the User
	When User clicks 'Icons' button of side Toolbox
	Then 'Right' item is displayed as selected in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Move' item is displayed as selected in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	Then 'Sad' item is displayed as selected in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Up' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Up' item is displayed as selected in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Up' Icon is displayed to the 'CT' Topic
	When User clicks 'Discuss' item in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	Then 'Discuss' item is displayed as selected in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	Then 'Discuss' Icon is displayed to the 'CT' Topic
	When User clicks 'Happy' item in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Happy' item is displayed as selected in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Happy' Icon is displayed to the 'CT' Topic