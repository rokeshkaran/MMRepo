@retry(2)
Feature: Icons
Check the functionality of Icons multi select

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @MultiSelect @Icons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-474] @Upd_Qase
Scenario: Topics_with_same_icons
	When User selects first 'MT2' and second 'F1ST6' topic on Canvas
	And User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	And 'Priority 2' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Icons' header

@MindManager @EditingCapabilities @MultiSelect @Icons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-475] @Upd_Qase
Scenario: Topics_with_different_icons
	When User selects first 'F1ST6' and second 'F1ST6ST6' topic on Canvas
	And User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	And 'Icons' panel has no selected icons

@MindManager @EditingCapabilities @MultiSelect @Icons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-476] @Upd_Qase
Scenario: Add_Icons_to_multiple_topics
	When User selects first 'MT1' and second 'MT3' topic on Canvas
	And User clicks 'Icons' button of side Toolbox
	And User clicks 'Right' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Right' Icon is displayed to the 'MT1' Topic
	And 'Right' Icon is displayed to the 'MT3' Topic

@MindManager @EditingCapabilities @MultiSelect @Icons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-477] @Upd_Qase
Scenario: Edit_icons_on_multiple_topics_from_side_panel
	Then 'Neutral' Icon is not displayed to the 'F1ST11' Topic
	And 'Neutral' Icon is not displayed to the 'F1ST11ST11' Topic
	When User selects first 'F1ST11' and second 'F1ST11ST11' topic on Canvas
	And User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	When User clicks 'Neutral' item in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Neutral' Icon is displayed to the 'F1ST11' Topic
	And 'Neutral' Icon is displayed to the 'F1ST11ST11' Topic

@MindManager @EditingCapabilities @MultiSelect @Icons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-479] @Upd_Qase
Scenario: Remove_icons_from_multiple_topics 
	Then 'Priority 2' Icon is displayed to the 'MT2' Topic
	And 'Priority 2' Icon is displayed to the 'F1ST6' Topic
	When User selects first 'MT2' and second 'F1ST6' topic on Canvas
	And User clicks 'Icons' button of side Toolbox
	And User clicks 'Priority 2' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 2' Icon is not displayed to the 'MT2' Topic
	And 'Priority 2' Icon is not displayed to the 'F1ST6' Topic

@MindManager @EditingCapabilities @MultiSelect @Icons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-478] @Upd_Qase @JIRA[MMCV-10053]
Scenario: Edit_icons_on_multiple_topics_from_context_menu
	Then User set zoom level to '35' via the side tool bar
	When User selects first 'MT2' and second 'F1ST6' topic on Canvas
	And User Right clicks 'Priority 2' icon in 'F1ST6' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User clicks icon button with 'Priority 1' name in 'topic-contextmenu' menu
	Then 'Priority 1' Icon is displayed to the 'F1ST6' Topic
	And 'Priority 1' Icon is displayed to the 'MT2' Topic