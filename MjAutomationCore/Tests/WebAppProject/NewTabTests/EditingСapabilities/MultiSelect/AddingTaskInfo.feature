@retry(2)
Feature: AddingTaskInfo
Check adding Task Info functionality

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User selects first 'MT1' and second 'MT1ST1' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox

@MindManager @EditingCapabilities @MultiSelect @AddingTaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-457] @Upd_Qase
Scenario: Add_progress_to_multiple_topics
	When User clicks '50% done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '50% done' Icon is displayed to the 'MT1' Topic
	Then '50% done' Icon is displayed to the 'MT1ST1' Topic

@MindManager @EditingCapabilities @MultiSelect @AddingTaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-458] @Upd_Qase
Scenario: Add_priority_to_multiple_topics
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 1' Icon is displayed to the 'MT1' Topic
	Then 'Priority 1' Icon is displayed to the 'MT1ST1' Topic

@MindManager @EditingCapabilities @MultiSelect @AddingTaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-459] @Upd_Qase
Scenario: Check_it_is_possible_to_add_the_same_start_date_to_multiple_topics_at_the_same_time
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then 'D(0)' date is displayed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '04/16/2021' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '4/16' Start date is displayed to the 'MT1' topic infobox
	Then '4/16' Start date is displayed to the 'MT1ST1' topic infobox

@MindManager @EditingCapabilities @MultiSelect @AddingTaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-460] @Upd_Qase
Scenario: Check_it_is_possible_to_add_the_same_Due_date_to_multiple_topics_at_the_same_time
	When User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then 'D(0)' date is displayed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '11/30/2021' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '- 11/30' Due date is displayed to the 'MT1' topic infobox
	Then '- 11/30' Due date is displayed to the 'MT1ST1' topic infobox

@MindManager @EditingCapabilities @MultiSelect @AddingTaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-461] @Upd_Qase
Scenario: Add_resources_to_multiple_topics
	When User enter 'Test Resource' value in the 'Resources' field of 'Task Information' panel
	When User presses the 'Enter' key on the keyboard
	Then 'Test Resource' resource is displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Test Resource' resource is displayed in 'MT1' topic
	Then 'Test Resource' resource is displayed in 'MT1ST1' topic