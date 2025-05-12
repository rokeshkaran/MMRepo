@retry(2)
Feature: ViaKeyboard
Check functionality of thumbnail image via keyboard

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | ImageMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar

@MindManager @ThumbnailImage @ViaKeyboard @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-416] @Upd_Qase
Scenario: Check_that_it_is_possible_to_delete_thumbnail_image_to_topic_via_keyboard
	When User clicks on image in 'MTCO' topic
	Then 'MTCO' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTCO' topic on Canvas
	Then Topic Border is highlight blue color in 'MTCO' topic on Canvas
	When User presses the 'Backspace' key on the keyboard
	Then image is not displayed in 'MTCO' topiс on Canvas

@MindManager @ThumbnailImage @ViaKeyboard @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-416] @Upd_Qase
Scenario: Check_that_it_is_possible_to_delete_thumbnail_image_from_multiple_topic_via_keyboard
	When User selects images from first 'MTCO' and second 'MTSTCO' topic on Canvas
	Then 'MTCO' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTCO' topic on Canvas
	Then Topic Border is highlight blue color in 'MTCO' topic on Canvas
	Then 'MTSTCO' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTSTCO' topic on Canvas
	Then Topic Border is highlight blue color in 'MTSTCO' topic on Canvas
	When User presses the 'Delete' key on the keyboard
	Then image is not displayed in 'MTCO' topiс on Canvas
	Then image is not displayed in 'MTSTCO' topiс on Canvas

@MindManager @ThumbnailImage @ViaKeyboard @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-417] @Upd_Qase @JIRA[MMCV-9218]
Scenario: Check_that_it_is_possible_to_copy_paste_thumbnail_image_to_topic_via_keyboard
	When User clicks on image in 'MTCO' topic
	Then 'MTCO' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTCO' topic on Canvas
	When User presses the Ctrl_C combination key on the keyboard
	When User clicks 'ImageTopic2' topic on Canvas
	When User presses the Ctrl_V combination key on the keyboard
	Then image is displayed in 'ImageTopic2' topiс on Canvas
	Then image in topiсs 'ImageTopic2' and 'MTCO' are same

@MindManager @ThumbnailImage @ViaKeyboard @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-418] @Upd_Qase @JIRA[MMCV-9218]
Scenario: Check_that_it_is_possible_to_replace_thumbnail_image_to_topic_via_keyboard
	When User clicks on image in 'MTCO' topic
	Then 'MTCO' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTCO' topic on Canvas
	When User presses the Ctrl_C combination key on the keyboard
	When User clicks 'MTSTCO' topic on Canvas
	When User presses the Ctrl_V combination key on the keyboard
	Then image is displayed in 'MTSTCO' topiс on Canvas
	Then image in topiсs 'MTSTCO' and 'MTCO' are same

@MindManager @ThumbnailImage @ViaKeyboard @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-419] @Upd_Qase
Scenario: Check_that_user_cannot_paste_thumbnail_image_to_map_area_with_no_topic_selected
	When User clicks on image in 'MTCO' topic
	When User presses the Ctrl_C combination key on the keyboard
	When User clicks by coordinates '50' and '50' on Canvas
	When User presses the Ctrl_V combination key on the keyboard
	Then image is not displayed on the Canvas background
	Then image is not displayed in 'ImageTopic2' topiс on Canvas