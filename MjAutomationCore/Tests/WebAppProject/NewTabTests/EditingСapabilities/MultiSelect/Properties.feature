@retry(2)
Feature: Properties
Check for the selected topics with the properties same, mixed and distinct

@MindManager @EditingCapabilities @MultiSelect @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-487] @Upd_Qase
Scenario: Check_that_property_field_is_not_blank_on_side_panel_when_topic_property_value_is_same_for_all_the_selected_topics
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath        |
		| auto_test_SRND.mmap | Properties.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'Currency' property is displayed in 'Topic A' topic infobox
	And 'Currency' property is displayed in 'Topic B' topic infobox
	When User presses and hold the 'Shift' key on the keyboard
	And User presses and hold the 'Ctrl' key on the keyboard
	And User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	When User releases all keys on keyboard
	And User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	And '$120.00' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header

@MindManager @EditingCapabilities @MultiSelect @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-488] @Upd_Qase
Scenario: Check_that_property_field_is_blank_on_side_panel_when_topic_property_value_has_mixed_values_for_the_selected_topics
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath        |
		| auto_test_SRND.mmap | Properties.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'Currency' property is displayed in 'Topic A' topic infobox
	And 'Currency' property is displayed in 'Topic B' topic infobox
	And 'Currency' property is displayed in 'Topic C' topic infobox
	When User presses and hold the 'Shift' key on the keyboard
	And User presses and hold the 'Ctrl' key on the keyboard
	And User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Topic C' topic on Canvas
	Then 'Topic C' is outlined with a blue circuit
	When User releases all keys on keyboard
	And User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	And '' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header

@MindManager @EditingCapabilities @MultiSelect @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-489] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_add_the_property_values_to_the_same_property_for_all_the_selected_topics
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath           |
		| auto_test_SRND.mmap | AddProperties.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'Currency' property is displayed in 'Topic A' topic infobox
	And 'Currency' property is displayed in 'Topic B' topic infobox
	When User presses and hold the 'Shift' key on the keyboard
	And User presses and hold the 'Ctrl' key on the keyboard
	And User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	When User releases all keys on keyboard
	And User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	And '' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '120' value in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	Then '$120.00' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	And value '$120.00' is displayed for 'Currency' property in 'Topic A' topic infobox
	And value '$120.00' is displayed for 'Currency' property in 'Topic B' topic infobox

@MindManager @EditingCapabilities @MultiSelect @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-490] @Upd_Qase @JIRA[MMCV-9724]
Scenario: Verify_that_it_is_possible_to_edit_the_topic_property_on_some_topics_at_the_same_time
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath        |
		| auto_test_SRND.mmap | Properties.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'Currency' property is displayed in 'Topic A' topic infobox
	And value '$120.00' is displayed for 'Currency' property in 'Topic A' topic infobox
	And 'Currency' property is displayed in 'Topic C' topic infobox
	And value '$150.00' is displayed for 'Currency' property in 'Topic C' topic infobox
	When User presses and hold the 'Shift' key on the keyboard
	And User presses and hold the 'Ctrl' key on the keyboard
	And User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Topic C' topic on Canvas
	Then 'Topic C' is outlined with a blue circuit
	When User releases all keys on keyboard
	And User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	And '' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters '120' value in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	Then '$120.00' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	And value '$120.00' is displayed for 'Currency' property in 'Topic A' topic infobox
	And value '$120.00' is displayed for 'Currency' property in 'Topic C' topic infobox

@MindManager @EditingCapabilities @MultiSelect @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-491] @Upd_Qase
Scenario: Verify_that_all_property_fields_from_all_selected_topics_are_displayed_in_the_side_panel_but_they_are_blank_when_properties_are_present_on_some_of_the_selected_topics_but_not_others
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath             |
		| auto_test_SRND.mmap | MultiProperties.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User presses and hold the 'Shift' key on the keyboard
	And User presses and hold the 'Ctrl' key on the keyboard
	And User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	When User clicks 'Topic C' topic on Canvas
	Then 'Topic C' is outlined with a blue circuit
	When User clicks 'Topic D' topic on Canvas
	Then 'Topic D' is outlined with a blue circuit
	When User clicks 'Topic E' topic on Canvas
	Then 'Topic E' is outlined with a blue circuit
	When User clicks 'Topic F' topic on Canvas
	Then 'Topic F' is outlined with a blue circuit
	When User clicks 'Topic G' topic on Canvas
	Then 'Topic G' is outlined with a blue circuit
	When User releases all keys on keyboard
	And User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	And '' value is displayed in 'Text' property input field of 'PanelByName' side panel with 'Properties' header
	And '63' value is displayed in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	And '' value is displayed in 'Date and Time' property input field of 'PanelByName' side panel with 'Properties' header
	And '100%' value is displayed in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	And '11' value is displayed in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	And '' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header

@MindManager @EditingCapabilities @MultiSelect @Properties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-492] @Upd_Qase @JIRA[MMCV-9724]
Scenario: Verify_that_inputting_a_value_updates_the_value_on_all_topics_that_have_the_property_already_and_for_topics_that_don't_already_have_it,_the_property_is_added_and_updated_at_the_same_time
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath             |
		| auto_test_SRND.mmap | MultiProperties.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And User set zoom level to '40' via the side tool bar
	When User presses and hold the 'Shift' key on the keyboard
	And User presses and hold the 'Ctrl' key on the keyboard
	And User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	When User clicks 'Topic C' topic on Canvas
	Then 'Topic C' is outlined with a blue circuit
	When User clicks 'Topic D' topic on Canvas
	Then 'Topic D' is outlined with a blue circuit
	When User clicks 'Topic E' topic on Canvas
	Then 'Topic E' is outlined with a blue circuit
	When User clicks 'Topic F' topic on Canvas
	Then 'Topic F' is outlined with a blue circuit
	When User clicks 'Topic G' topic on Canvas
	Then 'Topic G' is outlined with a blue circuit
	When User releases all keys on keyboard
	And User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	And '' value is displayed in 'Text' property input field of 'PanelByName' side panel with 'Properties' header
	And '63' value is displayed in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	And '' value is displayed in 'Date and Time' property input field of 'PanelByName' side panel with 'Properties' header
	And '100%' value is displayed in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	And '11' value is displayed in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	And '' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	When User enters 'Allud0' value in 'Text' property input field of 'PanelByName' side panel with 'Properties' header
	Then 'Allud0' value is displayed in 'Text' property input field of 'PanelByName' side panel with 'Properties' header
	And value 'Allud0' is displayed for 'Text' property in 'Topic D' topic infobox
	And value 'Allud0' is displayed for 'Text' property in 'Topic A' topic infobox
	And value 'Allud0' is displayed for 'Text' property in 'Topic B' topic infobox
	And value 'Allud0' is displayed for 'Text' property in 'Topic C' topic infobox
	And value 'Allud0' is displayed for 'Text' property in 'Topic E' topic infobox
	And value 'Allud0' is displayed for 'Text' property in 'Topic F' topic infobox
	And value 'Allud0' is displayed for 'Text' property in 'Topic G' topic infobox
	When User enters '13' value in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	Then '13' value is displayed in 'Integer' property input field of 'PanelByName' side panel with 'Properties' header
	And value '13' is displayed for 'Integer' property in 'Topic E' topic infobox
	And value '13' is displayed for 'Integer' property in 'Topic D' topic infobox
	And value '13' is displayed for 'Integer' property in 'Topic A' topic infobox
	And value '13' is displayed for 'Integer' property in 'Topic B' topic infobox
	And value '13' is displayed for 'Integer' property in 'Topic C' topic infobox
	And value '13' is displayed for 'Integer' property in 'Topic F' topic infobox
	And value '13' is displayed for 'Integer' property in 'Topic G' topic infobox
	When User enters '75' value in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	Then '75%' value is displayed in 'Percentage' property input field of 'PanelByName' side panel with 'Properties' header
	And value '75%' is displayed for 'Percentage' property in 'Topic C' topic infobox
	And value '75%' is displayed for 'Percentage' property in 'Topic A' topic infobox
	And value '75%' is displayed for 'Percentage' property in 'Topic B' topic infobox
	And value '75%' is displayed for 'Percentage' property in 'Topic D' topic infobox
	And value '75%' is displayed for 'Percentage' property in 'Topic E' topic infobox
	And value '75%' is displayed for 'Percentage' property in 'Topic F' topic infobox
	And value '75%' is displayed for 'Percentage' property in 'Topic G' topic infobox
	When User enters '300' value in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	Then '$300.00' value is displayed in 'Currency' property input field of 'PanelByName' side panel with 'Properties' header
	And value '$300.00' is displayed for 'Currency' property in 'Topic G' topic infobox
	And value '$300.00' is displayed for 'Currency' property in 'Topic B' topic infobox
	And value '$300.00' is displayed for 'Currency' property in 'Topic C' topic infobox
	And value '$300.00' is displayed for 'Currency' property in 'Topic D' topic infobox
	And value '$300.00' is displayed for 'Currency' property in 'Topic E' topic infobox
	And value '$300.00' is displayed for 'Currency' property in 'Topic F' topic infobox
	And value '$300.00' is displayed for 'Currency' property in 'Topic A' topic infobox
	When User enters '63' value in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	Then '63' value is displayed in 'Number' property input field of 'PanelByName' side panel with 'Properties' header
	And value '63' is displayed for 'Number' property in 'Topic B' topic infobox
	And value '63' is displayed for 'Number' property in 'Topic A' topic infobox
	And value '63' is displayed for 'Number' property in 'Topic C' topic infobox
	And value '63' is displayed for 'Number' property in 'Topic D' topic infobox
	And value '63' is displayed for 'Number' property in 'Topic E' topic infobox
	And value '63' is displayed for 'Number' property in 'Topic F' topic infobox
	And value '63' is displayed for 'Number' property in 'Topic G' topic infobox