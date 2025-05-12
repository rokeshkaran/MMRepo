@retry(2)
Feature: DragAndDropElementsFromInfoBox
	Verification drag and drop elements from Info box

@Snap @DragAndDropElementsFromInfoBox @QA @Staging @Snap_Cleanup @Not_Run
#C898839
Scenario: Drag_and_drop_elements_to_My_Snap_Queue
	Given User is on the Mindmanager website
	When User provides the Login and Password and clicks on the Sign In button
	Then file manager header page is displayed to User