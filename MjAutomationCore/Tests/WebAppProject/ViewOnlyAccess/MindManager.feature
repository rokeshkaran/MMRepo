@retry(2)
Feature: MindManager
Check View-only map UI for MindManager Files

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                 |
		| auto_test_SRND.mmap | CommentNoteProperty.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User waits for data loading
	When User clicks 'For QA Automation' folder
	When User clicks 'RuntimeData File' folder
	When User waits for data loading
	When User hovers on 'auto_test_SRND' file and clicks on 'share-icon' action button
	Then 'share-file-dialog' dialog is displayed to User
	When User waits for data loading
	When User clicks selectbox by label 'Anyone with the share link' in 'General access' section of 'share-file-dialog' dialog and selects 'can view' option from dropdown 'share-file-dialog-select'
	When User clicks 'Copy link' button in 'share-file-dialog' dialog
	Then value is copied to the clipboard

@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2722] @Cleanup @Upd_Qase @Build_24.1.104
Scenario: View_only_map_UI_position_of_top_menu_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	Then Side panel is displayed on the page
	Then Tools panel is displayed in 'top' side on page

@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2723,WEB-2729] @Cleanup @JIRA[MMCV-10445] @Upd_Qase @Build_24.1.104
Scenario: View_only_map_UI_Top_menu_buttons_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	Then menu button with 'file' name is displayed in 'ToolbarPageElement' container
	Then menu button with 'view' name is displayed in 'ToolbarPageElement' container
	Then menu button with 'advanced' name is displayed in 'ToolbarPageElement' container
	Then menu button with 'design' name is not displayed on 'ToolbarPageElement' container
	When Search button is displayed on Menu toolbar in Standard mode
	Then menu button with 'help' name is displayed in 'ToolbarPageElement' container

@MindManager @ViewOnlyAccess @MindManagerFiles @Co_Editing @App_QA @App_Staging @App_Prod @Qase[WEB-2722] @Cleanup @Upd_Qase @Build_24.1.104
Scenario: View_only_map_UI_Top_menu_buttons_MMFiles_in_coedit_session
	When User clicks 'Done' button in 'share-file-dialog' dialog
	When User clicks 'auto_test_SRND' file
	Then Web Editor page is displayed to the User
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar
	Then menu button with 'file' name is displayed in 'status-read-only' state on Overlay panel
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	Then menu button with 'file' name is displayed in 'ToolbarPageElement' container
	Then menu button with 'view' name is displayed in 'ToolbarPageElement' container
	Then menu button with 'design' name is not displayed on 'ToolbarPageElement' container
	When Search button is displayed on Menu toolbar in Standard mode
	Then menu button with 'help' name is displayed in 'ToolbarPageElement' container

@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2723] @Cleanup @Upd_Qase @Build_24.1.104
Scenario: Check_enabled_features_in_view_only_map_in_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User accepts Optanon cookies
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	Then 'Filter' button is displayed in 'enabled' state on side Toolbar
	Then 'Snap' button is displayed on side toolbox
	Then mini map icon is disabled on navigation panel
	When User clicks mini map button
	Then 'mini-map' navigation panel is displayed to User

@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2723] @Cleanup @Upd_Qase @Build_24.1.104
Scenario: Check_zoom_feature_in_view_only_map_in_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User accepts Optanon cookies
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	Then User set zoom level to '100' via the side tool bar
	Then map zoom is '100%' on the side tool box
	When User clicks Zoom Out button on zoom bar of side toolbox
	When User waits '500' miliseconds
	Then map zoom is '70%' on the side tool box
	When User clicks Zoom In button on zoom bar of side toolbox
	When User waits '500' miliseconds
	Then map zoom is '100%' on the side tool box
	
@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2724] @Snap_Cleanup @Cleanup @JIRA[MMCV-10450] @Upd_Qase @Build_24.1.104
Scenario: Check_Snap_feature_in_viewonly_mode_in_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When '1' User upload capture item via Api
		| Type | Source           | Text                    | Link                    | Note | Item |
		| link | MindManager Snap | automation_test_#1_SRND | https://www.google.com/ |      |      |
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	When User clicks 'CT' topic on Canvas
	Then Topic Border is highlight blue color in 'CT' topic on Canvas
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle        |
		| automation_test_#1_SRND |
	When User Right clicks capture item with 'automation_test_#1_SRND' title of Snap panel
	Then Snap context menu is displayed
	#Next step is to say that the user cannot send snap item to map
	Then following items are displayed in Snap Context Menu:
		| ItemTitle     |
		| Quick View    |
		| Share         |
		| Send to Trash |
	
@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2724] @Cleanup @Upd_Qase @Build_24.1.104
Scenario: Check_comment_feature_in_viewonly_mode_in_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	Then 'Comments' button is displayed in 'enabled' state on side Toolbar
	When User clicks Comment icon to the 'Topic B' topic infobox
	Then 'Comments' button is displayed in 'active' state on side Toolbar
	Then 'PanelPublished' side panel with 'Comments' header is displayed to the User
	Then 'comment-input' text area is not displayed to User
	Then Comment button is not displayed on Comments panel
	
@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2724] @Cleanup @JIRA[MMCV-10452] @Upd_Qase @Build_24.1.104
Scenario: Check_Notes_feature_in_viewonly_mode_in_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	Then 'Notes' button is displayed in 'disabled' state on side Toolbar
	When User clicks 'Topic C' topic on Canvas
	Then 'Notes' button is displayed in 'active' state on side Toolbar
	Then 'Note1' text is displayed on view only Notes panel
	When User clicks 'Notes' button of side Toolbox
	Then 'Notes' button is displayed in 'enabled' state on side Toolbar

@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2724] @Cleanup @JIRA[MMCV-10452] @Upd_Qase @Build_24.1.104
Scenario: Check_Property_feature_in_viewonly_mode_in_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	Then 'Properties' button is displayed in 'disabled' state on side Toolbar
	When User clicks 'Topic A' topic on Canvas
	Then 'Properties' button is displayed in 'active' state on side Toolbar
	Then '$120.00' value is displayed in 'Currency' property input field of 'PanelPublished' side panel with 'Properties' header
	Then 'Currency' property input field is disabled on 'PanelPublished' side panel with 'Properties' header
	When User clicks 'Properties' button of side Toolbox
	Then 'Properties' button is displayed in 'enabled' state on side Toolbar

@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2725,WEB-2732] @Cleanup @Upd_Qase @Build_24.1.104
Scenario: Check_that_disabled_features_arу_not_accessible_to_a_view_only_user_in_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	When User clicks 'Topic A' topic on Canvas
	Then Floating Toolbar is not displayed on Canvas
	Then '0' plus is displayed on border in topic
	#Add_Subtopic_via_Insert_key_on_the_keyboard
	When User presses the 'Insert' key on the keyboard
	Then 'Subtopic' topic is not displayed on Canvas
	Then 'Topic A' is outlined with a blue circuit
	#Add_Subtopic_via_Ctrl_Enter_combination_key_on_the_keyboard
	When User presses the Ctrl_Enter combination key on the keyboard
	Then 'Subtopic' topic is not displayed on Canvas
	Then 'Topic A' is outlined with a blue circuit
	#Add_sibling_topic_via_Shift_Enter_combination_key_on_the_keyboard
	When User presses the Shift_Enter combination key on the keyboard
	Then 'Subtopic' topic is not displayed on Canvas
	Then 'Topic A' is outlined with a blue circuit
	#Add_Topic_via_Enter_key_on_the_keyboard
	When User presses the 'Enter' key on the keyboard
	Then 'Subtopic' topic is not displayed on Canvas
	Then 'Topic A' is outlined with a blue circuit
	#Add_Insert_parent_topic_via_Ctrl_Shift_Insert_combination_key_on_the_keyboard
	When User presses and hold the 'Ctrl' key on the keyboard
	When User presses the Shift and 'Insert' key combination on the keyboard
	Then 'Main Topic' topic is not displayed on Canvas
	Then 'Topic A' is outlined with a blue circuit
	#Add_callout_topic_via_Ctrl_Shift_Enter_combination_key_on_the_keyboard
	When User presses the Ctrl_Shift_Enter combination key on the keyboard
	Then 'Callout' callout is not displayed on Canvas
	Then 'Topic A' is outlined with a blue circuit

@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2726] @Cleanup @Upd_Qase @Build_24.1.104
Scenario: Check_that_Snap_feature_is_not_available_in_topic_context_menu_to_a_view_only_user_in_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	When User Right clicks on 'CT' topic
	#Snap menu button is not displayed in menu
	Then following menu buttons are displayed in 'topic-contextmenu' menu
		| items                     |
		| Advanced topic formatting |

@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2726] @Cleanup @Upd_Qase @Build_24.1.104
Scenario: Check_icon_context_menu_to_a_view_only_user_in_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	When User Right clicks '25% done' icon in 'Topic D' topic
	Then following menu buttons are displayed in 'topic-contextmenu' menu
		| items                     |
		| Advanced topic formatting |
		| Quick Filter              |
	Then following buttons are displayed in 'topic-contextmenu' menu
		| items                       |
		| Show Info Card              |
		| Hide Icons                  |
		| Topic Info Display Settings |
		| Collapse Info On Topic      |

@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2726] @Cleanup @JIRA[MMCV-10465] @Upd_Qase @Build_24.1.104
Scenario: Check_topic_context_menu_to_a_view_only_user_in_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	When User Right clicks on 'CT' topic
	Then following menu buttons are displayed in 'topic-contextmenu' menu
		| items                     |
		| Advanced topic formatting |
	Then following buttons are displayed in 'topic-contextmenu' menu
		| items                       |
		| Show Info Card              |
		| Topic Info Display Settings |

@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2726] @Cleanup @JIRA[MMCV-10466] @Upd_Qase @Build_24.1.104
Scenario: Check_that_Staking_order_is_not_availabel_in_topic_context_menu_to_a_view_only_user_in_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	When User Right clicks on 'Card Mode' topic
	Then following menu buttons are displayed in 'topic-contextmenu' menu
		| items                     |
		| Advanced topic formatting |
	Then following buttons are displayed in 'topic-contextmenu' menu
		| items                       |
		| Show Info Card              |
		| Topic Info Display Settings |

@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2727] @Cleanup @Upd_Qase @Build_24.1.104
Scenario: Check_that_the_File_menu_options_are_limited_for_a_view_only_user_in_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	Then following buttons are displayed in 'file' menu
		| Button            |
		| New               |
		| Open              |
		| Print             |
		| Close             |
		| Rename            |
		| Give Us Feedback! |
	Then following menu buttons are displayed in 'file' menu
		| Button      |
		| Open Recent |
		| Save As     |
		| Settings    |
	Then Custom content 'joint-horizontal-separator' is displayed at the folowing number in 'file' menu
		| number |
		| 7      |
		| 9      |
	Then button with 'Rename' name is disabled in 'file' menu
	Then button with 'New' name is enabled in 'file' menu
	Then button with 'Open' name is enabled in 'file' menu
	Then button with 'Print' name is enabled in 'file' menu
	Then button with 'Close' name is enabled in 'file' menu
	Then button with 'Give Us Feedback!' name is enabled in 'file' menu

@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2728] @Cleanup @Upd_Qase @Build_24.1.104
Scenario: Check_that_the_Help_menu_options_are_limited_for_a_view_only_user_in_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'help' name in 'ToolbarPageElement' container
	Then 'help' Menu is displayed to User
	Then following buttons are displayed in 'help' menu
		| Button             |
		| Keyboard Shortcuts |
		| What's New         |

@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2731] @Cleanup @Upd_Qase @Build_24.1.104
Scenario: Check_Search_for_a_view_only_user_in_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	When User clicks Search button on Menu toolbar in Standard mode
	When User enters 'Topic' value in input filed on Search toolbar
	Then 'Topic' value is displayed in input filed on Search toolbar
	Then 'Topic A' topic text is highlighted 'yellow' color
	Then 'Topic A' is outlined with a blue circuit
	Then '1 of 4' label result is displayed on Search toolbar

@MindManager @ViewOnlyAccess @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2732] @Cleanup @JIRA[MMCV-10458] @Upd_Qase @Build_24.1.104
Scenario: Check_that_disabled_toolbar_are_visually_indicated_as_such_for_a_view_only_user_in_MMFiles
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	Then following buttons are displayed on the Top Toolbar:
		| buttons             |
		| Undo                |
		| Redo                |
		| Paste               |
		| Cut                 |
		| Copy                |
		| Format painter      |
		| Font format         |
		| Add topic           |
		| Add subtopic        |
		| Add floating topic  |
		| Add sticky note     |
		| Add callout         |
		| Add relationship    |
		| Add boundary        |
		| Topic Shape         |
		| Colors              |
		| Insert Shape        |
		| Insert Smart Shape  |
		| Insert Image        |
		| Insert Text Box     |
		| Set Default Style   |
		| Delete              |
		| Share               |
		| Tool Panel Settings |
	Then 'Undo' button is displayed as disabled on the Tools panel
	Then 'Redo' button is displayed as disabled on the Tools panel
	Then 'Paste' button is displayed as disabled on the Tools panel
	Then 'Cut' button is displayed as disabled on the Tools panel
	Then 'Copy' button is displayed as enabled on the Tools panel
	Then 'Format painter' button is displayed as disabled on the Tools panel
	Then 'Font format' button is displayed as disabled on the Tools panel
	Then 'Add topic' button is displayed as disabled on the Tools panel
	Then 'Add subtopic' button is displayed as disabled on the Tools panel
	Then 'Add floating topic' button is displayed as disabled on the Tools panel
	Then 'Add sticky note' button is displayed as disabled on the Tools panel
	Then 'Add callout' button is displayed as disabled on the Tools panel
	Then 'Add relationship' button is displayed as disabled on the Tools panel
	Then 'Add boundary' button is displayed as disabled on the Tools panel
	Then 'Topic Shape' button is displayed as disabled on the Tools panel
	Then 'Colors' button is displayed as disabled on the Tools panel
	Then 'Insert Shape' button is displayed as disabled on the Tools panel
	Then 'Insert Smart Shape' button is displayed as disabled on the Tools panel
	Then 'Insert Image' button is displayed as disabled on the Tools panel
	Then 'Insert Text Box' button is displayed as disabled on the Tools panel
	Then 'Set Default Style' button is displayed as disabled on the Tools panel
	Then 'Delete' button is displayed as disabled on the Tools panel
	Then 'Share' button is displayed as disabled on the Tools panel
	Then 'Tool Panel Settings' button is displayed as enabled on the Tools panel

@MindManager @ViewOnlyAccess @Co_Editing @MindManagerFiles @App_QA @App_Staging @App_Prod @Qase[WEB-2732] @Cleanup @Upd_Qase @Build_24.1.104
Scenario: Check_that_disabled_sidepane_are_visually_indicated_as_such_for_a_view_only_user_in_MMFiles
	When User clicks 'Done' button in 'share-file-dialog' dialog
	When User clicks 'auto_test_SRND' file
	Then Web Editor page is displayed to the User
	When User selects first 'Topic A' and second 'Topic B' and third 'Topic C' topic on Canvas
	When User clicks 'Delete' button on Tools panel
	When User clicks on the toolbar logo of Tools panel
	When User openes 'chrome' browser
	Given '1' User is logged into MindManager web app via Api
	When User opens link from clipboard in new browser tab
	When User clicks 'Web' button
	When User switches to '2' tab
	Then Web Editor page is displayed to the User
	Then Side panel is displayed on the page
	Then 'Filter' button is displayed in 'enabled' state on side Toolbar
	Then 'Task Information' button is displayed in 'disabled' state on side Toolbar
	Then 'Icons' button is displayed in 'disabled' state on side Toolbar
	Then 'Comments' button is displayed in 'disabled' state on side Toolbar
	Then 'Tags' button is displayed in 'disabled' state on side Toolbar
	Then 'Properties' button is displayed in 'disabled' state on side Toolbar
	Then 'Notes' button is displayed in 'disabled' state on side Toolbar
	Then 'Attachments & Links' button is displayed in 'disabled' state on side Toolbar
	Then 'Format Shape' button is displayed in 'disabled' state on side Toolbar
	Then 'Image' button is displayed in 'disabled' state on side Toolbar
	Then 'Snap' button is displayed in 'visible' state on side Toolbar