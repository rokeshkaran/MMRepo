@retry(2)
Feature: EditFromSidePanel
Check edit from Side Panel functionality

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @MultiSelect @EditFromSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-462] @Upd_Qase
Scenario: Check_it_is_possible_to_edit_the_topic_progress_on_some_topics_at_the_same_time
	When User selects first 'MT2' and second 'FT1' topic on Canvas
	And User clicks 'Task Information' button of side Toolbox
	And User clicks 'Task done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Task done' Icon is displayed to the 'MT2' Topic
	And 'Task done' Icon is displayed to the 'FT1' Topic

@MindManager @EditingCapabilities @MultiSelect @EditFromSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-463] @Upd_Qase
Scenario: Check_it_is_possible_to_edit_the_topic_priority_on_some_topics_at_the_same_time
	When User selects first 'MT2' and second 'FT1' topic on Canvas
	And User clicks 'Task Information' button of side Toolbox
	And User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 1' Icon is displayed to the 'MT2' Topic
	And 'Priority 1' Icon is displayed to the 'FT1' Topic

@MindManager @EditingCapabilities @MultiSelect @EditFromSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-464] @Upd_Qase
Scenario: Check_it_is_possible_to_edit_the_topic_Start_Date_on_some_topics_at_the_same_time
	When User selects first 'F1ST4' and second 'F1ST5' topic on Canvas
	And User clicks 'Task Information' button of side Toolbox
	And User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '07/28/2022' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '7/28' Start date is displayed to the 'F1ST4' topic infobox
	And '7/28' Start date is displayed to the 'F1ST5' topic infobox

@MindManager @EditingCapabilities @MultiSelect @EditFromSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-465] @Upd_Qase
Scenario: Check_that_it_is_possible_to_edit_the_topic_Due_Date_on_some_topics_at_the_same_time
	When User selects first 'F1ST4ST4' and second 'F1ST5ST5' topic on Canvas
	And User clicks 'Task Information' button of side Toolbox
	Then checkbox is unchecked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '04/26/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '- 4/26' Due date is displayed to the 'F1ST4ST4' topic infobox
	And '- 4/26' Due date is displayed to the 'F1ST5ST5' topic infobox

@MindManager @EditingCapabilities @MultiSelect @EditFromSidePanel @App_QA @App_Staging @App_Prod @Qase[WEB-466] @Cleanup @Upd_Qase
Scenario: Check_that_it_is_possible_to_edit_the_topic_resource_on_some_topics_at_the_same_time
	When User selects first 'MT3' and second 'MT3ST1' topic on Canvas
	And User clicks 'Task Information' button of side Toolbox
	And User enter 'Resource #653' value in the 'Resources' field of 'Task Information' panel
	And User presses the 'Enter' key on the keyboard
	Then 'Resource #1' resource is displayed in 'MT3' topic
	And 'Resource #653' resource is displayed in 'MT3' topic
	And 'Resource #2' resource is displayed in 'MT3ST1' topic
	And 'Resource #3' resource is displayed in 'MT3ST1' topic
	And 'Resource #653' resource is displayed in 'MT3ST1' topic