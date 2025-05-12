@retry(2)
Feature: RemovingTaskInfo
Check for the selected topics with the same items

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @MultiSelect @RemovingTaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-469] @Upd_Qase
Scenario: Check_it_is_possible_to_remove_topic_progress_for_all_the_selected_topics_if_they_currently_have_the_same_property_value
	When User selects first 'MT2' and second 'F1ST7ST7' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then '50% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	When User clicks '50% done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '50% done' item is displayed as unselected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '50% done' Icon is not displayed to the 'MT2' Topic
	Then '50% done' Icon is not displayed to the 'F1ST7ST7' Topic

@MindManager @EditingCapabilities @MultiSelect @RemovingTaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-470] @Upd_Qase
Scenario: Check_it_is_possible_to_remove_topic_priority_for_all_the_selected_topics_if_they_currently_have_the_same_property_value
	When User selects first 'MT2' and second 'F1ST6' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'Priority 2' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	When User clicks 'Priority 2' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 2' item is displayed as unselected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 2' Icon is not displayed to the 'MT2' Topic
	Then 'Priority 2' Icon is not displayed to the 'F1ST6' Topic

@MindManager @EditingCapabilities @MultiSelect @RemovingTaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-471] @Upd_Qase
Scenario: Check_it_is_possible_to_Remove_the_topic_Start_date_for_all_the_selected_topics_if_they_currently_have_the_same_value
	When User selects first 'F1ST4' and second 'F1ST12' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User unchecks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is unchecked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then Date box is not displayed in the 'F1ST4' topic infobox on Canvas
	Then Date box is not displayed in the 'F1ST12' topic infobox on Canvas

@MindManager @EditingCapabilities @MultiSelect @RemovingTaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-472] @Upd_Qase
Scenario: Check_it_is_possible_to_Remove_the_topic_Due_date_for_all_the_selected_topics_if_they_currently_have_the_same_value
	When User presses Left_CTRL key on keyboard
	When User clicks 'F1ST4ST4' topic on Canvas
	When User clicks 'F1ST12ST12' topic on Canvas
	When User releases all keys on keyboard
	When User clicks 'Task Information' button of side Toolbox
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is unchecked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then Date box is not displayed in the 'F1ST4ST4' topic infobox on Canvas
	Then Date box is not displayed in the 'F1ST12ST12' topic infobox on Canvas

@MindManager @EditingCapabilities @MultiSelect @RemovingTaskInfo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-473] @Upd_Qase
Scenario: Remove_Resources
	When User selects first 'MT3ST1' and second 'MT3ST1ST2' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	When User clicks Remove on 'Resource #2' resource in 'Resources' section on 'PanelByName' panel with 'Task Information' header
	Then 'Resource #2' resource is not displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Resource #2' resource is not displayed in 'MT3ST1' topic
	Then 'Resource #2' resource is not displayed in 'MT3ST1ST2' topic