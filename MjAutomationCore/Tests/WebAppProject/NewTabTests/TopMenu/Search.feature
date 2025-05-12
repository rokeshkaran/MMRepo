@retry(2)
Feature: Search
Check functionality of Search function

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SearchMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @Top_Menu @Search @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1223] @Upd_Qase
Scenario: Сheck_opening_search_via_hotkeys_in_Standard_mode
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User presses the Ctrl_F combination key on the keyboard
	Then Search toolbar is expanded in Standard mode
	When User enters '56' value in input filed on Search toolbar
	Then '56' value is displayed in input filed on Search toolbar
	Then '123456789' topic text is highlighted 'yellow' color
	Then '123456789' is outlined with a blue circuit
	Then '1 of 1' label result is displayed on Search toolbar
	When User presses the 'Backspase' key on the keyboard
	Then '5' value is displayed in input filed on Search toolbar
	When User presses the 'Backspase' key on the keyboard
	Then '' value is displayed in input filed on Search toolbar
	When User enters '#' value in input filed on Search toolbar
	Then '#$%^&*()(*&^%$' topic text is highlighted 'yellow' color
	Then '#$%^&*()(*&^%$' is outlined with a blue circuit
	Then '1 of 1' label result is displayed on Search toolbar
	When User clicks 'Close' button on Search toolbar
	Then Search toolbar is collapsed in Standard mode

@MindManager @Top_Menu @Search @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1223] @Upd_Qase @JIRA[MMCV-7250,MMCV-9594,MMCV-9595]
Scenario: Сheck_note_search_via_hotkeys_in_Standard_mode
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User presses the Ctrl_F combination key on the keyboard
	Then Search toolbar is expanded in Standard mode
	When User enters 'Note' value in input filed on Search toolbar
	Then 'Note' value is displayed in input filed on Search toolbar
	Then 'TestNote' topic text is highlighted 'yellow' color
	Then 'TestNote2' topic text is highlighted 'orange' color
	Then '1 of 4' label result is displayed on Search toolbar
	When User clicks Next button on Search toolbar
	Then 'PanelPublished' side panel with 'Notes' header is displayed to the User
	Then 'TestNote' topic text is highlighted 'orange' color
	Then 'TestNote2' topic text is highlighted 'orange' color
	Then '2 of 4' label result is displayed on Search toolbar
	Then 'Note' value is highlighted 'rgba(255, 165, 0, 1)' color in Note field on Notes panel
	When User clicks Next button on Search toolbar
	Then 'TestNote' topic text is highlighted 'orange' color
	Then 'TestNote2' topic text is highlighted 'yellow' color
	Then '3 of 4' label result is displayed on Search toolbar
	When User clicks Next button on Search toolbar
	Then 'PanelPublished' side panel with 'Notes' header is displayed to the User
	Then 'TestNote' topic text is highlighted 'orange' color
	Then 'TestNote2' topic text is highlighted 'orange' color
	Then '4 of 4' label result is displayed on Search toolbar
	Then 'Note' value is highlighted 'rgba(255, 165, 0, 1)' color in Note field on Notes panel

@MindManager @Top_Menu @Search @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1223] @Upd_Qase
Scenario: Check_the_functionality_of_Search_function_In_Standard_mode
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'collapse-all' name in 'view' menu
	Then all subtopics are collapsed on Canvas
	When User clicks Search button on Menu toolbar in Standard mode
	Then Search toolbar is expanded in Standard mode
	When User enters 'T' value in input filed on Search toolbar
	Then 'CT' topic text is highlighted 'yellow' color
	Then 'New Topic' topic text is highlighted 'orange' color
	Then 'Auto test' topic text is highlighted 'orange' color
	Then 'Callout' topic text is highlighted 'orange' color
	When User remembers location of 'New Topic' topic on Canvas
	When User enters 'opic' value in input filed on Search toolbar
	Then 'New Topic' topic has changed location by X axis on Canvas
	Then 'New Topic' topic has changed location by Y axis on Canvas
	Then '1 of 2' label result is displayed on Search toolbar
	Then 'New Topic' topic text is highlighted 'yellow' color
	When User clicks Next button on Search toolbar
	Then '2 of 2' label result is displayed on Search toolbar
	Then "-" collapsed subtopic are displayed to User
	Then 'Subtopic' topic text is highlighted 'yellow' color
	Then 'Subtopic' is outlined with a blue circuit
	Then 'New Topic' topic text is highlighted 'orange' color
	When User clicks Prev button on Search toolbar
	Then '1 of 2' label result is displayed on Search toolbar
	Then 'New Topic' topic text is highlighted 'yellow' color
	Then 'Subtopic' topic text is highlighted 'orange' color
	When User clicks 'Close' button on Search toolbar
	Then Search toolbar is collapsed in Standard mode

@MindManager @Top_Menu @Search @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1223] @Upd_Qase
Scenario: Сheck_opening_search_via_hotkeys_in_Presentation_mode
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	When User presses the Ctrl_F combination key on the keyboard
	Then Search toolbar is expanded in Presentation mode
	When User enters '56' value in input filed on Search toolbar
	Then '56' value is displayed in input filed on Search toolbar
	Then '123456789' topic text is highlighted 'yellow' color
	Then '123456789' is outlined with a blue circuit
	Then '1 of 1' label result is displayed on Search toolbar
	When User presses the 'Backspase' key on the keyboard
	Then '5' value is displayed in input filed on Search toolbar
	When User presses the 'Backspase' key on the keyboard
	Then '' value is displayed in input filed on Search toolbar
	When User enters '#' value in input filed on Search toolbar
	Then '#$%^&*()(*&^%$' topic text is highlighted 'yellow' color
	Then '#$%^&*()(*&^%$' is outlined with a blue circuit
	Then '1 of 1' label result is displayed on Search toolbar
	When User clicks 'Close' button on Search toolbar
	Then Search toolbar is collapsed in Presentation mode

@MindManager @Top_Menu @Search @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1223] @Upd_Qase @JIRA[MMCV-7250,MMCV-9594,MMCV-9595]
Scenario: Сheck_note_search_via_hotkeys_in_Presentation_mode
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	When User presses the Ctrl_F combination key on the keyboard
	Then Search toolbar is expanded in Presentation mode
	When User enters 'Note' value in input filed on Search toolbar
	Then 'Note' value is displayed in input filed on Search toolbar
	Then 'TestNote' topic text is highlighted 'yellow' color
	Then 'TestNote2' topic text is highlighted 'orange' color
	Then '1 of 4' label result is displayed on Search toolbar
	When User clicks Next button on Search toolbar
	Then 'PanelPublished' side panel with 'Notes' header is displayed to the User
	Then 'TestNote' topic text is highlighted 'orange' color
	Then 'TestNote2' topic text is highlighted 'orange' color
	Then '2 of 4' label result is displayed on Search toolbar
	Then 'Note' value is highlighted 'rgba(255, 165, 0, 1)' color in Note field on Notes panel
	When User clicks Next button on Search toolbar
	Then 'TestNote' topic text is highlighted 'orange' color
	Then 'TestNote2' topic text is highlighted 'yellow' color
	Then '3 of 4' label result is displayed on Search toolbar
	When User clicks Next button on Search toolbar
	Then 'PanelPublished' side panel with 'Notes' header is displayed to the User
	Then 'TestNote' topic text is highlighted 'orange' color
	Then 'TestNote2' topic text is highlighted 'orange' color
	Then '4 of 4' label result is displayed on Search toolbar
	Then 'Note' value is highlighted 'rgba(255, 165, 0, 1)' color in Note field on Notes panel

@MindManager @Top_Menu @Search @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1223] @Upd_Qase
Scenario: Check_the_functionality_of_Search_function_In_Presentation_mode
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'collapse-all' name in 'view' menu
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'presentation-view' name in 'view' menu
	Then all subtopics are collapsed on Canvas
	When User clicks 'Search' button on Menu toolbar
	Then Search toolbar is expanded in Presentation mode
	When User enters 'T' value in input filed on Search toolbar
	Then 'CT' topic text is highlighted 'yellow' color
	Then 'New Topic' topic text is highlighted 'orange' color
	Then 'Auto test' topic text is highlighted 'orange' color
	When User remembers location of 'New Topic' topic on Canvas
	When User enters 'opic' value in input filed on Search toolbar
	Then 'New Topic' topic has changed location by X axis on Canvas
	Then 'New Topic' topic has changed location by Y axis on Canvas
	Then '1 of 2' label result is displayed on Search toolbar
	Then 'New Topic' topic text is highlighted 'yellow' color
	When User clicks Next button on Search toolbar
	Then '2 of 2' label result is displayed on Search toolbar
	Then "-" collapsed subtopic are displayed to User
	Then 'Subtopic' topic text is highlighted 'yellow' color
	Then 'Subtopic' is outlined with a blue circuit
	Then 'New Topic' topic text is highlighted 'orange' color
	When User clicks Prev button on Search toolbar
	Then '1 of 2' label result is displayed on Search toolbar
	Then 'New Topic' topic text is highlighted 'yellow' color
	Then 'Subtopic' topic text is highlighted 'orange' color
	When User clicks 'Close' button on Search toolbar
	Then Search toolbar is collapsed in Presentation mode