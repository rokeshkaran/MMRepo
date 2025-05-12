@retry(2)
Feature: ViaSidePanel
Check the functionality of Smart Shapes via side panel

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManage @EditingCapabilities @SmartShapes @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-882] @Upd_Qase
Scenario: Check_it_is_possible_to_use_non_integer_value_for_edit_the_number_of_rows_and_columns_in_Table_SmartShape_via_context_menu
	When User adds 'Table' Smart shape to '150','50' position on canvas
	And User clicks 'Format Shape' button of side Toolbox
	And User enters '1.13' value to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	And User presses the 'Enter' key on the keyboard
	And User enters '8.74' value to 'Name' field in 'Object' section of 'PanelByName' side panel with 'Format Shape' header
	And User clicks on 'Name' field in 'Object' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the Ctrl_A combination key on the keyboard
	And User presses the Ctrl_C combination key on the keyboard
	And User clicks on 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the Ctrl_A combination key on the keyboard
	And User presses the Ctrl_V combination key on the keyboard
	And User presses the 'Enter' key on the keyboard
	Then '30' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And '8' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '29' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '7' Vertical lanes is displayed on Canvas

@MindManage @EditingCapabilities @SmartShape @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-882] @Upd_Qase
Scenario: Check_it_is_possible_to_use_math_formulas_value_for_edit_the_number_of_rows_and_columns_in_Table_SmartShape_via_context_menu
	When User adds 'Table' Smart shape to '150','50' position on canvas
	And User right clicks on 'Table' Smart shape on Canvas
	Then 'contextmenu' Menu is displayed to User
	When User clicks button with 'more-format-option' name in 'contextmenu' menu
	And User enters '4/2' value to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	And User presses the 'Enter' key on the keyboard
	And User enters '3*6' value to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	And User presses the 'Enter' key on the keyboard
	Then '30' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And '30' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '29' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '29' Vertical lanes is displayed on Canvas

@MindManage @EditingCapabilities @SmartShape @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-882] @Upd_Qase
Scenario: Check_it_is_possible_to_use_zero_as_value_for_edit_the_number_of_rows_and_columns_in_Table_SmartShape_via_context_menu
	When User adds 'Table' Smart shape to '150','50' position on canvas
	And User right clicks on 'Table' Smart shape on Canvas
	Then 'contextmenu' Menu is displayed to User
	When User clicks button with 'more-format-option' name in 'contextmenu' menu
	Then '2' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And '2' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '1' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '1' Vertical lanes is displayed on Canvas
	When User enters '0' value to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	Then '0' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User presses the 'Enter' key on the keyboard
	And User enters '0' value to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	Then '0' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User presses the 'Enter' key on the keyboard
	Then '2' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And '2' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '1' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '1' Vertical lanes is displayed on Canvas

@MindManage @EditingCapabilities @SmartShape @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-882] @Upd_Qase
Scenario: Check_it_is_notpossible_to_use_characters_as_value_for_edit_the_number_of_rows_and_columns_in_Table_SmartShape_via_context_menu
	When User adds 'Table' Smart shape to '150','50' position on canvas
	And User right clicks on 'Table' Smart shape on Canvas
	Then 'contextmenu' Menu is displayed to User
	When User clicks button with 'more-format-option' name in 'contextmenu' menu
	Then '2' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And '2' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '1' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '1' Vertical lanes is displayed on Canvas
	When User enters 'three' value to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	And User enters 'seven' value to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '2' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And '2' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '1' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '1' Vertical lanes is displayed on Canvas

@MindManage @EditingCapabilities @SmartShape @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-882] @Upd_Qase
Scenario: Check_it_is_notpossible_to_use_negative_value_for_edit_the_number_of_rows_and_columns_in_Table_SmartShape_via_context_menu
	When User adds 'Table' Smart shape to '150','50' position on canvas
	And User right clicks on 'Table' Smart shape on Canvas
	Then 'contextmenu' Menu is displayed to User
	When User clicks button with 'more-format-option' name in 'contextmenu' menu
	Then '2' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And '2' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '1' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '1' Vertical lanes is displayed on Canvas
	When User enters '-3' value to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	And User enters '-7' value to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '3' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And '7' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '2' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '6' Vertical lanes is displayed on Canvas

@MindManage @EditingCapabilities @SmartShape @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-882] @Upd_Qase
Scenario: Check_it_is_possible_to_use_positive_value_for_edit_the_number_of_rows_and_columns_in_Table_SmartShape_via_context_menu
	When User adds 'Table' Smart shape to '150','50' position on canvas
	And User right clicks on 'Table' Smart shape on Canvas
	Then 'contextmenu' Menu is displayed to User
	When User clicks button with 'more-format-option' name in 'contextmenu' menu
	Then '2' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And '2' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '1' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '1' Vertical lanes is displayed on Canvas
	When User enters '4' value to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	And User enters '5' value to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '4' value is displayed to 'Rows' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And '5' value is displayed to 'Columns' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Table Smart shape with '3' Horizontal lanes is displayed on Canvas
	And Table Smart shape with '4' Vertical lanes is displayed on Canvas

@MindManage @EditingCapabilities @SmartShapes @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-883] @Upd_Qase
Scenario: Check_it_is_possible_to_use_zero_value_for_edit_the_number_of_segments_in_Funnel_SmartShape_via_context_menu
	When User adds 'Funnel' Smart shape on the 'Vertical' option to '150','50' position on canvas
	And User clicks 'Format Shape' button of side Toolbox
	And User enters '0' value to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	And User presses the 'Enter' key on the keyboard
	Then '2' value is displayed to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Funnel Smart shape with '2' segments is displayed on Canvas

@MindManage @EditingCapabilities @SmartShapes @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-883] @Upd_Qase
Scenario: Check_it_is_possible_to_use_negative_value_for_edit_the_number_of_segments_in_Funnel_SmartShape_via_context_menu
	When User adds 'Funnel' Smart shape on the 'Vertical' option to '150','50' position on canvas
	And User clicks 'Format Shape' button of side Toolbox
	And User enters '-8' value to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	And User presses the 'Enter' key on the keyboard
	Then '8' value is displayed to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Funnel Smart shape with '8' segments is displayed on Canvas

@MindManage @EditingCapabilities @SmartShapes @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-883] @Upd_Qase
Scenario: Check_it_is_possible_to_use_non_integer_value_for_edit_the_number_of_segments_in_Funnel_SmartShape_via_context_menu
	When User adds 'Funnel' Smart shape on the 'Vertical' option to '150','50' position on canvas
	And User clicks 'Format Shape' button of side Toolbox
	And User enters '1.5' value to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	And User presses the 'Enter' key on the keyboard
	Then '15' value is displayed to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Funnel Smart shape with '15' segments is displayed on Canvas

@MindManage @EditingCapabilities @SmartShape @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-883] @Upd_Qase
Scenario: Check_it_is_possible_to_use_math_formulas_value_for_edit_the_number_of_segments_in_Funnel_SmartShape_via_context_menu
	When User adds 'Funnel' Smart shape on the 'Horizontal' option to '150','50' position on canvas
	And User right clicks on 'Funnel' Smart shape on Canvas
	Then 'contextmenu' Menu is displayed to User
	When User clicks button with 'more-format-option' name in 'contextmenu' menu
	And User enters '4+2' value to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	And User presses the 'Enter' key on the keyboard
	Then '30' value is displayed to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And Funnel Smart shape with '30' segments is displayed on Canvas

@MindManage @EditingCapabilities @SmartShape @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-883] @Upd_Qase
Scenario: Check_it_is_not_possible_to_use_characters_value_for_edit_the_number_of_segmentss_in_Funnel_SmartShape_via_context_menu
	When User adds 'Funnel' Smart shape on the 'Horizontal' option to '150','50' position on canvas
	And User right clicks on 'Funnel' Smart shape on Canvas
	Then 'contextmenu' Menu is displayed to User
	When User clicks button with 'more-format-option' name in 'contextmenu' menu
	And User enters 'seven' value to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '3' value is displayed to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User presses the 'Enter' key on the keyboard
	Then Funnel Smart shape with '3' segments is displayed on Canvas

@MindManage @EditingCapabilities @SmartShape @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-883] @Upd_Qase
Scenario: Check_it_is_possible_to_use_positive_value_for_edit_the_number_of_segmentss_in_Funnel_SmartShape_via_context_menu
	When User adds 'Funnel' Smart shape on the 'Horizontal' option to '150','50' position on canvas
	And User right clicks on 'Funnel' Smart shape on Canvas
	Then 'contextmenu' Menu is displayed to User
	When User clicks button with 'more-format-option' name in 'contextmenu' menu
	And User enters '5' value to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '5' value is displayed to 'Segments' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User presses the 'Enter' key on the keyboard
	Then Funnel Smart shape with '5' segments is displayed on Canvas

@MindManage @EditingCapabilities @SmartShapes @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-884] @Upd_Qase
Scenario: Check_it_is_possible_to_use_non_integer_value_for_edit_the_number_of_segments_in_Swim_lane_SmartShape_via_side_panel
	When User adds 'Swim Lanes' Smart shape on the 'Vertical' option to '150','50' position on canvas
	And User clicks 'Format Shape' button of side Toolbox
	And User enters '1.5' value to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	And User presses the 'Enter' key on the keyboard
	Then '15' value is displayed to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And 'Swim Lanes' Smart shape with '15' Vertical lanes is displayed on Canvas

@MindManage @EditingCapabilities @SmartShapes @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-884] @Upd_Qase
Scenario: Check_it_is_possible_to_use_leading_zero_value_for_edit_the_number_of_segments_in_Swim_lane_SmartShape_via_side_panel
	When User adds 'Swim Lanes' Smart shape on the 'Vertical' option to '150','50' position on canvas
	And User clicks 'Format Shape' button of side Toolbox
	And User enters '05' value to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	And User presses the 'Enter' key on the keyboard
	Then '5' value is displayed to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And 'Swim Lanes' Smart shape with '5' Vertical lanes is displayed on Canvas

@MindManage @EditingCapabilities @SmartShapes @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-884] @Upd_Qase
Scenario: Check_it_is_possible_to_use_positive_value_for_edit_the_number_of_segments_in_Swim_lane_SmartShape_via_side_panel
	When User adds 'Swim Lanes' Smart shape on the 'Vertical' option to '150','50' position on canvas
	And User clicks 'Format Shape' button of side Toolbox
	And User enters '10' value to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	And User presses the 'Enter' key on the keyboard
	Then '10' value is displayed to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And 'Swim Lanes' Smart shape with '10' Vertical lanes is displayed on Canvas

@MindManage @EditingCapabilities @SmartShapes @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-884] @Upd_Qase
Scenario: Check_it_is_possible_to_use_zero_value_for_edit_the_number_of_segments_in_Swim_lane_SmartShape_via_side_panel
	When User adds 'Swim Lanes' Smart shape on the 'Vertical' option to '150','50' position on canvas
	And User clicks 'Format Shape' button of side Toolbox
	And User enters '0' value to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	And User presses the 'Enter' key on the keyboard
	Then '2' value is displayed to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And 'Swim Lanes' Smart shape with '2' Vertical lanes is displayed on Canvas

@MindManage @EditingCapabilities @SmartShapes @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-884] @Upd_Qase
Scenario: Check_it_is_possible_to_use_negative_value_for_edit_the_number_of_segments_in_Swim_lane_SmartShape_via_side_panel
	When User adds 'Swim Lanes' Smart shape on the 'Vertical' option to '150','50' position on canvas
	And User clicks 'Format Shape' button of side Toolbox
	And User enters '-13' value to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	And User presses the 'Enter' key on the keyboard
	Then '13' value is displayed to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And 'Swim Lanes' Smart shape with '13' Vertical lanes is displayed on Canvas

@MindManage @EditingCapabilities @SmartShape @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-884] @Upd_Qase
Scenario: Check_it_is_possible_to_use_math_formulas_value_for_edit_the_number_of_segments_in_Swim_Lanes_SmartShape_via_context_menu
	When User adds 'Swim Lanes' Smart shape on the 'Horizontal' option to '150','50' position on canvas
	And User right clicks on 'Swim Lanes' Smart shape on Canvas
	Then 'contextmenu' Menu is displayed to User
	When User clicks button with 'more-format-option' name in 'contextmenu' menu
	And User enters '4+2' value to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' for Size section
	And User presses the 'Enter' key on the keyboard
	Then '30' value is displayed to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And 'Swim Lanes' Smart shape with '30' Horizontal lanes is displayed on Canvas

@MindManage @EditingCapabilities @SmartShape @ViaSidePanel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-884] @Upd_Qase
Scenario: Check_it_is_not_possible_to_use_characters_value_for_edit_the_number_of_segmentss_in_Swim_Lanes_SmartShape_via_context_menu
	When User adds 'Swim Lanes' Smart shape on the 'Horizontal' option to '150','50' position on canvas
	And User right clicks on 'Swim Lanes' Smart shape on Canvas
	Then 'contextmenu' Menu is displayed to User
	When User clicks button with 'more-format-option' name in 'contextmenu' menu
	And User enters 'seven' value to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	And User presses the 'Enter' key on the keyboard
	Then '3' value is displayed to 'Lanes' field in 'Size' section of 'PanelByName' side panel with 'Format Shape' header
	When User presses the 'Enter' key on the keyboard
	Then 'Swim Lanes' Smart shape with '3' Horizontal lanes is displayed on Canvas