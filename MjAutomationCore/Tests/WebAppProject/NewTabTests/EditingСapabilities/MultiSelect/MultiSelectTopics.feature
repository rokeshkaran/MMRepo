@retry(2)
Feature: MultiSelectTopics
Check the functionality of Topics multi select

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	
@MindManager @EditingCapabilities @MultiSelect @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-449] @Upd_Qase
Scenario: Select_multiple_topics_with_pressing_ctrl_key
	When User remembers 'MT1' topic model id and name
	And User remembers 'MT1ST1' topic model id and name
	And User selects first 'MT1' and second 'MT1ST1' topic on Canvas
	Then 'MT1' topic is highlighted with 'rgb(62, 158, 255)' color in '0.5' opacity on Canvas
	And 'MT1ST1' topic is highlighted with 'rgb(62, 158, 255)' color in '1' opacity on Canvas

@MindManager @EditingCapabilities @MultiSelect @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-449] @Upd_Qase
Scenario: Select_multiple_topics_with_pressing_shift_key
	When User remembers 'MT1' topic model id and name
	And User remembers 'MT1ST1' topic model id and name
	And User clicks 'MT1' topic on Canvas
	And User presses and hold the 'Shift' key on the keyboard
	And User clicks 'MT1ST1' topic on Canvas
	And User releases all keys on keyboard
	Then 'MT1' topic is highlighted with 'rgb(62, 158, 255)' color in '0.5' opacity on Canvas
	And 'MT1ST1' topic is highlighted with 'rgb(62, 158, 255)' color in '1' opacity on Canvas

@MindManager @EditingCapabilities @MultiSelect @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-449] @Upd_Qase
Scenario: Select_multiple_topics_with_pressing_command_key
	When User remembers 'MT1' topic model id and name
	And User remembers 'MT1ST1' topic model id and name
	And User clicks 'MT1' topic on Canvas
	And User presses and hold the 'Command' key on the keyboard
	And User clicks 'MT1ST1' topic on Canvas
	And User releases all keys on keyboard
	Then 'MT1' topic is highlighted with 'rgb(62, 158, 255)' color in '0.5' opacity on Canvas
	And 'MT1ST1' topic is highlighted with 'rgb(62, 158, 255)' color in '1' opacity on Canvas

@MindManager @EditingCapabilities @MultiSelect @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-450] @Upd_Qase
Scenario: Delete_multiple_topics_from_the_toolbar
	When User selects first 'MT5' and second 'MT6' topic on Canvas
	And User clicks 'Delete' button on Tools panel
	Then 'MT5' topic is not displayed on Canvas
	And 'MT6' topic is not displayed on Canvas