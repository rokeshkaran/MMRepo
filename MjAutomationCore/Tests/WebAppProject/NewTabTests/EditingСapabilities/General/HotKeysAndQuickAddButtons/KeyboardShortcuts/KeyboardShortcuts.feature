@retry(2)
Feature: KeyboardShortcuts
Check Keyboard shortcut functionality

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @KeyboardShortcuts @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1488] @Upd_Qase
Scenario: Check_that_it_is_possible_to_view_the_list_of_all_shortcuts_using_F4_key
	When User presses the 'F4' key on the keyboard
	Then 'info' dialog is displayed to User
	When User clicks close button in 'info' dialog
	Then 'info' dialog is not displayed to User

@MindManager @EditingCapabilities @KeyboardShortcuts @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1487] @Upd_Qase
Scenario: Check_that_it_is_possible_to_view_the_list_of_all_shortcuts_using_Help_button_in_View_Section_via_Toolbar
	When User clicks menu button with 'help' name in 'ToolbarPageElement' container
	Then 'help' Menu is displayed to User
	When User clicks button with 'Keyboard Shortcuts' name in 'help' menu
	Then 'info' dialog is displayed to User
	Then 'Keyboard Shortcuts' titlebar header is displayed in 'info' dialog
	When User clicks close button in 'info' dialog
	Then 'info' dialog is not displayed to User

@MindManager @EditingCapabilities @KeyboardShortcuts @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1487] @Upd_Qase @Not_Run
#Set tag @Not_Run as test cannot be run on CI, due to list of shortcuts displayed on CI are as on MacOS and is not similar to below shortcut details.
Scenario: Check_that_it_is_possible_to_view_the_list_of_all_shortcuts_using_Help_button_in_View_Section
	When User clicks menu button with 'help' name in 'ToolbarPageElement' container
	Then 'help' Menu is displayed to User
	When User clicks button with 'Keyboard Shortcuts' name in 'help' menu
	Then 'info' dialog is displayed to User
	Then 'Keyboard Shortcuts' titlebar header is displayed in 'info' dialog
	Then following keyboard shortcuts are displayed in 'View' section in 'info' dialog
		| Shortcut_Title         | Shortcut_Value |
		| Pan                    | Space + Drag   |
		| Zoom out               | ctrl -         |
		| Zoom in                | ctrl +         |
		| Fit map to screen      | ctrl F5        |
		| Pan map by small steps | ← → ↑ ↓        |
	When User clicks close button in 'info' dialog
	Then 'info' dialog is not displayed to User

@MindManager @EditingCapabilities @KeyboardShortcuts @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1487] @Upd_Qase @Not_Run
#Set tag @Not_Run as test cannot be run on CI, due to list of shortcuts displayed on CI are as on MacOS and is not similar to below shortcut details.
Scenario: Check_that_it_is_possible_to_view_the_list_of_all_shortcuts_using_Help_button_in_Canvas_Section
	When User clicks menu button with 'help' name in 'ToolbarPageElement' container
	Then 'help' Menu is displayed to User
	When User clicks button with 'Keyboard Shortcuts' name in 'help' menu
	Then 'info' dialog is displayed to User
	Then 'Keyboard Shortcuts' titlebar header is displayed in 'info' dialog
	Then following keyboard shortcuts are displayed in 'Canvas' section in 'info' dialog
		| Shortcut_Title                                            | Shortcut_Value          |
		| Lock/Unlock                                               | ctrl L                  |
		| Undo                                                      | ctrl Z                  |
		| Redo                                                      | ctrl Y                  |
		| Copy                                                      | ctrl C                  |
		| Cut                                                       | ctrl X                  |
		| Paste                                                     | ctrl V                  |
		| Duplicate                                                 | ctrl D / alt + Drag     |
		| Multi-Select                                              | Hold shift + Left-click |
		| Select all objects / select all text (while text editing) | ctrl A                  |
		| Move                                                      | ← → ↑ ↓                 |
		| Boosted move                                              | shift + ← → ↑ ↓         |
		| Lock Y/X axis while moving                                | Hold shift + Drag       |
		| Maintain aspect ratio while resizing                      | Hold shift              |
		| Close a menu or dialog / Cancel editing                   | esc                     |
	When User clicks close button in 'info' dialog
	Then 'info' dialog is not displayed to User

@MindManager @EditingCapabilities @KeyboardShortcuts @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1487] @Upd_Qase @Not_Run
#Set tag @Not_Run as test cannot be run on CI, due to list of shortcuts displayed on CI are as on MacOS and is not similar to below shortcut details.
Scenario: Check_that_it_is_possible_to_view_the_list_of_all_shortcuts_using_Help_button_in_File_Section
	When User clicks menu button with 'help' name in 'ToolbarPageElement' container
	Then 'help' Menu is displayed to User
	When User clicks button with 'Keyboard Shortcuts' name in 'help' menu
	Then 'info' dialog is displayed to User
	Then 'Keyboard Shortcuts' titlebar header is displayed in 'info' dialog
	Then following keyboard shortcuts are displayed in 'File' section in 'info' dialog
		| Shortcut_Title | Shortcut_Value |
		| New file       | alt N          |
		| Open file      | ctrl O         |
	When User clicks close button in 'info' dialog
	Then 'info' dialog is not displayed to User

@MindManager @EditingCapabilities @KeyboardShortcuts @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1487] @Upd_Qase @Not_Run
#Set tag @Not_Run as test cannot be run on CI, due to list of shortcuts displayed on CI are as on MacOS and is not similar to below shortcut details.
Scenario: Check_that_it_is_possible_to_view_the_list_of_all_shortcuts_using_Help_button_in_Topics_Section
	When User clicks menu button with 'help' name in 'ToolbarPageElement' container
	Then 'help' Menu is displayed to User
	When User clicks button with 'Keyboard Shortcuts' name in 'help' menu
	Then 'info' dialog is displayed to User
	Then 'Keyboard Shortcuts' titlebar header is displayed in 'info' dialog
	Then following keyboard shortcuts are displayed in 'Topics' section in 'info' dialog
		| Shortcut_Title                   | Shortcut_Value    |
		| Add floating topic               | Double click      |
		| Add subtopic/decision tree       | ctrl enter        |
		| Add sibling topic/floating topic | enter             |
		| Add parent topic                 | ctrl shift insert |
		| Add link                         | ctrl K            |
		| Open image tab                   | ctrl shift I      |
		| Reset formating                  | ctrl space        |
		| Move up/down one place           | alt ctrl + ↑ ↓    |
		| Move to top                      | alt ctrl home     |
		| Move to bottom                   | alt ctrl end      |
	When User clicks close button in 'info' dialog
	Then 'info' dialog is not displayed to User

@MindManager @EditingCapabilities @KeyboardShortcuts @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1487] @Upd_Qase @Not_Run
#Set tag @Not_Run as test cannot be run on CI, due to list of shortcuts displayed on CI are as on MacOS and is not similar to below shortcut details.
Scenario: Check_that_it_is_possible_to_view_the_list_of_all_shortcuts_using_Help_button_in_MindMapView_Section
	When User clicks menu button with 'help' name in 'ToolbarPageElement' container
	Then 'help' Menu is displayed to User
	When User clicks button with 'Keyboard Shortcuts' name in 'help' menu
	Then 'info' dialog is displayed to User
	Then 'Keyboard Shortcuts' titlebar header is displayed in 'info' dialog
	Then following keyboard shortcuts are displayed in 'Mind Map View & Navigation' section in 'info' dialog
		| Shortcut_Title                              | Shortcut_Value |
		| Center, focus and expand selected topic     | F3             |
		| Collapse map and focus on central topic     | ctrl F3        |
		| Show all levels                             | ctrl 9         |
		| Open collapsed branch to level 1,2,3...or 8 | ctrl 1 2 3...8 |
		| Select topic                                | ← → ↑ ↓        |
		| Move to top sibling topic                   | home           |
		| Move to bottom sibling topic                | end            |
	When User clicks close button in 'info' dialog
	Then 'info' dialog is not displayed to User

@MindManager @EditingCapabilities @KeyboardShortcuts @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1487] @Upd_Qase @Not_Run
#Set tag @Not_Run as test cannot be run on CI, due to list of shortcuts displayed on CI are as on MacOS and is not similar to below shortcut details.
Scenario: Check_that_it_is_possible_to_view_the_list_of_all_shortcuts_using_Help_button_in_Text_Section
	When User clicks menu button with 'help' name in 'ToolbarPageElement' container
	Then 'help' Menu is displayed to User
	When User clicks button with 'Keyboard Shortcuts' name in 'help' menu
	Then 'info' dialog is displayed to User
	Then 'Keyboard Shortcuts' titlebar header is displayed in 'info' dialog
	Then following keyboard shortcuts are displayed in 'Text' section in 'info' dialog
		| Shortcut_Title                 | Shortcut_Value   |
		| Bold                           | ctrl B           |
		| Italic                         | ctrl I           |
		| Underline                      | ctrl U           |
		| Strikethrough                  | ctrl shift S     |
		| Decrease/Increase font size    | ctrl shift + < > |
		| New line                       | shift enter      |
		| Insert cursor at start of text | F2               |
		| Insert cursor at end of text   | shift space      |
		| Move to begining of line       | home             |
		| Move to end of line            | end              |
		| Move to begining of topic text | ctrl home        |
		| Move to end of topic text      | ctrl end         |
	When User clicks close button in 'info' dialog
	Then 'info' dialog is not displayed to User

@MindManager @EditingCapabilities @KeyboardShortcuts @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1487] @Upd_Qase @Not_Run
#Set tag @Not_Run as test cannot be run on CI, due to list of shortcuts displayed on CI are as on MacOS and is not similar to below shortcut details.
Scenario: Check_that_it_is_possible_to_view_the_list_of_all_shortcuts_using_Help_button_in_Help_Section
	When User clicks menu button with 'help' name in 'ToolbarPageElement' container
	Then 'help' Menu is displayed to User
	When User clicks button with 'Keyboard Shortcuts' name in 'help' menu
	Then 'info' dialog is displayed to User
	Then 'Keyboard Shortcuts' titlebar header is displayed in 'info' dialog
	Then following keyboard shortcuts are displayed in 'Help' section in 'info' dialog
		| Shortcut_Title | Shortcut_Value |
		| Show shortcuts | F4             |
	When User clicks close button in 'info' dialog
	Then 'info' dialog is not displayed to User