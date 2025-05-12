@retry(2)
Feature: DragAndDrop
Check functionality of thumbnail image via Drag And Drop

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | ImageMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar

@MindManager @DragandDrop @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-403] @Upd_Qase
Scenario: Check_that_it_is_possible_to_move_thumbnail_image_from_one_topic_to_another
	Then image is not displayed in 'MT' topiс on Canvas
	When User clicks on image in 'MTCO' topic
	Then 'MTCO' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTCO' topic on Canvas
	Then image in 'MTSTCO' topic is in 'Thumbnail' type
	When User remembers 'MTCO' topic image on Canvas
	When User drags image in 'MTCO' topic and drop onto 'MT' topic
	Then image from 'MTCO' topic is displayed in 'MT' topic
	Then image is not displayed in 'MTCO' topiс on Canvas
	Then 'MT' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MT' topic on Canvas

@MindManager @DragandDrop @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-405] @Upd_Qase
Scenario: Check_that_it_is_possible_to_drop_image_into_canvas
	When User clicks on image in 'MTCO' topic
	Then 'MTCO' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTCO' topic on Canvas
	Then image in 'MTSTCO' topic is in 'Thumbnail' type
	When User remembers 'MTCO' topic image on Canvas
	When User drags image in 'MTCO' topic and drop to cordinates '20' x and '20' y on Canvas
	Then image is not displayed in 'MTCO' topiс on Canvas
	Then image from 'MTCO' topic is displayed as background image on Canvas

@MindManager @DragandDrop @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-406] @Upd_Qase
Scenario: Check_that_it_is_possible_to_replace_topic_image_by_drag_and_drop
	Then image is displayed in 'MTSTCO' topiс on Canvas
	When User clicks on image in 'MTCO' topic
	Then 'MTCO' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTCO' topic on Canvas
	Then image in 'MTSTCO' topic is in 'Thumbnail' type
	When User remembers 'MTCO' topic image on Canvas
	When User drags image in 'MTCO' topic and drop onto 'MTSTCO' topic
	Then image from 'MTCO' topic is displayed in 'MTSTCO' topic
	Then image is not displayed in 'MTCO' topiс on Canvas
	Then 'MTSTCO' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTSTCO' topic on Canvas

@MindManager @DragandDrop @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-408] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_image_location_on_topic_by_drag_and_drop
	Then User set zoom level to '100' via the side tool bar
	When User clicks on image in 'MTCO' topic
	Then User set zoom level to '120' via the side tool bar
	Then 'MTCO' is outlined with a blue circuit
	Then image in 'MTSTCO' topic is in 'Thumbnail' type
	When User drags image in 'MTCO' topic and drop on 'top' side of 'MTCO' topic
	Then image is located on 'top' side in 'MTCO' topic on Canvas
	When User drags image in 'MTCO' topic and drop on 'bottom' side of 'MTCO' topic
	Then image is located on 'bottom' side in 'MTCO' topic on Canvas
	Then User set zoom level to '100' via the side tool bar
	When User drags image in 'MTCO' topic and drop on 'MTCO' topic on coordinates '70' '0'
	Then image is located on 'right' side in 'MTCO' topic on Canvas
	When User drags image in 'MTCO' topic and drop on 'MTCO' topic on coordinates '-60' '0'
	Then image is located on 'left' side in 'MTCO' topic on Canvas