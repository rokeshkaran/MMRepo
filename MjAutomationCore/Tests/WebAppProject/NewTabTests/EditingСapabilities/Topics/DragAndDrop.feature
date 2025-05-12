@retry(2)
Feature: DragAndDrop
Check the functionality of drag and drop topics

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @Topics @DragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-299] @Upd_Qase
Scenario: Check_that_it_is_possible_to_drag_and_drop_topics
	When User remembers location of 'MT1' topic on Canvas
	When User drags and hold 'MT1' topic to '-75' and '-75' coordinates on Canvas
	Then selected topic is displayed attached to the mouse cursor at 50 percent opacity
	Then 'capsule-legacy' topic shape is attached to the cursor on Canvas
	When User releases all pressed keys
	Then 'MT1' topic has changed location by X axis on Canvas
	Then 'MT1' topic has changed location by Y axis on Canvas

@MindManager @EditingCapabilities @Topics @DragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-302] @Upd_Qase
Scenario: Drag_and_drop_multiple_topics
	When User selects first 'FT2' and second 'FT3' topic on Canvas
	When User remembers location of 'FT2' topic on Canvas
	When User Drag 'FT3' topic on 'Main Topic' topic
	Then 'FT2' topic has changed location by X axis on Canvas
	Then 'FT2' topic has changed location by Y axis on Canvas
	Then 'FT2' is a subtopic of 'Main Topic' topic on Canvas
	Then 'FT3' is a subtopic of 'Main Topic' topic on Canvas

@MindManager @EditingCapabilities @Topics @DragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Not_Run_Edge @Qase[WEB-303] @Upd_Qase
Scenario: Check_Drag_and_drop_topic_by_X_axis_to_an_off_screen_location
	When the user sets the window size to width '1600' and height '800'
	Then browser has width '1600' and height '800'
	When User clicks 'FT3' topic on Canvas
	When User remembers location of 'FT3' topic on Canvas
	When User remembers the map location on Canvas
	When User drags and hold 'FT3' topic to '-300' and '0' coordinates on Canvas
	When User releases all pressed keys
	Then map has changed location by X axis on Canvas
	Then 'FT3' topic has changed location by X axis on Canvas
	When User remembers location of 'FT2' topic on Canvas
	When User remembers the map location on Canvas
	When User drags and hold 'FT2' topic to '400' and '0' coordinates on Canvas
	When User releases all pressed keys
	Then map has changed location by X axis on Canvas
	Then 'FT2' topic has changed location by X axis on Canvas

@MindManager @EditingCapabilities @Topics @DragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-303] @Upd_Qase
Scenario: Check_Drag_and_drop_topic_by_Y_axis_to_an_off_screen_location
	When User remembers the map location on Canvas
	When User remembers location of 'MT1' topic on Canvas
	When User drags and hold 'MT1' topic to '0' and '-120' coordinates on Canvas
	When User releases all pressed keys
	Then map has changed location by Y axis on Canvas
	Then 'MT1' topic has changed location by Y axis on Canvas
	When User remembers the map location on Canvas
	When User remembers location of 'MT3' topic on Canvas
	When User drags and hold 'MT3' topic to '0' and '100' coordinates on Canvas
	When User releases all pressed keys
	Then map has changed location by Y axis on Canvas
	Then 'MT3' topic has changed location by Y axis on Canvas

@MindManager @EditingCapabilities @Topics @DragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-304] @Upd_Qase
Scenario: Check_Drag_and_drop_multiple_topics_by_X_axis_to_an_off_screen_location
	When the user sets the window size to width '1500' and height '800'
	Then browser has width '1500' and height '800'
	When User selects first 'FT2' and second 'FT3' topic on Canvas
	When User remembers location of 'MT1' topic on Canvas
	When User remembers the map location on Canvas
	When User drags and hold 'FT2' topic to '-250' and '0' coordinates on Canvas
	When User releases all pressed keys
	Then map has changed location by X axis on Canvas
	Then 'FT2' topic has changed location by X axis on Canvas

@MindManager @EditingCapabilities @Topics @DragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-304] @Upd_Qase
Scenario: Check_Drag_and_drop_multiple_topics_by_Y_axis_to_an_off_screen_location
	When User remembers the map location on Canvas
	When User selects first 'MT1' and second 'MT1ST1ST' topic on Canvas
	When User remembers location of 'MT1' topic on Canvas
	When User drags and hold 'MT1' topic to '0' and '130' coordinates on Canvas
	When User releases all pressed keys
	Then map has changed location by Y axis on Canvas
	Then 'MT1' topic has changed location by Y axis on Canvas