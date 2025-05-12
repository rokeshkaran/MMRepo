@retry(2)
Feature: TextAccelerators
Check functionality for text accelerators

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @TextAccelerators @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-314] @JIRA[MMCV-5275] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_add_existing_resources_using_the_@_symbol_and_without_taking_hands_off_the_keyboard
	When User clicks 'MT3' topic on Canvas
	And User enters '@' symbol
	Then text accelerator 'resource' is displayed to User
	And following items is displayed in 'resource' text accelerator menu
		| items        |
		| Add Resource |
		| Resource #1  |
		| Resource #2  |
		| Resource #3  |
	When User presses the Down arrow key and selects 'Resource #2' value in 'resource' text accelerator
	Then 'Resource #2' resource is displayed in 'MT3' topic
	When User clicks 'MT4' topic on Canvas
	And User enters '@' symbol
	Then text accelerator 'resource' is displayed to User
	When User enters 'Resource' value in input field of 'resource' text accelerator
	Then following items is displayed in 'resource' text accelerator menu
		| items        |
		| Add Resource |
		| Resource #1  |
		| Resource #2  |
		| Resource #3  |
	When User clicks 'Resource #1' value in 'resource' text accelerator
	Then 'Resource #1' resource is displayed in 'MT4' topic

@MindManager @EditingCapabilities @TextAccelerators @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-315] @JIRA[MMCV-10491] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_add_new_resources_using_the_@_symbol_and_without_taking_hands_off_the_keyboard
	When User clicks 'MT1' topic on Canvas
	And User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User enters '@' symbol
	Then text accelerator 'resource' is displayed to User
	When User enters 'testResource' value in input field of 'resource' text accelerator
	And User presses the 'Enter' key on the keyboard
	Then 'testResource' resource is displayed in 'MT1' topic
	And 'testResource' resource is displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header

@MindManager @EditingCapabilities @TextAccelerators @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-316] @JIRA[MMCV-5275] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_add_existing_tags_using_the_#_symbol_and_without_taking_hands_off_the_keyboard
	When User clicks 'MT4ST3' topic on Canvas
	And User enters '#' symbol
	Then text accelerator 'tag' is displayed to User
	And following items is displayed in 'tag' text accelerator menu
		| items    |
		| Add Tags |
		| Tags_1   |
		| Tags_2   |
		| Tags_3   |
	When User presses the Down arrow key and selects 'Tags_1' value in 'tag' text accelerator
	Then 'Tags_1' tag is displayed in 'MT4ST3' topic infobox
	When User enters '#' symbol
	Then text accelerator 'tag' is displayed to User
	When User enters 'Tags' value in input field of 'tag' text accelerator
	Then following items is displayed in 'tag' text accelerator menu
		| items    |
		| Add Tags |
		| Tags_1   |
		| Tags_2   |
		| Tags_3   |
	When User clicks 'Tags_3' value in 'tag' text accelerator
	Then 'Tags_3' tag is displayed in 'MT4ST3' topic infobox
	When User clicks 'Tags' button of side Toolbox
	Then 'Tags_3' item is displayed as selected in 'General Tags' section of 'PanelByName' side panel with 'Tags' header

@MindManager @EditingCapabilities @TextAccelerators @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-317] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_add_new_tags_using_the_#_symbol_and_without_taking_hands_off_the_keyboard
	When User clicks 'MT1' topic on Canvas
	And User enters '#' symbol
	Then text accelerator 'tag' is displayed to User
	When User enters 'testTag' value in input field of 'tag' text accelerator
	And User presses the 'Enter' key on the keyboard
	Then 'testTag' tag is displayed in 'MT1' topic infobox
	When User clicks 'Tags' button of side Toolbox
	Then 'testTag' item is displayed as selected in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	
@MindManager @EditingCapabilities @TextAccelerators @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-319] @Upd_Qase
Scenario: Hide_resource_text_accelerator
	When User clicks 'MT1' topic on Canvas
	And User enters '@' symbol
	Then text accelerator 'resource' is displayed to User
	When User presses the 'Esc' key on the keyboard
	Then text accelerator 'resource' is not displayed to User
	And 'MT1' is outlined with a blue circuit

@MindManager @EditingCapabilities @TextAccelerators @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-319] @Upd_Qase
Scenario: Hide_tag_text_accelerator
	When User clicks 'MT1' topic on Canvas
	And User enters '#' symbol
	Then text accelerator 'tag' is displayed to User
	When User presses the 'Esc' key on the keyboard
	Then text accelerator 'tag' is not displayed to User
	And 'MT1' is outlined with a blue circuit

@MindManager @EditingCapabilities @TextAccelerators @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-320] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_add_tags_and_resources_to_topic_with_custom_text
	When User clicks 'Text Formatting' topic on Canvas
	Then 'Text Formatting' is outlined with a blue circuit
	When User enters '@' symbol
	Then text accelerator 'resource' is displayed to User
	And text 'Text Formatting' is displayed to the topic on Canvas
	When User presses the 'Esc' key on the keyboard
	And User clicks on text in the 'Text Formatting' topic on Canvas
	And User presses the Ctrl_A combination key on the keyboard
	Then text 'Text Formatting' is displayed to the topic on Canvas
	When User presses the 'Esc' key on the keyboard
	And User enters '#' symbol
	Then text accelerator 'tag' is displayed to User
	And text 'Text Formatting' is displayed to the topic on Canvas
	When User presses the 'Esc' key on the keyboard
	And User clicks 'Main Topic' topic on Canvas
	Then 'Main Topic' is outlined with a blue circuit
	When User enters '@' symbol
	Then text accelerator 'resource' is displayed to User