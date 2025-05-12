@retry(2)
Feature: TaskInfo
Check for the selected topics with the same items

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @MultiSelect @TaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-451] @Upd_Qase
Scenario: Topics_with_the_same_progress_and_priority
	When User selects first 'F1ST6ST6' and second 'F1ST7ST7' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	Then 'Priority 3' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then '50% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header

@MindManager @EditingCapabilities @MultiSelect @TaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-452] @Upd_Qase
Scenario: Topics_with_different_priority
	When User selects first 'F1ST6' and second 'F1ST7' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'Task Information' panel has no selected icons

@MindManager @EditingCapabilities @MultiSelect @TaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-453] @Upd_Qase
Scenario: Check_that_the_topic_Start_and_Due_date_is_displayed_on_the_side_panel_when_the_Start_and_Due_date_is_the_same_for_all_the_selected_topics
	When User selects first 'F1ST13' and second 'F1ST14' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	Then checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '06/21/2021' date is displayed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '07/23/2021' date is displayed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header

@MindManager @EditingCapabilities @MultiSelect @TaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-454] @Upd_Qase
Scenario: Check_that_topic_Start_and_Due_date_is_not_displayed_on_the_side_panel_when_the_Start_and_Due_date_differs_for_the_selected_topics
	When User selects first 'F1ST13' and second 'F1ST14ST14' topic on Canvas
	When User mouse over on 'Task Information' button of side toolbox
	Then 'Task Information' tooltip is displayed to the User
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	Then checkbox is unchecked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is unchecked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then date input field is displayed empty in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then date input field is displayed empty in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header

@MindManager @EditingCapabilities @MultiSelect @TaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-455] @Upd_Qase
Scenario: Topics_with_same_resources
	When User selects first 'MT3ST1' and second 'MT3ST1ST2' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'Resource #2' resource is displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header

@MindManager @EditingCapabilities @MultiSelect @TaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-456] @Upd_Qase
Scenario: Topics_with_different_resources
	When User selects first 'MT3' and second 'MT3ST1' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then input filed is displayed empty in 'Resources' section of 'PanelByName' side panel with 'Task Information' header