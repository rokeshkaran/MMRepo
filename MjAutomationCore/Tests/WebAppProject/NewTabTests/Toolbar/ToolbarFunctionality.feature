@retry(2)
Feature: ToolbarFunctionality
Check Toolbar functionality 

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then User set zoom level to '70' via the side tool bar

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1182] @Upd_Qase
Scenario: Check_Add_topic_button_functionality_on_toolbar
	When User clicks 'CT' topic on Canvas
	Then 'CT' is outlined with a blue circuit
	When User clicks 'Add topic' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas
	Then 'Main Topic' is outlined with a blue circuit
	When User clicks 'Delete' button on Tools panel
	Then 'Main Topic' topic is not displayed on Canvas
	When User clicks 'MT' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas
	Then 'Main Topic' is outlined with a blue circuit
	When User clicks 'Delete' button on Tools panel
	Then 'Main Topic' topic is not displayed on Canvas
	When User clicks 'MTST' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	Then 'Subtopic' topic is displayed on Canvas
	Then 'Subtopic' is outlined with a blue circuit
	When User clicks 'Delete' button on Tools panel
	Then 'Subtopic' topic is not displayed on Canvas
	When User clicks 'FT' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	Then 'Floating Topic' topic is displayed on Canvas
	Then 'Floating Topic' is outlined with a blue circuit

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1182] @Upd_Qase
Scenario: Check_Add_subtopic_button_functionality_on_toolbar
	When User clicks 'CT' topic on Canvas
	Then 'CT' is outlined with a blue circuit
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas
	Then 'Main Topic' is outlined with a blue circuit
	When User clicks 'Delete' button on Tools panel
	Then 'Main Topic' topic is not displayed on Canvas
	When User clicks 'MT' topic on Canvas
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Subtopic' topic is displayed on Canvas
	Then 'Subtopic' is outlined with a blue circuit
	When User clicks 'Delete' button on Tools panel
	When User clicks 'MTST' topic on Canvas
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Subtopic' topic is displayed on Canvas
	Then 'Subtopic' is outlined with a blue circuit
	When User clicks 'Delete' button on Tools panel
	When User clicks 'FT' topic on Canvas
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Subtopic' topic is displayed on Canvas
	Then 'Subtopic' is outlined with a blue circuit

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1182] @Upd_Qase
Scenario: Check_Add_floating_topic_button_functionality_on_toolbar
	When User clicks 'Add floating topic' button on Tools panel
	When User add floating topic by coordinates '100', '50' to the Canvas
	Then 'Floating Topic' topic is displayed on Canvas
	When User clicks 'Delete' button on Tools panel
	Then 'Floating Topic' topic is not displayed on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1182] @Upd_Qase
Scenario: Check_Add_callout_button_functionality_on_toolbar
	When User clicks 'MT' topic on Canvas
	Then 'MT' is outlined with a blue circuit
	When User clicks 'Add callout' button on Tools panel
	Then 'Callout' topic is displayed on Canvas
	Then 'Callout' is outlined with a blue circuit
	When User clicks 'Delete' button on Tools panel
	When User clicks 'MTST' topic on Canvas
	Then 'Callout' topic is not displayed on Canvas
	When User clicks 'Add callout' button on Tools panel
	Then 'Callout' topic is displayed on Canvas
	Then 'Callout' is outlined with a blue circuit
	When User clicks 'Delete' button on Tools panel
	When User clicks 'FT' topic on Canvas
	When User clicks 'Add callout' button on Tools panel
	Then 'Callout' topic is displayed on Canvas
	Then 'Callout' is outlined with a blue circuit
	When User clicks 'Delete' button on Tools panel
	When User clicks 'MTCO' topic on Canvas
	When User clicks 'Add callout' button on Tools panel
	Then 'Callout' topic is displayed on Canvas
	Then 'Callout' is outlined with a blue circuit
	When User clicks 'Delete' button on Tools panel
	When User clicks 'MTSTCO' topic on Canvas
	When User clicks 'Add callout' button on Tools panel
	Then 'Callout' topic is displayed on Canvas
	Then 'Callout' is outlined with a blue circuit
	When User clicks 'Delete' button on Tools panel
	When User clicks 'FTCO' topic on Canvas
	When User clicks 'Add callout' button on Tools panel
	Then 'Callout' topic is displayed on Canvas
	Then 'Callout' is outlined with a blue circuit
	When User clicks 'Delete' button on Tools panel
	Then 'Callout' topic is not displayed on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1183] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_the_relationship_to_the_topic_via_the_toolbar
	When User clicks 'MT' topic on Canvas
	Then 'MT' is outlined with a blue circuit
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'MT' topic on Canvas
	When User clicks 'FT' topic on Canvas
	Then '1' relationship lines are displayed on Canvas
	When User clicks by coordinates '100' and '50' on Canvas
	When User clicks '12345' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the '12345' topic on Canvas
	When User clicks 'MT' topic on Canvas
	Then '2' relationship lines are displayed on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1184] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_the_topic_boundary_from_the_toolbar
	When User clicks 'MT' topic on Canvas
	Then 'MT' is outlined with a blue circuit
	When User clicks 'Add subtopic' button on Tools panel
	When User clicks 'MTCO' topic on Canvas
	When User clicks 'MT' topic on Canvas
	When User clicks 'Add boundary' button on Tools panel
	Then 'MT' topic is located in boundary on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1185] @Upd_Qase
Scenario: Check_that_it_is_possible_to_Undo_and_Redo_changes_via_Toolbar
	When User clicks 'MT' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas
	Then 'Undo' button is displayed as enabled on the Tools panel
	When User clicks 'Undo' button on Tools panel
	Then 'Undo' button is displayed as disabled on the Tools panel
	Then 'Main Topic' topic is not displayed on Canvas
	When User clicks 'Redo' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1185] @Upd_Qase
Scenario: Check_that_it_is_possible_to_undo_and_redo_changes_using_hotkeys
	When User clicks 'MT' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas
	When User presses the Ctrl_Z combination key on the keyboard
	Then 'Main Topic' topic is not displayed on Canvas
	Then 'Undo' button is displayed as disabled on the Tools panel
	When User presses the Ctrl_Y combination key on the keyboard
	Then 'Main Topic' topic is displayed on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1187] @Upd_Qase
Scenario: Check_the_possibility_to_change_the_Central_topic_shape
	When User clicks 'CT' topic on Canvas
	Then 'CT' is outlined with a blue circuit
	When User clicks 'Topic Shape' button on Tools panel
	Then following items is displayed in 'toolpanel' dropdown menu
		| item               |
		| Rounded Rectangle  |
		| Rectangle          |
		| Line               |
		| No Line            |
		| Hexagon            |
		| Octagon            |
		| Oval               |
		| Circle             |
		| Capsule            |
		| Diamond            |
		| Data               |
		| Database           |
		| Predefined Process |
		| Document           |
	Then 'Rounded Rectangle' item is displayed as selected in 'toolpanel' dropdown menu
	When User clicks 'Circle' item in 'toolpanel' dropdown menu
	Then 'CT' is outlined with a blue circuit
	Then 'CT' topic is assigned 'circle' shape on Canvas
	When User clicks 'Topic Shape' button on Tools panel
	Then following items is displayed in 'toolpanel' dropdown menu
		| item               |
		| Rounded Rectangle  |
		| Rectangle          |
		| Line               |
		| No Line            |
		| Hexagon            |
		| Octagon            |
		| Oval               |
		| Circle             |
		| Capsule            |
		| Diamond            |
		| Data               |
		| Database           |
		| Predefined Process |
		| Document           |
	Then 'Circle' item is displayed as selected in 'toolpanel' dropdown menu
	When User clicks 'Rectangle' item in 'toolpanel' dropdown menu
	Then 'CT' topic is assigned 'rectangle' shape on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1187] @Upd_Qase
Scenario: Check_the_possibility_to_change_the_added_Topic_shape
	When User clicks 'MT' topic on Canvas
	When User clicks 'Topic Shape' button on Tools panel
	Then 'Capsule' item is displayed as selected in 'toolpanel' dropdown menu
	When User clicks 'Hexagon' item in 'toolpanel' dropdown menu
	Then 'MT' topic is assigned 'hexagon' shape on Canvas
	When User clicks 'Topic Shape' button on Tools panel
	When User clicks 'Diamond' item in 'toolpanel' dropdown menu
	Then 'MT' topic is assigned 'diamond' shape on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1187] @Upd_Qase
Scenario: Check_the_possibility_to_change_the_added_Subtopic_shape
	When User clicks 'MTST' topic on Canvas
	When User clicks 'Topic Shape' button on Tools panel
	Then 'Line' item is displayed as selected in 'toolpanel' dropdown menu
	When User clicks 'Predefined Process' item in 'toolpanel' dropdown menu
	Then 'MTST' topic is assigned 'predefined-process' shape on Canvas
	When User clicks 'Topic Shape' button on Tools panel
	When User clicks 'Circle' item in 'toolpanel' dropdown menu
	Then 'MTST' topic is assigned 'circle' shape on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1187] @Upd_Qase
Scenario: Check_the_possibility_to_change_the_added_Collout_shape
	When User clicks 'MTCO' topic on Canvas
	When User clicks 'Topic Shape' button on Tools panel
	Then 'Capsule' item is displayed as selected in 'toolpanel' dropdown menu
	When User clicks 'Data' item in 'toolpanel' dropdown menu
	Then 'MTCO' topic is assigned 'data' shape on Canvas
	When User clicks 'Topic Shape' button on Tools panel
	When User clicks 'Predefined Process' item in 'toolpanel' dropdown menu
	Then 'MTCO' topic is assigned 'predefined-process' shape on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1187] @Upd_Qase
Scenario: Check_the_possibility_to_change_the_added_floating_shape
	When User clicks 'FT' topic on Canvas
	When User clicks 'Topic Shape' button on Tools panel
	Then 'Capsule' item is displayed as selected in 'toolpanel' dropdown menu
	When User clicks 'Database' item in 'toolpanel' dropdown menu
	Then 'FT' topic is assigned 'database' shape on Canvas
	When User clicks 'Topic Shape' button on Tools panel
	When User clicks 'Document' item in 'toolpanel' dropdown menu
	Then 'FT' topic is assigned 'document' shape on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1187] @Upd_Qase
Scenario: Check_the_possibility_to_change_multiple_topics_shape
	When User selects first 'MT' and second 'FT' topic on Canvas
	Then 'MT' is outlined with a blue circuit
	Then 'FT' is outlined with a blue circuit
	When User clicks 'Topic Shape' button on Tools panel
	Then following items is displayed in 'toolpanel' dropdown menu
		| item               |
		| Rounded Rectangle  |
		| Rectangle          |
		| Line               |
		| No Line            |
		| Hexagon            |
		| Octagon            |
		| Oval               |
		| Circle             |
		| Capsule            |
		| Diamond            |
		| Data               |
		| Database           |
		| Predefined Process |
		| Document           |
	When User clicks 'Circle' item in 'toolpanel' dropdown menu
	Then 'MT' topic is assigned 'circle' shape on Canvas
	Then 'FT' topic is assigned 'circle' shape on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1188] @Upd_Qase
Scenario: Check_the_user_is_able_to_change_Central_topic_fill_color
	When User clicks 'CT' topic on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'CT' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'CT' is outlined with a blue circuit
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	Then Colour Hex code '#137a0c' is displayed on Hex Code Color Picker
	Then checkbox with color 'rgb(19, 122, 12)' is displayed in palette container on Color picker

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @App_Prod @Cleanup @Qase[WEB-1188] @Upd_Qase
Scenario: Check_the_user_is_able_to_change_Main_topic_fill_color
	When User clicks 'MT' topic on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'MT' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'MT' is outlined with a blue circuit
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	Then Colour Hex code '#137a0c' is displayed on Hex Code Color Picker
	Then checkbox with color 'rgb(19, 122, 12)' is displayed in palette container on Color picker

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @App_Prod @Cleanup @Qase[WEB-1188] @Upd_Qase
Scenario: Check_the_user_is_able_to_change_floating_topic_fill_color
	When User clicks 'FT' topic on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'FT' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'FT' is outlined with a blue circuit
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	Then Colour Hex code '#137a0c' is displayed on Hex Code Color Picker
	Then checkbox with color 'rgb(19, 122, 12)' is displayed in palette container on Color picker

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @App_Prod @Cleanup @Qase[WEB-1188] @Upd_Qase
Scenario: Check_the_user_is_able_to_change_subtopic_fill_color
	When User clicks '2378' topic on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then '2378' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then '2378' is outlined with a blue circuit
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	Then Colour Hex code '#137a0c' is displayed on Hex Code Color Picker
	Then checkbox with color 'rgb(19, 122, 12)' is displayed in palette container on Color picker

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @App_Prod @Cleanup @Qase[WEB-1188] @Upd_Qase
Scenario: Check_the_user_is_able_to_change_callout_fill_color
	When User clicks 'MTCO' topic on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'MTCO' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'MTCO' is outlined with a blue circuit
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	Then Colour Hex code '#137a0c' is displayed on Hex Code Color Picker
	Then checkbox with color 'rgb(19, 122, 12)' is displayed in palette container on Color picker

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @App_Prod @Cleanup @Qase[WEB-1188] @Upd_Qase
Scenario: Check_the_user_is_able_to_change_multiple_topics_fill_color
	When User selects first 'FT' and second '12345' topic on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'FT' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'FT' is outlined with a blue circuit
	Then '12345' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then '12345' is outlined with a blue circuit
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	Then Colour Hex code '#137a0c' is displayed on Hex Code Color Picker
	Then checkbox with color 'rgb(19, 122, 12)' is displayed in palette container on Color picker

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1189] @Upd_Qase
Scenario: Check_that_Font_Format_button_opens_Design_side_menu
	When User clicks 'MT' topic on Canvas
	When User clicks 'Font format' button on Tools panel
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Text' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as collapsed of 'PanelByName' side panel with 'Design' header
	Then 'Theme' section is displayed as collapsed of 'PanelByName' side panel with 'Design' header
	When User clicks Close button of 'PanelByName' side panel with 'Design' header
	Then 'PanelByName' side panel with 'Design' header is not displayed to the User
	When User clicks on the Body on Canvas
	When User selects first 'MTCO' and second 'FT' topic on Canvas
	When User clicks 'Font format' button on Tools panel
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Text' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as collapsed of 'PanelByName' side panel with 'Design' header
	Then 'Theme' section is displayed as collapsed of 'PanelByName' side panel with 'Design' header

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1190] @Upd_Qase @JIRA[MMCV-9156,MMCV-9693]
Scenario: Check_that_it_is_possible_to_share_the_map_via_the_toolbar
	When User clicks 'FT' topic on Canvas
	When User clicks 'Share' button on Tools panel
	Then following buttons are displayed in 'share-contextmenu' menu
		| items            |
		| Copy Link        |
		| Publish          |
		| About Publishing |
	Then following menu buttons are displayed in 'share-contextmenu' menu
		| items  |
		| Export |
	When User clicks button with 'publish' name in 'share-contextmenu' menu
	Then header 'Publish Complete!' is displayed on page
	When User clicks on the 'Copy Link' button and opens in a new browser tab
	When User switches to '1' tab
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then Web Editor page is displayed to the User
	When User close Active tab
	When User switches to '0' tab
	Then header 'Publish Complete!' is displayed on page
	When User clicks 'Done' button on the page
	Then 'FT' is outlined with a blue circuit
	When User clicks 'Add topic' button on Tools panel
	Then 'Floating Topic' topic is displayed on Canvas
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'Publish Update' name in 'share-contextmenu' menu
	Then header 'Update Complete!' is displayed on page
	When User open new tab in browser
	When User opens published file with 'auto_test_SRND.mmap' name in browser via Api
	Then 'auto_test_SRND.mmap' publish file is open to User
	Then 'Floating Topic' topic is displayed on Canvas
	When User close Active tab
	When User switches to '0' tab
	When User clicks 'Done' button on the page
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'Unpublish' name in 'share-contextmenu' menu
	Then header 'Un-publish Complete!' is displayed on page
	When User clicks 'Done' button on the page
	Then published file with 'auto_test_SRND' name does not exist via Api
	When User clicks 'Share' button on Tools panel
	When User mouse hovers menu button with 'export' name in 'share-contextmenu' menu
	Then following buttons are displayed in 'export' menu
		| Button             |
		| Download as HTML 5 |
		| Download as MMAP   |
	When User clicks button with 'export-mmap' name in 'export' menu
	Then User checks that file 'auto_test_SRND.mmap' was downloaded

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_topic
	When User clicks 'MT' topic on Canvas
	Then 'MT' is outlined with a blue circuit
	When User clicks 'Add topic' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas
	When User clicks 'Undo' button on Tools panel
	Then 'Main Topic' topic is not displayed on Canvas
	When User clicks 'Redo' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_priority_icon
	When User clicks 'MT' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	When User clicks 'Priority 3' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 3' Icon is displayed to the 'MT' Topic
	When User clicks 'Undo' button on Tools panel
	Then 'Priority 3' Icon is not displayed to the 'MT' Topic
	When User clicks 'Redo' button on Tools panel
	Then 'Priority 3' Icon is displayed to the 'MT' Topic

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_progress_icon
	When User clicks 'FT' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	When User clicks '50% done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '50% done' Icon is displayed to the 'FT' Topic
	When User clicks 'Undo' button on Tools panel
	Then '50% done' Icon is not displayed to the 'FT' Topic
	When User clicks 'Redo' button on Tools panel
	Then '50% done' Icon is displayed to the 'FT' Topic

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_start_date
	When User clicks 'MT' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then 'D(0)' date is displayed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header ignore weekend
	Then 'D(0)' Start date is displayed to the 'MT' topic infobox ignore weekend
	When User clicks 'Undo' button on Tools panel
	Then 'D(0)' Start date is not displayed to the 'MT' topic infobox
	When User clicks 'Redo' button on Tools panel
	Then 'D(0)' Start date is displayed to the 'MT' topic infobox ignore weekend

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_due_date
	When User clicks 'MTSTCO' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	When User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then 'D(0)' date is displayed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header ignore weekend
	Then 'D(0)' Due date is displayed to the 'MTSTCO' topic infobox ignore weekend
	When User clicks 'Undo' button on Tools panel
	Then 'D(0)' Due date is not displayed to the 'MTSTCO' topic infobox
	When User clicks 'Redo' button on Tools panel
	Then 'D(0)' Due date is displayed to the 'MTSTCO' topic infobox ignore weekend

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_resource
	When User clicks 'MT' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	When User enter 'Resource#1' value in the 'Resources' field of 'Task Information' panel
	When User presses the 'Enter' key on the keyboard
	Then 'Resource#1' resource is displayed in 'MT' topic
	When User clicks 'Undo' button on Tools panel
	Then 'Resource#1' resource is not displayed in 'MT' topic
	When User clicks 'Redo' button on Tools panel
	Then 'Resource#1' resource is displayed in 'MT' topic

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_icon
	When User clicks 'FTCO' topic on Canvas
	When User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	When User clicks 'Attention' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Attention' Icon is displayed to the 'FTCO' Topic
	When User clicks 'Undo' button on Tools panel
	Then 'Attention' Icon is not displayed to the 'FTCO' Topic
	When User clicks 'Redo' button on Tools panel
	Then 'Attention' Icon is displayed to the 'FTCO' Topic

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_comment
	When User clicks 'MTST' topic on Canvas
	When User clicks 'Comments' button of side Toolbox
	When User enters 'Check User can undo and redo comment' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then Comment icon is displayed to the 'MTST' topic infobox
	When User clicks 'Undo' button on Tools panel
	Then Comment icon is not displayed to the 'MTST' topic infobox
	When User clicks 'Redo' button on Tools panel
	Then Comment icon is displayed to the 'MTST' topic infobox

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_tag
	When User clicks 'MT' topic on Canvas
	When User clicks 'Tags' button of side Toolbox
	When User clicks 'Done' item in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	Then 'Done' tag is displayed in 'MT' topic infobox
	When User clicks 'Undo' button on Tools panel
	Then 'Done' tag is not displayed in 'MT' topic infobox
	When User clicks 'Redo' button on Tools panel
	Then 'Done' tag is displayed in 'MT' topic infobox

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_note
	When User clicks 'FT' topic on Canvas
	When User clicks 'Notes' button of side Toolbox
	When User enters 'notes for automation test' text to input note field on Notes panel
	When User clicks by coordinates '-500' and '100' on Canvas
	Then Notes icon is displayed to the 'FT' topic infobox
	When User clicks 'Undo' button on Tools panel
	Then Notes icon is not displayed to the 'FT' topic infobox
	When User clicks 'Redo' button on Tools panel
	Then Notes icon is displayed to the 'FT' topic infobox

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_link
	When User clicks 'MT' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Attachments & Links' header  and select 'Add Link' item in 'attachments-add-popup' dropdown
	Then Add Link panel is displayed to the User
	When User enters 'https://www.facebook.com/' in the 'url' field
	When User enters 'Facebook' in the 'title' field
	When User clicks 'Add' footer button on Add Link panel
	Then Links icon is displayed to the 'MT' topic infobox
	When User clicks 'Undo' button on Tools panel
	Then Links icon is not displayed to the 'MT' topic infobox
	When User clicks 'Redo' button on Tools panel
	Then Links icon is displayed to the 'MT' topic infobox

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_attachment
	When User clicks 'MT' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	When User uploads 'FruitImages.jpg' file through 'add-attachment-input' input
	Then Attachment icon is displayed to the 'MT' topic infobox
	When User clicks 'Undo' button on Tools panel
	Then Attachment icon is not displayed to the 'MT' topic infobox
	When User clicks 'Redo' button on Tools panel
	Then Attachment icon is displayed to the 'MT' topic infobox

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_relationship
	When User clicks 'MT' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'MT' topic on Canvas
	When User clicks 'FT' topic on Canvas
	Then '1' relationship lines are displayed on Canvas
	When User clicks 'Undo' button on Tools panel
	Then relationship is not displayed on the Canvas
	When User clicks 'Redo' button on Tools panel
	Then '1' relationship lines are displayed on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_callout
	When User clicks 'FTCO' topic on Canvas
	When User clicks 'Add callout' button on Tools panel
	Then 'Callout' callout is displayed on Canvas
	When User clicks 'Undo' button on Tools panel
	Then 'Callout' callout is not displayed on Canvas
	When User clicks 'Redo' button on Tools panel
	Then 'Callout' callout is displayed on Canvas
	
@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_boundary
	When User clicks 'MT' topic on Canvas
	When User clicks 'Add boundary' button on Tools panel
	Then 'MT' topic is located in boundary on Canvas
	When User clicks 'Undo' button on Tools panel
	Then 'MT' topic is not located in boundary on Canvas
	When User clicks 'Redo' button on Tools panel
	Then 'MT' topic is located in boundary on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_topic_shape
	When User clicks 'MT' topic on Canvas
	When User clicks 'Topic Shape' button on Tools panel
	When User clicks 'Oval' item in 'toolpanel' dropdown menu
	Then 'MT' topic is assigned 'oval' shape on Canvas
	When User clicks 'Undo' button on Tools panel
	Then 'MT' topic is assigned 'capsule-legacy' shape on Canvas
	When User clicks 'Redo' button on Tools panel
	Then 'MT' topic is assigned 'oval' shape on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_text
	When User clicks 'CT' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	When User clicks on text in the 'Main Topic' topic on Canvas
	When User enters 'New topic' text to the topic on Canvas
	Then text 'New topic' is displayed to the topic on Canvas
	When User clicks 'Undo' button on Tools panel
	Then text 'Main Topic' is displayed to the topic on Canvas
	When User clicks 'Redo' button on Tools panel
	Then text 'New topic' is displayed to the topic on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_text_style_color
	When User clicks 'CT' topic on Canvas
	When User clicks on text in the 'CT' topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	When User clicks on the Body on Canvas
	Then 'CT' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	When User clicks 'Undo' button on Tools panel
	Then 'CT' topic text has 'rgba(0, 0, 0, 1)' color on Canvas
	When User clicks 'Redo' button on Tools panel
	Then 'CT' topic text has 'rgba(244, 177, 16, 1)' color on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase @JIRA[MMCV-9794]
Scenario: User_can_undo_and_redo_text_style_size
	Then User set zoom level to '32' via the side tool bar
	When User clicks 'MTSTCO' topic on Canvas
	When User clicks on text in the 'MTSTCO' topic on Canvas
	Then text 'MTSTCO' is displayed to the topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font size section in text editor and selects '26' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	Then 'MTSTCO' topic text has '34.666' size
	When User clicks 'Undo' button on Tools panel
	Then 'MTSTCO' topic text has '13.333' size
	When User clicks 'Redo' button on Tools panel
	Then 'MTSTCO' topic text has '34.666' size

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_text_style_font
	When User clicks 'MTSTCO' topic on Canvas
	When User clicks on text in the 'MTSTCO' topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'MTSTCO' topic text is displayed  'Times New Roman' in font
	When User clicks 'Undo' button on Tools panel
	Then 'MTSTCO' topic text is displayed  '"Segoe UI", "Source Sans Pro"' in font
	When User clicks 'Redo' button on Tools panel
	Then 'MTSTCO' topic text is displayed  'Times New Roman' in font

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_text_style_bold
	When User clicks 'MTCO' topic on Canvas
	When User clicks on text in the 'MTCO' topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	Then 'bold' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'MTCO' topic text is displayed 'bold' style
	When User clicks 'Undo' button on Tools panel
	Then 'MTCO' topic text is displayed 'normal' style
	When User clicks 'Redo' button on Tools panel
	Then 'MTCO' topic text is displayed 'bold' style

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_text_style_align
	When User clicks 'FT' topic on Canvas
	When User clicks on text in the 'FT' topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks align icon in text editor and selects 'right' option in 'text-alignment' selectbox in 'TextEditorPopup' container
	Then 'right' align option is selected in text editor in 'TextEditorPopup' container
	When User clicks by coordinates '100' and '100' on Canvas
	Then 'FT' topic text is aligned 'right'
	When User clicks 'Undo' button on Tools panel
	Then 'FT' topic text is aligned 'left'
	When User clicks 'Redo' button on Tools panel
	Then 'FT' topic text is aligned 'right'

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase @JIRA[MMCV-9794]
Scenario: User_can_undo_and_redo_text_style
	Then User set zoom level to '32' via the side tool bar
	When User clicks 'FT' topic on Canvas
	When User clicks on text in the 'FT' topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	When User clicks on the Body on Canvas
	Then 'FT' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	When User clicks 'FT' topic on Canvas
	When User clicks on text in the 'FT' topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks font size section in text editor and selects '26' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	Then 'FT' topic text has '34.666' size
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'FT' topic text is displayed  'Times New Roman' in font
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	Then 'bold' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'FT' topic text is displayed 'bold' style
	When User clicks align icon in text editor and selects 'right' option in 'text-alignment' selectbox in 'TextEditorPopup' container
	Then 'right' align option is selected in text editor in 'TextEditorPopup' container
	When User clicks by coordinates '100' and '100' on Canvas
	Then 'FT' topic text is aligned 'right'
	When User clicks 'Undo' button on Tools panel
	When User waits '500' miliseconds
	Then 'FT' topic text is aligned 'left'
	When User clicks 'Undo' button on Tools panel
	When User waits '500' miliseconds
	Then 'FT' topic text is displayed 'normal' style
	When User clicks 'Undo' button on Tools panel
	When User waits '500' miliseconds
	Then 'FT' topic text is displayed  '"Segoe UI", "Source Sans Pro"' in font
	When User clicks 'Undo' button on Tools panel
	When User waits '500' miliseconds
	Then 'FT' topic text has '16' size
	When User clicks 'Undo' button on Tools panel
	Then 'FT' topic text has 'rgba(0, 0, 0, 1)' color on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_delete_and_undo_and_redo_relationship
	When User clicks 'MT' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'MT' topic on Canvas
	When User clicks 'FT' topic on Canvas
	When User clicks 'Delete' button on Tools panel
	Then relationship is not displayed on the Canvas
	When User clicks 'Undo' button on Tools panel
	Then '1' relationship lines are displayed on Canvas
	When User clicks 'Redo' button on Tools panel
	Then relationship is not displayed on the Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_added_image
	When User clicks 'CT' topic on Canvas
	When User clicks 'Image' button of side Toolbox
	When User adds 'FruitsOutlineIcon.png' image via 'PanelByName' side panel with 'Image' header
	Then image is displayed in 'CT' topiс on Canvas
	When User clicks 'Undo' button on Tools panel
	Then image is not displayed in 'CT' topiс on Canvas
	When User clicks 'Redo' button on Tools panel
	Then image is displayed in 'CT' topiс on Canvas

@MindManager @Toolbar @Toolbar_Functionality @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1186] @Upd_Qase
Scenario: User_can_undo_and_redo_created_floating_topics
	When User clicks 'MT' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas
	When User clicks on text in the 'Main Topic' topic on Canvas
	When User enters 'New topic' text to the topic on Canvas
	When User clicks 'MT' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas
	When User selects first 'New topic' and second 'Main Topic' topic on Canvas
	When User drags 'New topic' topic by '400' and '0' coordinates on Canvas and holds
	When User releases all pressed keys
	Then 'Floating Topic' topic is displayed on Canvas
	Then 'New topic' topic is displayed on Canvas
	When User clicks 'Undo' button on Tools panel
	Then 'Floating Topic' topic is not displayed on Canvas
	Then 'Main Topic' topic is displayed on Canvas
	When User clicks 'Redo' button on Tools panel
	Then 'Floating Topic' topic is displayed on Canvas
	Then 'Main Topic' topic is not displayed on Canvas