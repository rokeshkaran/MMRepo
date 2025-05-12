@retry(2)
Feature: DragAndDrop
Check functionality of Standard image via Drag And Drop

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath      |
		| auto_test_SRND.mmap | ImageMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @DragAndDrop @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-428] @Upd_Qase
Scenario: Check_that_it_is_possible_to_move_standard_image_from_one_topic_to_another
	When User clicks on image in 'ImageTopic1' topic
	Then image in 'ImageTopic1' topic is in 'Standard' type
	When User remembers 'ImageTopic1' topic image on Canvas
	And User drags image in 'ImageTopic1' topic and drop onto 'ImageTopic2' topic
	Then image from 'ImageTopic1' topic is displayed in 'ImageTopic2' topic
	And image is not displayed in 'ImageTopic1' topiс on Canvas

@MindManager @DragAndDrop @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-430] @Upd_Qase
Scenario: Check_that_it_is_possible_to_drop_standard_image_into_canvas
	When User clicks on image in 'ImageTopic1' topic
	Then 'ImageTopic1' is outlined with a blue circuit
	And image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic1' topic on Canvas
	And image in 'ImageTopic1' topic is in 'Standard' type
	When User remembers 'ImageTopic1' topic image on Canvas
	And User drags image in 'ImageTopic1' topic and drop to cordinates '20' x and '20' y on Canvas
	Then image is not displayed in 'ImageTopic1' topiс on Canvas
	And image from 'ImageTopic1' topic is displayed as background image on Canvas
	
@MindManager @DragAndDrop @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-431] @Upd_Qase
Scenario: Check_that_it_is_possible_to_replace_topic_standard_image_by_drag_and_drop
	Then image is displayed in 'MTCO' topiс on Canvas
	When User clicks on image in 'ImageTopic1' topic
	Then 'ImageTopic1' is outlined with a blue circuit
	And image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic1' topic on Canvas
	And image in 'ImageTopic1' topic is in 'Standard' type
	When User remembers 'ImageTopic1' topic image on Canvas
	And User drags image in 'ImageTopic1' topic and drop onto 'MTCO' topic
	Then image from 'ImageTopic1' topic is displayed in 'MTCO' topic
	And image is not displayed in 'ImageTopic1' topiс on Canvas

@MindManager @DragAndDrop @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-432] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_standard_image_location_on_topic_by_drag_and_drop
	When User clicks on image in 'ImageTopic1' topic
	Then User set zoom level to '150' via the side tool bar
	And 'ImageTopic1' is outlined with a blue circuit
	And image in 'ImageTopic1' topic is in 'Standard' type
	When User drags image in 'ImageTopic1' topic and drop on 'ImageTopic1' topic on coordinates '200' '0'
	Then image is located on 'right' side in 'ImageTopic1' topic on Canvas
	When User drags image in 'ImageTopic1' topic and drop on 'top' side of 'ImageTopic1' topic
	Then image is located on 'top' side in 'ImageTopic1' topic on Canvas
	When User drags image in 'ImageTopic1' topic and drop on 'bottom' side of 'ImageTopic1' topic
	Then image is located on 'bottom' side in 'ImageTopic1' topic on Canvas
	When User drags image in 'ImageTopic1' topic and drop on 'ImageTopic1' topic on coordinates '-270' '0'
	Then image is located on 'left' side in 'ImageTopic1' topic on Canvas