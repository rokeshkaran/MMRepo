@retry(2)
Feature: SmartShapes
Check the functionality of Smart Shapes

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-367] @Upd_Qase
Scenario: Check_Smart_Shape_sub_menu
	When User clicks 'Insert Smart Shape' button on Tools panel
	Then 'insert-smart' Menu is displayed to User
	And following menu buttons are displayed in 'insert-smart' menu
		| MenuButton |
		| Swim Lanes |
		| Funnel     |
	And following buttons are displayed in 'insert-smart' menu
		| Button |
		| Table  |
	When User mouse hovers menu button with 'swimlanes' name in 'insert-smart-bg-object' menu
	Then following buttons are displayed in 'swimlanes' menu
		| Button     |
		| Horizontal |
		| Vertical   |
	When User mouse hovers menu button with 'funnel' name in 'insert-smart-bg-object' menu
	Then following buttons are displayed in 'funnel' menu
		| Button     |
		| Horizontal |
		| Vertical   |

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-368] @Upd_Qase
Scenario: Сheck_that_the_cursor_changes_to_the_icon_arrow_for_the_selected_Swim_Lanes_shape
	When User clicks 'Insert Smart Shape' button on Tools panel
	And User mouse hovers menu button with 'swimlanes' name in 'insert-smart' menu
	And User clicks button with 'rows' name in 'swimlanes' menu
	Then 'swimlanes-horizontal' icon is displayed beside cursor
	When User clicks by coordinates '50' and '50' on Canvas
	Then 'swimlanes-horizontal' icon is not displayed beside cursor
	When User clicks 'Insert Smart Shape' button on Tools panel
	And User mouse hovers menu button with 'swimlanes' name in 'insert-smart' menu
	And User clicks button with 'columns' name in 'swimlanes' menu
	Then 'swimlanes-vertical' icon is displayed beside cursor
	When User clicks by coordinates '200' and '100' on Canvas
	Then 'swimlanes-vertical' icon is not displayed beside cursor

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-368] @Upd_Qase
Scenario: Check_adding_Horizontal_Swim_Lanes
	When User adds 'Swim Lanes' Smart shape on the 'Horizontal' option to '50','50' position on canvas
	Then 'Swim Lanes' Smart shape with '3' Horizontal lanes is displayed on Canvas

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-368] @Upd_Qase
Scenario: Check_adding_Vertical_Swim_Lanes
	When User adds 'Swim Lanes' Smart shape on the 'Vertical' option to '50','50' position on canvas
	Then 'Swim Lanes' Smart shape with '3' Vertical lanes is displayed on Canvas

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-369] @Upd_Qase
Scenario: Сheck_that_the_cursor_changes_to_the_icon_arrow_for_the_selected_Funnel_Lanes_shape
	When User clicks 'Insert Smart Shape' button on Tools panel
	And User mouse hovers menu button with 'funnel' name in 'insert-smart' menu
	And User clicks button with 'horizontal' name in 'funnel' menu
	Then 'funnel-horizontal' icon is displayed beside cursor
	When User clicks by coordinates '50' and '50' on Canvas
	Then 'funnel-horizontal' icon is not displayed beside cursor
	When User clicks 'Insert Smart Shape' button on Tools panel
	And User mouse hovers menu button with 'funnel' name in 'insert-smart' menu
	And User clicks button with 'vertical' name in 'funnel' menu
	Then 'funnel-vertical' icon is displayed beside cursor
	When User clicks by coordinates '200' and '100' on Canvas
	Then 'funnel-vertical' icon is not displayed beside cursor

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-369] @Upd_Qase
Scenario: Check_adding_Horizontal_Funnel
	When User adds 'Funnel' Smart shape on the 'Horizontal' option to '50','50' position on canvas
	Then Funnel Smart shape with '3' segments is displayed on Canvas

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-369] @Upd_Qase
Scenario: Check_adding_Vertical_Funnel
	When User adds 'Funnel' Smart shape on the 'Vertical' option to '50','50' position on canvas
	Then Funnel Smart shape with '3' segments is displayed on Canvas

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-370] @Upd_Qase
Scenario: Сheck_that_the_cursor_changes_to_the_icon_arrow_for_the_selected_Table_Lanes_shape
	When User clicks 'Insert Smart Shape' button on Tools panel
	Then 'insert-smart' Menu is displayed to User
	When User clicks button with 'table' name in 'insert-smart' menu
	Then 'table' icon is displayed beside cursor
	When User clicks by coordinates '50' and '50' on Canvas
	Then 'table' icon is not displayed beside cursor

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-370] @Upd_Qase
Scenario: Check_adding_Table_SmartShape
	When User adds 'Table' Smart shape to '50','50' position on canvas
	Then 'Table' Smart shape is displayed on Canvas
	And Table Smart shape with '1' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '1' Vertical lanes is displayed on Canvas

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-371] @Upd_Qase
Scenario: Check_that_it_is_possible_to_edit_Lane_via_Side_menu_for_Horizontal_Swim_lane
	When User adds 'Swim Lanes' Smart shape on the 'Horizontal' option to '50','50' position on canvas
	And User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	When User enters '-3' value to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	Then '3' value is displayed to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '0' value to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '2' value is displayed to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '10' value to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '10' value is displayed to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And 'Swim Lanes' Smart shape with '10' Horizontal lanes is displayed on Canvas
	When User enters ' ' value to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '10' value is displayed to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And 'Swim Lanes' Smart shape with '10' Horizontal lanes is displayed on Canvas

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-371] @Upd_Qase
Scenario: Check_that_it_is_possible_to_edit_Lane_via_Side_menu_for_Vertical_Swim_lane
	When User adds 'Swim Lanes' Smart shape on the 'Vertical' option to '50','50' position on canvas
	And User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	And '3' value is displayed to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '11' value to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then 'Swim Lanes' Smart shape with '11' Vertical lanes is displayed on Canvas

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-372] @Upd_Qase
Scenario: Check_that_it_is_possible_to_edit_Segments_via_Side_panel
	When User adds 'Funnel' Smart shape on the 'Vertical' option to '50','50' position on canvas
	Then Funnel Smart shape with '3' segments is displayed on Canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	And '3' value is displayed to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '-6' value to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '6' value is displayed to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Funnel Smart shape with '6' segments is displayed on Canvas
	When User enters '0' value to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '2' value is displayed to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '5' value to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '5' value is displayed to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Funnel Smart shape with '5' segments is displayed on Canvas
	When User enters ' ' value to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '5' value is displayed to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Funnel Smart shape with '5' segments is displayed on Canvas

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-373] @Upd_Qase
Scenario: Check_that_it_is_possible_to_edit_Rows_for_Table_smart_shape_via_Side_panel
	When User adds 'Table' Smart shape to '50','50' position on canvas
	And User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	And '2' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '-5' value to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '5' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '4' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '1' Vertical lanes is displayed on Canvas
	When User enters '0' value to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '2' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '7' value to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '7' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '6' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '1' Vertical lanes is displayed on Canvas
	When User enters ' ' value to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '7' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '6' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '1' Vertical lanes is displayed on Canvas

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-373] @Upd_Qase
Scenario: Check_that_it_is_possible_to_edit_Columns_for_Table_smart_shape_via_Side_panel
	When User adds 'Table' Smart shape to '50','50' position on canvas
	And User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	And '2' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '-5' value to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '5' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '1' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '4' Vertical lanes is displayed on Canvas
	When User enters '0' value to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '2' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User enters '7' value to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '7' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '1' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '6' Vertical lanes is displayed on Canvas
	When User enters ' ' value to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '7' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '1' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '6' Vertical lanes is displayed on Canvas