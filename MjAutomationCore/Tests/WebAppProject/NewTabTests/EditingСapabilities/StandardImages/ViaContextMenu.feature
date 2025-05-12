@retry(2)
Feature: ViaContextMenu
Check functionality of standard image via ContextMenu

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath      |
		| auto_test_SRND.mmap | ImageMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And User set zoom level to '32' via the side tool bar

@MindManager @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-433] @Upd_Qase
Scenario: Check_that_it_is_possible_to_access_the_image_context_menu
	When User selects images from first 'ImageTopic1' and second 'ImageTopic3' topic on Canvas
	Then 'ImageTopic1' is outlined with a blue circuit
	And image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic1' topic on Canvas
	When User clicks on image in 'ImageTopic3' topic
	Then 'ImageTopic3' is outlined with a blue circuit
	And image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic3' topic on Canvas
	When User right clicks on image in 'ImageTopic1' topic on Canvas
	Then 'topic-contextmenu' Menu is displayed to User

@MindManager @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-434] @Upd_Qase
Scenario: Check_that_user_can_open_format_inspector_panel
	When User clicks on image in 'ImageTopic1' topic
	Then 'ImageTopic1' is outlined with a blue circuit
	And image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic1' topic on Canvas
	When User right clicks on image in 'ImageTopic1' topic on Canvas
	And User clicks button with 'edit-image' name in 'topic-contextmenu' menu
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	
@MindManager @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-435] @Upd_Qase
Scenario: Check_that_user_can_delete_image_from_a_specific_topic
	When User right clicks on image in 'ImageTopic1' topic on Canvas
	And User waits '500' miliseconds
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic1' topic on Canvas
	When User clicks button with 'remove-image' name in 'topic-contextmenu' menu
	And User clicks 'ImageTopic1' topic on Canvas
	Then image is not displayed in 'ImageTopic1' topiс on Canvas

@MindManager @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-436] @Upd_Qase
Scenario: Check_that_user_can_copy_image_via_context_menu
	When User right clicks on image in 'ImageTopic1' topic on Canvas
	And User waits '500' miliseconds
	Then image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic1' topic on Canvas
	When User clicks button with 'copy-image' name in 'topic-contextmenu' menu
	And User clicks on image in 'ImageTopic3' topic
	And User clicks 'Paste' button on Tools panel
	Then image in topiсs 'ImageTopic3' and 'ImageTopic1' are same

@MindManager @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-436] @Upd_Qase
Scenario: Check_that_user_can_not_copy_image_via_context_menu_with_multiple_image_selected
	When User selects images from first 'ImageTopic1' and second 'ImageTopic3' topic on Canvas
	And User right clicks on image in 'ImageTopic1' topic on Canvas
	Then 'topic-contextmenu' Menu is displayed to User
	And button with 'copy-image' name is not displayed in 'topic-contextmenu' menu
	
@MindManager @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-437] @Upd_Qase
Scenario: Check_that_user_can_paste_image_via_context_menu
	When User clicks 'ImageTopic2' topic on Canvas
	And User Right clicks on 'ImageTopic2' topic
	Then 'ImageTopic2' is outlined with a blue circuit
	And image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic2' topic on Canvas
	And button with 'paste-image' name is not displayed in 'topic-contextmenu' menu
	When User right clicks on image in 'ImageTopic1' topic on Canvas
	And User clicks button with 'copy-image' name in 'topic-contextmenu' menu
	And User Right clicks on 'ImageTopic2' topic
	Then button with 'paste-image' name is displayed in 'topic-contextmenu' menu
	When User clicks button with 'paste-image' name in 'topic-contextmenu' menu
	Then image in topiсs 'ImageTopic2' and 'ImageTopic1' are same
	When User Right clicks on 'ImageTopic3' topic
	Then button with 'paste-image' name is displayed in 'topic-contextmenu' menu
	When User clicks button with 'paste-image' name in 'topic-contextmenu' menu
	Then image in topiсs 'ImageTopic3' and 'ImageTopic2' are same

@MindManager @StandardImage @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-438] @Upd_Qase
Scenario: Check_that_user_can_replace_image_via_context_menu
	When User right clicks on image in 'ImageTopic1' topic on Canvas
	Then 'ImageTopic2' is outlined with a blue circuit
	And image border is highlighted in 'rgb(62, 158, 255)' color with '1' opacity in 'ImageTopic2' topic on Canvas
	When User clicks button with 'copy-image' name in 'topic-contextmenu' menu
	And User Right clicks on 'ImageTopic3' topic
	And User clicks button with 'paste-image' name in 'topic-contextmenu' menu
	Then image in topiсs 'ImageTopic3' and 'ImageTopic1' are same