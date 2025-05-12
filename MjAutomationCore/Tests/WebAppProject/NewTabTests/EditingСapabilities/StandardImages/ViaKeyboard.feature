@retry(2)
Feature: ViaKeyboard
Check functionality of standard image via keyboard

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar

@MindManager @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-440] @Upd_Qase
Scenario: Check_that_it_is_possible_to_delete_image_to_topic_via_keyboard
	When User clicks on image in 'ImageTopic1' topic
	Then 'ImageTopic1' is outlined with a blue circuit
	Then Topic Border is highlight blue color in 'ImageTopic1' topic on Canvas
	When User presses the 'Backspace' key on the keyboard
	Then image is not displayed in 'ImageTopic1' topiс on Canvas

@MindManager @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-440] @Upd_Qase
Scenario: Check_that_it_is_possible_to_delete_image_from_multiple_topic_via_keyboard
	When User clicks 'ImageTopic2' topic on Canvas
	When User clicks 'Image' button of side Toolbox
	When User adds 'FruitsOutlineIcon.png' image via 'PanelByName' side panel with 'Image' header
	When User checks 'Standard Image' radio button in 'Type' section of 'PanelByName' side panel with 'Image' header
	Then 'Standard Image' radio button is checked in 'Type' section of 'PanelByName' side panel with 'Image' header
	When User clicks 'MTSTCO' topic on Canvas
	When User selects images from first 'ImageTopic1' and second 'ImageTopic2' topic on Canvas
	When User presses the 'Delete' key on the keyboard
	Then image is not displayed in 'ImageTopic1' topiс on Canvas
	Then image is not displayed in 'ImageTopic2' topiс on Canvas

@MindManager @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-441] @Upd_Qase @JIRA[MMCV-9218]
Scenario: Check_that_it_is_possible_to_copy_paste_image_to_topic_via_keyboard
	When User clicks on image in 'ImageTopic1' topic
	Then 'ImageTopic1' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic1' topic on Canvas
	When User presses the Ctrl_C combination key on the keyboard
	When User clicks 'ImageTopic2' topic on Canvas
	When User presses the Ctrl_V combination key on the keyboard
	Then image is displayed in 'ImageTopic2' topiс on Canvas
	Then image in topiсs 'ImageTopic2' and 'ImageTopic1' are same
	Then 'ImageTopic2' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic2' topic on Canvas

@MindManager @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-442] @Upd_Qase @JIRA[MMCV-9218]
Scenario: Check_that_it_is_possible_to_replace_image_to_topic_via_keyboard
	When User clicks 'ImageTopic2' topic on Canvas
	When User clicks 'Image' button of side Toolbox
	When User adds 'FruitImages.jpg' image via 'PanelByName' side panel with 'Image' header
	Then image is displayed in 'ImageTopic2' topiс on Canvas
	When User clicks on image in 'ImageTopic1' topic
	Then 'ImageTopic1' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic1' topic on Canvas
	When User presses the Ctrl_C combination key on the keyboard
	When User clicks 'ImageTopic2' topic on Canvas
	When User presses the Ctrl_V combination key on the keyboard
	Then image is displayed in 'ImageTopic2' topiс on Canvas
	Then image in topiсs 'ImageTopic2' and 'ImageTopic1' are same

@MindManager @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-443] @Upd_Qase
Scenario: Check_that_user_cannot_paste_image_to_map_area_with_no_topic_selected
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks on image in 'ImageTopic1' topic
	When User presses the Ctrl_C combination key on the keyboard
	When User clicks by coordinates '50' and '50' on Canvas
	When User presses the Ctrl_V combination key on the keyboard
	Then image is not displayed on the Canvas background
	Then image is not displayed in 'ImageTopic2' topiс on Canvas