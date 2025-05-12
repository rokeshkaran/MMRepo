@retry(2)
Feature: DeleteMultipleTopics
Check the functionality of combination keyboard the map

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @DeleteMultipleTopics @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-305] @Upd_Qase
Scenario: Delete_multiple_topics_via_Delete_key_on_the_keyboard
	When User selects first 'FT' and second '12345' topic on Canvas
	When User presses the 'Delete' key on the keyboard
	Then '12345' topic is not displayed on Canvas
	Then '2378' topic is not displayed on Canvas
	Then 'FT' topic is not displayed on Canvas
	Then 'FTCO' topic is not displayed on Canvas

@MindManager @EditingCapabilities @DeleteMultipleTopics @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-305] @Upd_Qase
Scenario:Delete_multiple_topics_via_Backspace_key_on_the_keyboard
	When User selects first 'FT' and second '12345' topic on Canvas
	When User presses the 'Backspace' key on the keyboard
	Then '12345' topic is not displayed on Canvas
	Then '2378' topic is not displayed on Canvas
	Then 'FT' topic is not displayed on Canvas
	Then 'FTCO' topic is not displayed on Canvas

@MindManager @EditingCapabilities @DeleteMultipleTopics @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-306] @Upd_Qase
Scenario: Verify_it_is_possible_to_pan_the_map
	When User remembers the map location on Canvas
	When User left-clicks by '20' '20' coordinates on Canvas and hold and wait
	Then hand cursor icon is displayed on Canvas
	When User moves cursor by '15' '0' coordinates on Canvas
	Then map has changed location by X axis on Canvas
	When User remembers the map location on Canvas
	When User moves cursor by '0' '15' coordinates on Canvas
	Then map has changed location by Y axis on Canvas
	When User remembers the map location on Canvas
	When User moves cursor by '-40' '-40' coordinates on Canvas
	Then map has changed location by X axis on Canvas
	Then map has changed location by Y axis on Canvas