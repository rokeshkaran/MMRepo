@retry(2)
Feature: Icons
Checking Icons functionality from side panel

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @SidePanel @Icons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-743] @Upd_Qase
Scenario: Add_Progress_via_Icons_side_panel
	When User clicks 'CT' topic on Canvas
	When User clicks 'Icons' button of side Toolbox
	Then following items is displayed in 'Progress' section of 'PanelByName' side panel with 'Icons' header:
		| Items     |
		| Not done  |
		| 25% done  |
		| 50% done  |
		| 75% done  |
		| Task done |
	When User clicks 'Not done' item in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then 'Not done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then 'Not done' Icon is displayed to the 'CT' Topic
	When User clicks '25% done' item in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then '25% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then 'Not done' item is displayed as unselected in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then '25% done' Icon is displayed to the 'CT' Topic
	Then 'Not done' Icon is not displayed to the 'CT' Topic
	When User clicks '50% done' item in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then '50% done' Icon is displayed to the 'CT' Topic
	When User clicks '75% done' item in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then '75% done' Icon is displayed to the 'CT' Topic
	When User clicks 'Task done' item in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then 'Task done' Icon is displayed to the 'CT' Topic
	Then 'CT' topic has Fill Color 'rgb(171, 229, 149)' on Canvas

@MindManager @SidePanel @Icons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-744] @Upd_Qase
Scenario: Add_Priority_via_Icons_side_panel
	When User clicks 'CT' topic on Canvas
	When User clicks 'Icons' button of side Toolbox
	Then following items is displayed in 'Priority' section of 'PanelByName' side panel with 'Icons' header:
		| Items      |
		| Priority 1 |
		| Priority 2 |
		| Priority 3 |
		| Priority 4 |
		| Priority 5 |
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 1' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 1' Icon is displayed to the 'CT' Topic
	When User clicks 'Priority 2' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 1' item is displayed as unselected in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 1' Icon is not displayed to the 'CT' Topic
	Then 'Priority 2' Icon is displayed to the 'CT' Topic
	When User clicks 'Priority 3' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 3' Icon is displayed to the 'CT' Topic
	When User clicks 'Priority 4' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 4' Icon is displayed to the 'CT' Topic
	When User clicks 'Priority 5' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 5' Icon is displayed to the 'CT' Topic

@MindManager @SidePanel @Icons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-745] @Upd_Qase
Scenario: Add_Icons_via_Icons_side_panel
	When User clicks 'CT' topic on Canvas
	When User clicks 'Icons' button of side Toolbox
	When User clicks 'Down' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Down' item is displayed as selected in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Down' Icon is displayed to the 'CT' Topic
	When User clicks 'Discuss' item in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	Then 'Discuss' item is displayed as selected in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	Then 'Discuss' Icon is displayed to the 'CT' Topic
	When User clicks 'Neutral' item in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Neutral' item is displayed as selected in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Neutral' Icon is displayed to the 'CT' Topic

@MindManager @SidePanel @Icons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-746] @Upd_Qase
Scenario: Add_General_Icons_via_Icons_side_panel
	When User clicks 'CT' topic on Canvas
	When User clicks 'Icons' button of side Toolbox
	When User clicks 'Pro' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Pro' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Con' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Con' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Question' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Question' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Attention' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Attention' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Decision' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Decision' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Date' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Date' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Cost' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Cost' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Alarm' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Alarm' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Pro' Icon is displayed to the 'CT' Topic
	Then 'Con' Icon is displayed to the 'CT' Topic
	Then 'Question' Icon is displayed to the 'CT' Topic
	Then 'Attention' Icon is displayed to the 'CT' Topic
	Then 'Decision' Icon is displayed to the 'CT' Topic
	Then 'Date' Icon is displayed to the 'CT' Topic
	Then 'Cost' Icon is displayed to the 'CT' Topic
	Then 'Alarm' Icon is displayed to the 'CT' Topic

@MindManager @SidePanel @Icons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-747] @Upd_Qase
Scenario: Change_group_membership_of_the_icon_via_drag_and_drop
	When User clicks 'Icons' button of side Toolbox
	Then following items is displayed in 'Smileys' section of 'PanelByName' side panel with 'Icons' header:
		| Items   |
		| Happy   |
		| Neutral |
		| Sad     |
	When User drags 'Sad' item from 'Smileys' section to 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then following items is displayed in 'Arrows' section of 'PanelByName' side panel with 'Icons' header:
		| Items |
		| Up    |
		| Down  |
		| Sad   |
		| Left  |
		| Right |
	When User drags 'Up' item from 'Arrows' section to 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then following items is displayed in 'Smileys' section of 'PanelByName' side panel with 'Icons' header:
		| Items   |
		| Happy   |
		| Up      |
		| Neutral |
	When User drags 'Discuss' item from 'Flags' section to 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then following items is displayed in 'Smileys' section of 'PanelByName' side panel with 'Icons' header:
		| Items   |
		| Happy   |
		| Discuss |
		| Up      |
		| Neutral |
	When User drags 'Discuss' item from 'Smileys' section to 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then following items is displayed in 'Priority' section of 'PanelByName' side panel with 'Icons' header:
		| Items      |
		| Priority 1 |
		| Priority 2 |
		| Priority 3 |
		| Priority 4 |
		| Priority 5 |
	When User drags 'Discuss' item from 'Smileys' section to 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then following items is displayed in 'Progress' section of 'PanelByName' side panel with 'Icons' header:
		| Items     |
		| Not done  |
		| 25% done  |
		| 50% done  |
		| 75% done  |
		| Task done |

@MindManager @SidePanel @Icons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-744] @Upd_Qase
Scenario: Hover_Icon_on_Icons_side_panel
	When User clicks 'Icons' button of side Toolbox
	When User mouses over 'Happy' item in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Happy' item is displayed with selection frame in 'rgba(221, 237, 253, 1)' color in 'Smileys' section of 'PanelByName' side panel with 'Icons' header