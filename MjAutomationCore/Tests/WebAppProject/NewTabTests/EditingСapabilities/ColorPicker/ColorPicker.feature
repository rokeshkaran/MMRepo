@retry(2)
Feature: ColorPicker
Check the Color Picker Feature

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser

@MindManager @EditingCapabilities @ColorPicker @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-526] @Upd_Qase
Scenario: To_verify_that_color_picker_has_all_feature
	When User clicks 'MT' topic on Canvas
	And User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	And 'Fill Color' tab is displayed in Color Picker Header
	And 'Line Color' tab is displayed in Color Picker Header
	And Color Canvas is displayed on Color Picker
	And Color Slider is displayed on Color Picker
	And Eyedropper button is displayed on Color Picker
	And Color Preview is displayed on Color Picker
	And Colour Hex code field is displayed on Color Picker
	And Colour Palette is displayed on Color Picker
	And 'Apply' button is displayed on Color Picker
	And 'Cancel' button is displayed on Color Picker

@MindManager @EditingCapabilities @ColorPicker @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-527] @Upd_Qase
Scenario: To_verify_that_eyedropper_tool_can_pick_new_colors_from_map
	When User clicks 'MT' topic on Canvas
	And User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	And Eyedropper button is displayed on Color Picker
	When User click Eyedropper button on Color Picker
	And User hovers cursor the 'ImageTopic2' topic
	And User moves cursor by '50' '50' coordinates on Canvas
	Then Magnifier Cursor is displayed on Canvas
	When User hovers cursor the 'Format' topic
	And User clicks 'Format' topic on Canvas
	Then Colour Hex code '#fbb819' is displayed on Hex Code Color Picker
	And Color slider has value '18.969px' in the color picker
	When User click Eyedropper button on Color Picker
	And User clicks 'Apply' button in Color Picker window
	Then 'MT' topic has Fill Color 'rgb(251, 184, 25)' on Canvas

@MindManager @EditingCapabilities @ColorPicker @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-527] @Upd_Qase @JIRA[MMCV-9220]
Scenario: To_verify_that_magnifier_cursor_is_not_displayed_after_clickong_on_ok_button
	When User clicks 'MT' topic on Canvas
	And User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	And Eyedropper button is displayed on Color Picker
	When User click Eyedropper button on Color Picker
	And User hovers cursor the 'Format' topic
	And User clicks 'Format' topic on Canvas
	Then Colour Hex code '#fbb819' is displayed on Hex Code Color Picker
	And Color slider has value '18.969px' in the color picker
	When User click Eyedropper button on Color Picker
	And User hovers cursor the 'ImageTopic2' topic
	And User moves cursor by '50' '50' coordinates on Canvas
	Then Magnifier Cursor is not displayed on Canvas

@MindManager @EditingCapabilities @ColorPicker @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-528] @Upd_Qase
Scenario: To_verify_that_any_colour_selected_is_reflected_on_preview
	When User clicks 'MT' topic on Canvas
	And User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	And Color Preview has color 'rgb(236, 244, 250)' on Color Picker
	When User click mouse by '10' '10' coordinates in field color Area
	Then Color Preview has not color 'rgb(236, 244, 250)' on Color Picker
	When User clicks reset color checkbox in palette container on Color picker
	Then Color Preview has color 'rgb(236, 244, 250)' on Color Picker
	When User moves cursor by '20' '20' coordinates to field color Picker
	Then Color Preview has not color 'rgb(236, 244, 250)' on Color Picker
	When User clicks 'rgb(50, 131, 192)' checkbox in palette container on Color picker
	Then Color Preview has color 'rgb(50, 131, 192)' on Color Picker
	When User click Eyedropper button on Color Picker
	And User hovers cursor the 'ImageTopic2' topic
	And User moves cursor by '50' '50' coordinates on Canvas
	Then Magnifier Cursor is displayed on Canvas
	When User hovers cursor the 'Format' topic
	And User clicks 'Format' topic on Canvas
	Then Color Preview has color 'rgb(251, 184, 25)' on Color Picker
	When User clicks 'Apply' button in Color Picker window
	Then 'MT' topic has Fill Color 'rgb(251, 184, 25)' on Canvas

@MindManager @EditingCapabilities @ColorPicker @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-529] @Upd_Qase
Scenario: To_verify_that_hex_code_can_be_added_into_colour_code
	When User clicks 'MT' topic on Canvas
	And User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#800080' hex code in input field on Color picker
	And User presses the 'Enter' key on the keyboard
	Then Color Preview has color 'rgb(128, 0, 128)' on Color Picker
	And checkbox with color 'rgb(128, 0, 128)' is displayed in palette container on Color picker
	When User enters '#FF0000' hex code in input field on Color picker
	And User presses the 'Enter' key on the keyboard
	Then Color Preview has color 'rgb(255, 0, 0)' on Color Picker
	And checkbox with color 'rgb(255, 0, 0)' is displayed in palette container on Color picker
	When User enters '#1bff00' hex code in input field on Color picker
	And User presses the 'Enter' key on the keyboard
	Then Color Preview has color 'rgb(27, 255, 0)' on Color Picker
	And checkbox with color 'rgb(27, 255, 0)' is displayed in palette container on Color picker
	And checkbox with color 'rgb(128, 0, 128)' is displayed in palette container on Color picker
	And checkbox with color 'rgb(255, 0, 0)' is displayed in palette container on Color picker

@MindManager @EditingCapabilities @ColorPicker @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-530] @Upd_Qase
Scenario: To_verify_that_color_can_be_reset_to_default
	When User clicks 'MT' topic on Canvas
	And User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#800080' hex code in input field on Color picker
	And User presses the 'Enter' key on the keyboard
	And User clicks 'Apply' button in Color Picker window
	Then 'MT' topic has Fill Color 'rgb(128, 0, 128)' on Canvas
	When User clicks 'MT' topic on Canvas
	And User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User clicks reset color checkbox in palette container on Color picker
	Then Colour Hex code '#ecf4fa' is displayed on Hex Code Color Picker
	And Color Preview has color 'rgb(236, 244, 250)' on Color Picker
	When User clicks 'Apply' button in Color Picker window
	Then 'MT' topic has Fill Color 'rgb(236, 244, 250)' on Canvas

@MindManager @EditingCapabilities @ColorPicker @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2352] @JIRA[MMCV-8753]
Scenario: To_verify_that_Color_can_be_selected_from_color_palette_in_color_picker
	When User clicks 'MT' topic on Canvas
	And User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#800080' hex code in input field on Color picker
	And User presses the 'Enter' key on the keyboard
	And User enters '#FF0000' hex code in input field on Color picker
	And User presses the 'Enter' key on the keyboard
	And User enters '#1bff00' hex code in input field on Color picker
	And User presses the 'Enter' key on the keyboard
	And User clicks 'Cancel' button in Color Picker window
	And User clicks '12345' topic on Canvas
	And User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	And checkbox with color 'rgb(27, 255, 0)' is displayed in palette container on Color picker
	And checkbox with color 'rgb(128, 0, 128)' is displayed in palette container on Color picker
	And checkbox with color 'rgb(255, 0, 0)' is displayed in palette container on Color picker
	When User clicks 'rgb(27, 255, 0)' checkbox in palette container on Color picker
	Then Color Preview has color 'rgb(27, 255, 0)' on Color Picker
	And Colour Hex code '#800080' is displayed on Hex Code Color Picker
	And Point in field color located in '220' '81' coordinated
	And Color slider has value '183' in the color picker
	When User clicks 'Apply' button in Color Picker window
	Then '12345' topic has Fill Color 'rgb(27, 255, 0)' on Canvas

@MindManager @EditingCapabilities @ColorPicker @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2352] @Upd_Qase
Scenario: To_verify_that_user_can_cancel_chosen_color_in_color_picker
	When User clicks 'MT' topic on Canvas
	And User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#800080' hex code in input field on Color picker
	And User presses the 'Enter' key on the keyboard
	And User clicks 'Cancel' button in Color Picker window
	Then 'MT' topic has Fill Color 'rgb(236, 244, 250)' on Canvas