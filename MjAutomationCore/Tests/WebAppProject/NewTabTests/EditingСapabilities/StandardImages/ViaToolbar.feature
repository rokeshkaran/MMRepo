@retry(2)
Feature: ViaToolbar
Check functionality of standard image via Toolbar

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And User set zoom level to '32' via the side tool bar

@MindManager @Side_Toolbox @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-448] @Upd_Qase
Scenario: Check_that_it_is_possible_to_insert_image_to_topic_via_toolbar
	When User clicks 'ImageTopic2' topic on Canvas
	And User uploads 'FruitsOutlineIcon.png' file through 'add-image-input' input
	Then image is displayed in 'ImageTopic2' topiс on Canvas
	When User clicks 'Image' button of side Toolbox
	And User checks 'Standard Image' radio button in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then 'Standard Image' radio button is checked in 'Type' section of 'PanelByName' side panel with 'Image' header
	And image in 'ImageTopic2' topic is in 'Standard' type

@MindManager @Side_Toolbox @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-445] @Upd_Qase
Scenario: Check_that_it_is_possible_to_delete_image_from_topic_via_toolbar
	When User clicks on image in 'ImageTopic1' topic
	Then 'ImageTopic1' is outlined with a blue circuit
	And image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic1' topic on Canvas
	When User clicks 'Delete' button on Tools panel
	Then image is not displayed in 'ImageTopic1' topiс on Canvas

@MindManager @Side_Toolbox @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-445] @Upd_Qase
Scenario: Check_that_it_is_possible_to_delete_image_from_multiple_topic_via_toolbar
	When User clicks 'ImageTopic2' topic on Canvas
	And User clicks 'Image' button of side Toolbox
	And User adds 'FruitsOutlineIcon.png' image via 'PanelByName' side panel with 'Image' header
	And User checks 'Standard Image' radio button in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then 'Standard Image' radio button is checked in 'Type' section of 'PanelByName' side panel with 'Image' header
	And image is displayed in 'ImageTopic2' topiс on Canvas
	When User clicks 'MTSTCO' topic on Canvas
	And User selects images from first 'ImageTopic1' and second 'ImageTopic2' topic on Canvas
	And User clicks 'Delete' button on Tools panel
	Then image is not displayed in 'ImageTopic1' topiс on Canvas
	And image is not displayed in 'ImageTopic2' topiс on Canvas

@MindManager @Side_Toolbox @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-446] @Upd_Qase
Scenario: Check_that_it_is_possible_to_insert_image_to_unselected_topic_via_toolbar
	When User clicks 'Image' button of side Toolbox
	And User adds 'FruitsOutlineIcon.png' image via 'PanelByName' side panel with 'Image' header
	And User hovers cursor the 'ImageTopic2' topic
	And User moves cursor mouse on Canvas
	Then 'assets-image' icon is displayed beside cursor
	When User hovers cursor the 'ImageTopic2' topic
	Then Topic Border is highlight blue color in 'ImageTopic2' topic on Canvas
	When User clicks 'ImageTopic2' topic on Canvas
	Then image is displayed in 'ImageTopic2' topiс on Canvas