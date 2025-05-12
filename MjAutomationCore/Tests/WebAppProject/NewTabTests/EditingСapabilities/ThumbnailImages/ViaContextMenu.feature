@retry(2)
Feature: ViaContextMenu
Check functionality of thumbnail image via ContextMenu

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath      |
		| auto_test_SRND.mmap | ImageMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar

@MindManager @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-409] @Upd_Qase @JIRA[MMCV-8462]
Scenario: Check_that_it_is_possible_to_access_the_thumbnail_image_context_menu
	When User clicks on image in 'MTCO' topic
	Then Topic Border is highlight blue color in 'MTCO' topic on Canvas
	When User right clicks on image in 'MTCO' topic on Canvas
	Then 'topic-contextmenu' Menu is displayed to User
	When User clicks by coordinates '50' and '50' on Canvas
	When User selects images from first 'MTCO' and second 'MTSTCO' topic on Canvas
	Then Topic Border is highlight blue color in 'MTCO' topic on Canvas
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTCO' topic on Canvas
	Then Topic Border is highlight blue color in 'MTSTCO' topic on Canvas
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTSTCO' topic on Canvas
	When User right clicks on image in 'MTCO' topic on Canvas
	Then 'topic-contextmenu' Menu is displayed to User

@MindManager @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-410] @Upd_Qase
Scenario: Check_that_user_can_open_format_inspector_panel
	When User right clicks on image in 'MTCO' topic on Canvas
	When User clicks button with 'edit-image' name in 'topic-contextmenu' menu
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	
@MindManager @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-411] @Upd_Qase
Scenario: Check_that_user_can_delete_image_from_a_specific_topic
	When User right clicks on image in 'MTCO' topic on Canvas
	When User clicks button with 'remove-image' name in 'topic-contextmenu' menu
	Then image is not displayed in 'MTCO' topiс on Canvas
	Then 'MTCO' is outlined with a blue circuit

@MindManager @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-412] @Health_Check @Upd_Qase
Scenario: Check_that_user_can_copy_image_via_context_menu
	When User clicks on image in 'MTCO' topic
	Then 'MTCO' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTCO' topic on Canvas
	When User right clicks on image in 'MTCO' topic on Canvas	
	Then button with 'Paste' name is not displayed in 'topic-contextmenu' menu
	When User clicks button with 'copy-image' name in 'topic-contextmenu' menu
	When User clicks on image in 'MTSTCO' topic
	When User clicks 'Paste' button on Tools panel
	Then image in topiсs 'MTSTCO' and 'MTCO' are same

@MindManager @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-412] @Upd_Qase
Scenario: Check_that_user_can_not_copy_image_via_context_menu_with_multiple_image_selected
	When User selects images from first 'MTCO' and second 'MTSTCO' topic on Canvas
	When User right clicks on image in 'MTSTCO' topic on Canvas
	Then 'topic-contextmenu' Menu is displayed to User
	Then button with 'copy-image' name is not displayed in 'topic-contextmenu' menu
	
@MindManager @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-413] @Upd_Qase
Scenario: Check_that_user_can_paste_image_via_context_menu
	When User clicks 'ImageTopic2' topic on Canvas
	Then 'ImageTopic2' is outlined with a blue circuit
	When User Right clicks on 'ImageTopic2' topic
	Then button with 'paste-image' name is not displayed in 'topic-contextmenu' menu
	When User right clicks on image in 'MTCO' topic on Canvas
	When User clicks button with 'copy-image' name in 'topic-contextmenu' menu
	When User Right clicks on 'ImageTopic2' topic
	When User clicks button with 'paste-image' name in 'topic-contextmenu' menu
	Then image in topiсs 'ImageTopic2' and 'MTCO' are same
	When User Right clicks on 'ImageTopic3' topic
	Then button with 'paste-image' name is displayed in 'topic-contextmenu' menu
	When User clicks button with 'paste-image' name in 'topic-contextmenu' menu
	Then image in topiсs 'ImageTopic3' and 'MTCO' are same

@MindManager @ThumbnailImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-414] @Upd_Qase
Scenario: Check_that_user_can_replace_image_via_context_menu
	When User right clicks on image in 'MTCO' topic on Canvas
	Then 'ImageTopic2' is outlined with a blue circuit
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'MTCO' topic on Canvas
	When User clicks button with 'copy-image' name in 'topic-contextmenu' menu
	When User Right clicks on 'ImageTopic3' topic
	When User clicks button with 'paste-image' name in 'topic-contextmenu' menu
	Then image in topiсs 'ImageTopic3' and 'MTCO' are same