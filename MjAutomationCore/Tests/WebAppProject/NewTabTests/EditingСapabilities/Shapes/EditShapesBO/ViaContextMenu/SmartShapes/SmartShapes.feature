@retry(2)
Feature: SmartShapes
Check can edit Smart Shape attributes via context menu

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-384,WEB-1017] @Upd_Qase
Scenario: Check_it_is_possible_to_edit_the_number_of_lanes_in_Horizontal_Swim_Lanes_smart_shape_via_context_menu
	When User adds 'Swim Lanes' Smart shape on the 'Horizontal' option to '50','50' position on canvas
	And User right clicks on 'Swim Lanes' Smart shape on Canvas
	Then 'contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'lane' name in 'contextmenu' menu
	Then 'lane' Menu is displayed to User
	When User clicks button with '5' name in 'lane' menu
	Then 'Swim Lanes' Smart shape with '5' Horizontal lanes is displayed on Canvas

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-384] @Upd_Qase
Scenario: Check_More_option_for_lanes_in_Swim_Lane_Smart_shape_via_context_menu
	When User adds 'Swim Lanes' Smart shape on the 'Vertical' option to '50','50' position on canvas
	And User right clicks on 'Swim Lanes' Smart shape on Canvas
	And User mouse hovers menu button with 'lane' name in 'contextmenu' menu
	And User clicks button with 'more-format-options' name in 'lane' menu
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	And '3' value is displayed to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-385] @Upd_Qase
Scenario: Check_it_is_possible_to_edit_the_number_of_segments_in_Funnel_Smart_shape_via_context_menu
	When User adds 'Funnel' Smart shape on the 'Horizontal' option to '50','50' position on canvas
	And User right clicks on 'Funnel' Smart shape on Canvas
	Then 'contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'lane' name in 'contextmenu' menu
	And User clicks button with '6' name in 'lane' menu
	Then Funnel Smart shape with '6' segments is displayed on Canvas

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-385] @Upd_Qase
Scenario: Check_More_option_for_segments_in_Funnel_Smart_shape_via_context_menu
	When User adds 'Funnel' Smart shape on the 'Vertical' option to '50','50' position on canvas
	Then Funnel Smart shape with '3' segments is displayed on Canvas
	When User right clicks on 'Funnel' Smart shape on Canvas
	And User mouse hovers menu button with 'lane' name in 'contextmenu' menu
	And User clicks button with 'more-format-options' name in 'lane' menu
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	And '3' value is displayed to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-386] @Upd_Qase
Scenario: Check_it_is_possible_to_edit_the_number_of_rows_in_Table_SmartShape_via_context_menu
	When User adds 'Table' Smart shape to '50','50' position on canvas
	Then 'Table' Smart shape is displayed on Canvas
	When User right clicks on 'Table' Smart shape on Canvas
	Then 'contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'table-rows' name in 'contextmenu' menu
	And User clicks button with '3' name in 'table-rows' menu
	Then Table Smart shape with '2' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '1' Vertical lanes is displayed on Canvas

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-386] @Upd_Qase
Scenario: Check_More_option_for_rows_in_Table_Smart_shape_via_context_menu
	When User adds 'Table' Smart shape to '50','50' position on canvas
	Then 'Table' Smart shape is displayed on Canvas
	When User right clicks on 'Table' Smart shape on Canvas
	And User mouse hovers menu button with 'table-rows' name in 'contextmenu' menu
	And User clicks button with 'more-format-options' name in 'table-rows' menu
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	And '2' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1481] @Upd_Qase
Scenario: Check_it_is_possible_to_edit_the_columns_in_Table_SmartShape_via_context_menu
	When User adds 'Table' Smart shape to '50','50' position on canvas
	Then 'Table' Smart shape is displayed on Canvas
	When User right clicks on 'Table' Smart shape on Canvas
	Then 'contextmenu' Menu is displayed to User
	When User mouse hovers menu button with 'table-columns' name in 'contextmenu' menu
	And User clicks button with '4' name in 'table-columns' menu
	Then Table Smart shape with '1' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '3' Vertical lanes is displayed on Canvas

@MindManager @EditingCapabilities @SmartShapes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1481] @Upd_Qase
Scenario: Check_More_option_for_columns_in_Table_Smart_shape_via_context_menu
	When User adds 'Table' Smart shape to '50','50' position on canvas
	Then 'Table' Smart shape is displayed on Canvas
	When User right clicks on 'Table' Smart shape on Canvas
	And User mouse hovers menu button with 'table-columns' name in 'contextmenu' menu
	And User clicks button with 'more-format-options' name in 'table-columns' menu
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	And '2' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header