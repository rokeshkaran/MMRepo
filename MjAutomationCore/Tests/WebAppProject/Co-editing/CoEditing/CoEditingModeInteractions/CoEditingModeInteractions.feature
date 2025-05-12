@retry(2)
Feature: CoEditingModeInteractions
	Check co-editing mode interactions

	Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath         |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then User set zoom level to '36' via the side tool bar

@MindManager @Co_Editing @Co_editing_mode_interactions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-229] @Health_Check @Upd_Qase
Scenario: Verify_that_it_is_possible_to_see_cursor_of_active_editor
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks on text in the 'FT' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	#User A Actions
	When User switches to '0' browser
	Then 'FT' topic is highlighted with CoEditing frame on Canvas
	Then User 'MM_Tests_1' is displayed on 'FT' topic CoEditing frame on Canvas 
	Then coeditor cursor is displayed on Canvas
	When User waits '5000' miliseconds
	Then coeditor cursor is not displayed on Canvas

@MindManager @Co_Editing @Co_editing_mode_interactions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-230] @Upd_Qase 
Scenario: Verify_that_coediting_overlay_is_displayed_when_coediting_session_happens
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks on text in the 'FT' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	#User A Actions
	When User switches to '0' browser
	Then Overlay panel is displayed
	When User clicks on 'coedit' button on the Overlay panel
	Then 'coedit' dropdown menu is displayed to User
	Then button with 'Co-editing enabled' name is displayed in 'coedit' menu

@MindManager @Co_Editing @Co_editing_mode_interactions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-231] @Upd_Qase
Scenario: Verify_that_coediting_user_can_see_the_participant_editing_the_file
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '21' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	#User A Actions
	When User switches to '0' browser
	Then Overlay panel is displayed
	When User clicks on 'coedit' button on the Overlay panel
	Then 'coedit' dropdown menu is displayed to User
	When User clicks button with 'View Participants (2)' name in 'coedit' menu
	Then 'PanelByName' side panel with 'Participants' header is displayed to the User
	Then 'You' participant is displayed in 'Editors' section of 'PanelByName' side panel with 'Participants' header
	Then 'MM_Tests_21' participant is displayed in 'Waiting to Edit' section of 'PanelByName' side panel with 'Participants' header
	When User mouse over 'info' item on 'Waiting to Edit' section of 'PanelByName' side panel with 'Participants' header
	Then 'These users are waiting to edit until there are no other editors because their license does not include co-editing.' tooltip is displayed to the User

@MindManager @Co_Editing @Co_editing_mode_interactions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-232] @Upd_Qase @JIRA[MMCV-8786] @Build_23.0.104
Scenario: Verify_that_it_is_possible_to_edit_topic_and_parent_if_it_is_selected_by_other_user
#To implement Step 7 from test case after bug fix
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks on text in the '12345' topic on Canvas
	#User A Actions
	When User switches to '0' browser
	Then '12345' topic is highlighted with CoEditing frame on Canvas
	Then User 'MM_Tests_1' is displayed on '12345' topic CoEditing frame on Canvas 
	Then coeditor cursor is displayed on Canvas
	When User clicks on text in the '12345' topic on Canvas
	Then lock icon is displayed on '12345' topic CoEditing frame on Canvas
	Then 'left' quick add button is displayed on '12345' topic CoEditing frame on Canvas 
	Then text editor is not displayed in 'TextEditorPopup' container
	When User clicks on text in the 'CT' topic on Canvas
	When User clicks 'Delete' button on Tools panel
	Then 'CT' topic is displayed on Canvas

@MindManager @Co_Editing @Co_editing_mode_interactions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-233] @Upd_Qase
Scenario: Verify_that_it_is_possible_add_subtopic_via_quick_add_buttons_on_locked_topic
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks on text in the '12345' topic on Canvas
	#User A Actions
	When User switches to '0' browser
	Then '12345' topic is highlighted with CoEditing frame on Canvas
	Then User 'MM_Tests_1' is displayed on '12345' topic CoEditing frame on Canvas 
	Then coeditor cursor is displayed on Canvas
	When User clicks on text in the '12345' topic on Canvas
	Then lock icon is displayed on '12345' topic CoEditing frame on Canvas
	When User clicks 'left' quick add button on '12345' topic CoEditing frame on Canvas
	Then 'Subtopic' subtopic is displayed on Canvas

@MindManager @Co_Editing @Co_editing_mode_interactions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-233] @Upd_Qase
Scenario: Verify_that_it_is_possible_add_topic_via_tool_panel_on_locked_topic
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks on text in the '12345' topic on Canvas
	#User A Actions
	When User switches to '0' browser
	Then '12345' topic is highlighted with CoEditing frame on Canvas
	Then User 'MM_Tests_1' is displayed on '12345' topic CoEditing frame on Canvas
	Then coeditor cursor is displayed on Canvas
	When User clicks on text in the '12345' topic on Canvas
	Then lock icon is displayed on '12345' topic CoEditing frame on Canvas
	When User clicks 'Add topic' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas

@MindManager @Co_Editing @Co_editing_mode_interactions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-233] @Upd_Qase
Scenario: Verify_that_it_is_possible_add_subtopic_via_key_combination_on_locked_topic
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks on text in the '12345' topic on Canvas
	#User A Actions
	When User switches to '0' browser
	Then '12345' topic is highlighted with CoEditing frame on Canvas
	Then User 'MM_Tests_1' is displayed on '12345' topic CoEditing frame on Canvas 
	Then coeditor cursor is displayed on Canvas
	When User clicks on text in the '12345' topic on Canvas
	Then lock icon is displayed on '12345' topic CoEditing frame on Canvas
	When User presses the Ctrl_Enter combination key on the keyboard
	Then 'Subtopic' subtopic is displayed on Canvas

@MindManager @Co_Editing @Co_editing_mode_interactions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-233] @Upd_Qase
Scenario: Verify_that_it_is_possible_add_relation_via_toolbar_on_locked_topic
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks on text in the '12345' topic on Canvas
	#User A Actions
	When User switches to '0' browser
	Then '12345' topic is highlighted with CoEditing frame on Canvas
	Then User 'MM_Tests_1' is displayed on '12345' topic CoEditing frame on Canvas
	Then coeditor cursor is displayed on Canvas
	When User clicks on text in the '12345' topic on Canvas
	Then lock icon is displayed on '12345' topic CoEditing frame on Canvas
	When User clicks 'Add relationship' button on Tools panel
	When User moves cursor by '-10' '-10' coordinates on Canvas
	Then relationship icon is displayed on Canvas
	When User clicks 'ImageTopic1' topic on Canvas
	Then '1' relationship lines are displayed on Canvas

@MindManager @Co_Editing @Co_editing_mode_interactions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-233] @Upd_Qase
Scenario: Verify_that_it_is_possible_add_boundary_on_locked_topic
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks on text in the '12345' topic on Canvas
	#User A Actions
	When User switches to '0' browser
	Then '12345' topic is highlighted with CoEditing frame on Canvas
	Then User 'MM_Tests_1' is displayed on '12345' topic CoEditing frame on Canvas
	Then coeditor cursor is displayed on Canvas
	When User clicks on text in the '12345' topic on Canvas
	Then lock icon is displayed on '12345' topic CoEditing frame on Canvas
	When User clicks 'Add boundary' button on Tools panel
	Then '12345' topic is located in boundary on Canvas

@MindManager @Co_Editing @Co_editing_mode_interactions @App_QA @App_Staging @Cleanup @App_Prod @Qase[WEB-233] @Upd_Qase
Scenario: Verify_that_it_is_possible_add_callout_on_locked_topic
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks on text in the '12345' topic on Canvas
	#User A Actions
	When User switches to '0' browser
	Then '12345' topic is highlighted with CoEditing frame on Canvas
	Then User 'MM_Tests_1' is displayed on '12345' topic CoEditing frame on Canvas 
	When User clicks on text in the '12345' topic on Canvas
	Then lock icon is displayed on '12345' topic CoEditing frame on Canvas
	When User clicks 'Add callout' button on Tools panel
	Then 'Callout' callout is displayed on Canvas

@MindManager @Co_Editing @Co_editing_mode_interactions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-234] @Upd_Qase
Scenario: Verify_that_a_user_can_saved_changes_during_coediting_session
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks on text in the '12345' topic on Canvas
	#User A Actions
	When User switches to '0' browser
	Then '12345' topic is highlighted with CoEditing frame on Canvas
	When User clicks on text in the '12345' topic on Canvas
	When User clicks 'Add callout' button on Tools panel
	Then 'Callout' callout is displayed on Canvas
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User clicks button with 'save' name in 'file' menu
	When User waits '3000' miliseconds
	Then menu button with 'save' name is displayed in 'saved' state on Overlay panel
	When User clicks Logo image on Menu toolbar
	When User clicks 'My Files' tab on file manager header page
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then 'Callout' callout is displayed on Canvas

@MindManager @Co_Editing @Co_editing_mode_interactions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-236] @Upd_Qase @JIRA[MMCV-8798]
Scenario: Verify_that_user_will_be_warn_changes_are_too_large
	#User B logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	#User A Actions
	When User switches to '0' browser
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	When User uploads 'ice_video_20190806-124540.webm' file through 'add-attachment-input' input
	Then text 'The maximum attachment size is 10MB, please try again with a smaller attachment.' displayed in 'flash-message' dialog
	When User clicks close button in 'flash-message' dialog
	When User waits '1000' miliseconds
	When User clicks 'ImageTopic2' topic on Canvas
	When User clicks 'Image' button of side Toolbox
	When User adds '15mbImage.jpg' image via 'PanelByName' side panel with 'Image' header
	Then text 'The maximum attachment size is 10MB, please try again with a smaller attachment.' displayed in 'flash-message' dialog
	Then image is not displayed in 'ImageTopic2' topiс on Canvas