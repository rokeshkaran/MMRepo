@retry(2)
Feature: ViaToolbar
Check functionality of thumbnail image via Toolbar

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | ImageMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar

@MindManager @Side_Toolbox @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-421] @Upd_Qase
Scenario: Check_that_it_is_possible_to_delete_thumbnail_image_from_topic_via_toolbar
	When User clicks on image in 'MTCO' topic
	Then 'MTCO' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTCO' topic on Canvas
	When User clicks 'Delete' button on Tools panel
	Then image is not displayed in 'MTCO' topiс on Canvas

@MindManager @Side_Toolbox @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-421] @Upd_Qase
Scenario: Check_that_it_is_possible_to_delete_thumbnail_image_from_multiple_topic_via_toolbar
	When User selects images from first 'MTCO' and second 'MTSTCO' topic on Canvas
	When User clicks 'Delete' button on Tools panel
	Then image is not displayed in 'MTCO' topiс on Canvas
	Then image is not displayed in 'MTSTCO' topiс on Canvas

@MindManager @Side_Toolbox @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-422] @Upd_Qase
Scenario: Check_that_insert_image_button_is_always_available
	Then 'Insert Image' button is displayed as enabled on the Tools panel
	When User hover over 'Insert Image' button in Tools panel
	Then 'Insert Image' tooltip is displayed to the User

@MindManager @Side_Toolbox @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-423] @Upd_Qase
Scenario: Check_that_it_is_possible_to_insert_thumbnail_image_to_unselected_topic_via_toolbar
	When User uploads 'FruitsOutlineIcon.png' file through 'add-image-input' input
	When User hovers cursor the 'ImageTopic1' topic
	When User hovers cursor the 'ImageTopic2' topic
	Then Topic Border is highlight blue color in 'ImageTopic2' topic on Canvas
	Then 'assets-image' icon is displayed beside cursor
	When User clicks 'ImageTopic2' topic on Canvas
	Then image is displayed in 'ImageTopic2' topiс on Canvas

@MindManager @Side_Toolbox @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-425] @Upd_Qase
Scenario: Check_that_it_is_possible_to_insert_thumbnail_image_to_topic_via_toolbar
	When User clicks 'ImageTopic2' topic on Canvas
	When User uploads 'FruitsOutlineIcon.png' file through 'add-image-input' input
	Then 'ImageTopic2' is outlined with a blue circuit
	Then image is displayed in 'ImageTopic2' topiс on Canvas
	When User clicks 'Image' button of side Toolbox
	Then 'Thumbnail Image' radio button is checked in 'Type' section of 'PanelByName' side panel with 'Image' header