@retry(2)
Feature: EditFromContextMenu
Verify the can be edited via context menu

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @EditMode @EditFromContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-321,WEB-253] @Upd_Qase
Scenario: Verify_that_task_progress_can_be_edited_via_context_menu
	When User Right clicks '50% done' icon in 'MT2' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User clicks icon button with '75% done' name in 'topic-contextmenu' menu
	Then '75% done' Icon is displayed to the 'MT2' Topic
	When User clicks '75% done' icon in 'MT2' topic
	Then 'Task done' Icon is displayed to the 'MT2' Topic

@MindManager @EditMode @EditFromContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-322] @Upd_Qase
Scenario: Verify_that_task_priority_can_be_edited_via_context_menu
	When User Right clicks 'Priority 2' icon in 'MT2' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User clicks icon button with 'Priority 3' name in 'topic-contextmenu' menu
	Then 'Priority 3' Icon is displayed to the 'MT2' Topic
	When User clicks 'Priority 3' icon in 'MT2' topic
	Then 'Priority 4' Icon is displayed to the 'MT2' Topic

@MindManager @EditMode @EditFromContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-323] @Upd_Qase
Scenario: Verify_that_icons_can_be_edited_via_context_menu
	When User Right clicks 'Happy' icon in 'MT2' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User clicks icon button with 'Neutral' name in 'topic-contextmenu' menu
	Then 'Neutral' Icon is displayed to the 'MT2' Topic
	When User Right clicks 'Yes' icon in 'MT2' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User clicks icon button with 'Discuss' name in 'topic-contextmenu' menu
	Then 'Discuss' Icon is displayed to the 'MT2' Topic
	When User Right clicks 'Up' icon in 'MT2' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User clicks icon button with 'Right' name in 'topic-contextmenu' menu
	Then 'Right' Icon is displayed to the 'MT2' Topic
	When User Right clicks 'Pro' icon in 'MT2' topic
	Then 'topic-contextmenu' Menu is displayed to User
	Then Icons section 'joint-select-button-group' is not displayed in 'topic-contextmenu' menu

@MindManager @EditMode @EditFromContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-324] @Upd_Qase
Scenario: Verify_it_is_possible_to_edit_tag_color_if_tag_is_added_to_the_map
	When User Right clicks 'Doing' tags in 'MT3' topic infobox
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'tag-edit-color' name in 'topic-contextmenu' menu
	Then Color Picker window is displayed to User
	When User enters '#430404' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'Doing' Tag is displayed to the 'rgb(67, 4, 4)' color in 'MT3' topic infobox
	Then 'Doing' Tag text is displayed to the 'rgb(255, 255, 255)' color in 'MT3' topic infobox
	When User Right clicks 'Doing' tags in 'MT3' topic infobox
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'tag-edit-color' name in 'topic-contextmenu' menu
	Then Color Picker window is displayed to User
	When User enters '#e0f70d' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'Doing' Tag is displayed to the 'rgb(224, 247, 13)' color in 'MT3' topic infobox
	Then 'Doing' Tag text is displayed to the 'rgb(51, 51, 51)' color in 'MT3' topic infobox

@MindManager @EditMode @EditFromContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-325] @Upd_Qase
Scenario: Verify_it_is_possible_to_edit_resource_color_if_resource_is_added_to_the_map
	When User right clicks 'Resource #1' resource in 'MT3' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'resource-edit-color' name in 'topic-contextmenu' menu
	Then Color Picker window is displayed to User
	When User enters '#101b6f' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'Resource #1' resource is displayed to the 'rgb(16, 27, 111)' color in 'MT3' topic infobox
	Then 'Resource #1' Resource text is displayed to the 'rgb(255, 255, 255)' color in 'MT3' topic infobox
	When User right clicks 'Resource #1' resource in 'MT3' topic
	Then 'topic-contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'resource-edit-color' name in 'topic-contextmenu' menu
	Then Color Picker window is displayed to User
	When User enters '#10ec69' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'Resource #1' resource is displayed to the 'rgb(16, 236, 105)' color in 'MT3' topic infobox
	Then 'Resource #1' Resource text is displayed to the 'rgb(51, 51, 51)' color in 'MT3' topic infobox