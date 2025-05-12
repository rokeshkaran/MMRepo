@retry(2)
Feature: TextControls

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1395] @Upd_Qase
Scenario: Check_that_user_can_use_Ctrl_B_shortcut_to_toggle_bold_on
	When User clicks 'Text Formatting' topic on Canvas
	And User clicks on 'Font format' option in Floating Toolbar Popup
	And User presses the Ctrl_B combination key on the keyboard
	Then 'Text Formatting' topic text is displayed 'bold' style
	And 'bold' button is selected in font style section of text editor in 'TextEditorPopup' container

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1404] @Upd_Qase
Scenario: Check_that_user_can_use_Ctrl_B_shortcut_to_toggle_bold_off
	When User clicks 'Bold' topic on Canvas
	And User clicks on 'Font format' option in Floating Toolbar Popup
	And User presses the Ctrl_B combination key on the keyboard
	Then 'Bold' topic text is displayed 'normal' style
	And 'bold' button is unselected in font style section of text editor in 'TextEditorPopup' container

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1396] @Upd_Qase
Scenario: Check_that_user_can_use_Ctrl_I_shortcut_to_toggle_italic_on
	When User clicks 'Text Formatting' topic on Canvas
	And User clicks on 'Font format' option in Floating Toolbar Popup
	And User presses the Ctrl_I combination key on the keyboard
	Then 'Text Formatting' topic text is displayed 'italic' style
	And 'italic' button is selected in font style section of text editor in 'TextEditorPopup' container

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1396] @JIRA[MMCV-10033] @Upd_Qase
Scenario: Check_that_user_can_use_Ctrl_I_shortcut_to_toggle_italic_on_to_part_of_topic_text
	When User clicks 'Text Formatting' topic on Canvas
	And User clicks on text in the 'Text Formatting' topic on Canvas
	And User presses the 'Home' key on the keyboard
	And User selects from `0` to '4' the text symbol in 'Text Formatting' topic
	And User presses the Ctrl_I combination key on the keyboard
	Then 'Text' topic text is displayed 'italic' style
	And 'italic' button is selected in font style section of text editor in 'TextEditorPopup' container

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1396] @JIRA[MMCV-10034] @Upd_Qase
Scenario: Check_that_text_style_changes_that_made_by_shortcut_is_saved_on_the_topic
	When User clicks 'Text Formatting' topic on Canvas
	And User clicks on text in the 'Text Formatting' topic on Canvas
	And User presses the Ctrl_A combination key on the keyboard
	And User presses the Ctrl_I combination key on the keyboard
	Then 'Text Formatting' topic text is displayed 'italic' style
	When User clicks by coordinates '200' and '50' on Canvas
	And User clicks 'Text Formatting' topic on Canvas
	And User clicks on text in the 'Text Formatting' topic on Canvas
	Then 'Text Formatting' topic text is displayed 'italic' style

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1399] @Upd_Qase
Scenario: Check_that_user_can_use_Ctrl_Shift_Greater_Than_shortcut_to_increase_font_size
	When User clicks 'Text Formatting' topic on Canvas
	And User clicks on 'Font format' option in Floating Toolbar Popup
	And User presses the CTRL_SHIFT_GreaterThan combination key on the keyboard
	Then 'Text Formatting' topic text has '18.6667' size
	And font size '14' is displayed in font style section of text editor in 'TextEditorPopup' container

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1400] @Upd_Qase
Scenario: Check_that_user_can_use_Ctrl_Shift_Less_Than_shortcut_to_decrease_font_size
	When User clicks 'Text Formatting' topic on Canvas
	And User clicks on 'Font format' option in Floating Toolbar Popup
	And User presses the CTRL_SHIFT_LessThan combination key on the keyboard
	Then 'Text Formatting' topic text has '13.3333' size
	And font size '10' is displayed in font style section of text editor in 'TextEditorPopup' container

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1405] @Upd_Qase
Scenario: Check_that_user_can_use_Ctrl_B_shortcut_to_toggle_italic_off
	When User clicks 'Italic' topic on Canvas
	And User clicks on 'Font format' option in Floating Toolbar Popup
	And User presses the Ctrl_I combination key on the keyboard
	Then 'Italic' topic text is displayed 'normal' style
	And 'italic' button is unselected in font style section of text editor in 'TextEditorPopup' container

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1397] @Upd_Qase
Scenario: Check_that_user_can_use_Ctrl_B_shortcut_to_toggle_underline_on
	When User clicks 'Text Formatting' topic on Canvas
	And User clicks on 'Font format' option in Floating Toolbar Popup
	And User presses the Ctrl_U combination key on the keyboard
	Then 'Text Formatting' topic text is displayed 'underline' style
	And 'underline' button is selected in font style section of text editor in 'TextEditorPopup' container

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1406] @Upd_Qase
Scenario: Check_that_user_can_use_Ctrl_B_shortcut_to_toggle_underline_off
	When User clicks 'Underline' topic on Canvas
	And User clicks on 'Font format' option in Floating Toolbar Popup
	And User presses the Ctrl_U combination key on the keyboard
	Then 'Underline' topic text is displayed 'normal' style
	And 'underline' button is unselected in font style section of text editor in 'TextEditorPopup' container

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1407] @Upd_Qase
Scenario: Check_that_user_can_use_Ctrl_B_shortcut_to_toggle_strikethrough_on
	When User clicks 'Text Formatting' topic on Canvas
	And User clicks on 'Font format' option in Floating Toolbar Popup
	And User presses the CTRL_SHIFT_S combination key on the keyboard
	Then 'Text Formatting' topic text is displayed 'strikethrough' style
	And 'strikethrough' button is selected in font style section of text editor in 'TextEditorPopup' container

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1398] @Upd_Qase
Scenario: Check_that_user_can_use_Ctrl_B_shortcut_to_toggle_strikethrough_off
	When User clicks 'Strikethrough' topic on Canvas
	And User clicks on 'Font format' option in Floating Toolbar Popup
	And User presses the CTRL_SHIFT_S combination key on the keyboard
	Then 'Strikethrough' topic text is displayed 'normal' style
	And 'strikethrough' button is unselected in font style section of text editor in 'TextEditorPopup' container

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1408] @Upd_Qase
Scenario: To_verify_that_user_can start_topic_text_editing_using_F2_key
	When User clicks 'Text Formatting' topic on Canvas
	And User presses the 'F2' key on the keyboard
	And User enters 'Start' text to the topic on Canvas
	And User clicks by coordinates '100' and '100' on Canvas
	Then 'StartText Formatting' topic is displayed on Canvas

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1469] @Upd_Qase
Scenario: To_verify_that_user_can_enter_line_break_in_topic_using_Shift_Enter_keys
	Then 'Text Formatting' topic is displayed on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	And User clicks to the 'Text Formatting' topic text on Canvas
	And User enters 'Start' text to the topic on Canvas
	And User presses the Shift and 'Enter' key combination on the keyboard
	And User releases all keys on keyboard
	Then linebreak occurs in topic between 'Text ForStart' and 'matting' text

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1470] @Upd_Qase
Scenario: To_verify_that_user_can_move_to_the_beginning_of_line_in_topic_text_using_Home_key_when_at_end_text
	Then 'FT3' topic is displayed on Canvas
	When User clicks 'FT3' topic on Canvas
	And User clicks to the 'FT3' topic text on Canvas
	And User presses the 'End' key on the keyboard
	And User waits '500' miliseconds
	And User presses the 'Home' key on the keyboard
	And User enters 'Start' text to the topic on Canvas
	And User clicks by coordinates '100' and '100' on Canvas
	Then 'StartFT3' topic is displayed on Canvas

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1470] @Upd_Qase
Scenario: To_verify_that_user_can_move_to_the_beginning_of_line_in_topic_text_using_Home_key_when_at_middle_text
	Then 'FT3' topic is displayed on Canvas
	When User clicks 'FT3' topic on Canvas
	And User clicks to the 'FT3' topic text on Canvas
	And User waits '500' miliseconds
	And User presses the 'Home' key on the keyboard
	And User enters 'Start' text to the topic on Canvas
	And User clicks by coordinates '100' and '100' on Canvas
	Then 'StartFT3' topic is displayed on Canvas

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1471] @Upd_Qase
Scenario: To_verify_that_user_can_move_to_the_beginning_of_line_in_multilinetopic_text_using_Ctrl_Home_key_when_at_end_text
	Then 'Text Formatting' topic is displayed on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	And User waits '500' miliseconds
	And User double clicks to the 'Text Formatting' topic text on Canvas
	And User waits '500' miliseconds
	And User presses the 'End' key on the keyboard
	And User releases all keys on keyboard
	And User presses the Shift and 'Enter' key combination on the keyboard
	And User releases all keys on keyboard
	And User enters 'Hello World Test' text to the topic on Canvas
	And User clicks by coordinates '100' and '100' on Canvas
	Then linebreak occurs in topic between 'Text Formatting' and 'Hello World Test' text
	When User clicks 'Text Formatting' topic on Canvas
	And User clicks to the 'Text Formatting' topic text on Canvas
	And User waits '500' miliseconds
	And User presses the Ctrl and 'End' key combination on the keyboard
	And User releases all keys on keyboard
	And User presses the Ctrl and 'Home' key combination on the keyboard
	And User releases all keys on keyboard
	And User enters 'Start' text to the topic on Canvas
	And User clicks by coordinates '100' and '100' on Canvas
	Then linebreak occurs in topic between 'StartText Formatting' and 'Hello World Test' text

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1471] @Upd_Qase
Scenario: To_verify_that_user_can_move_to_the_beginning_of_line_in_multilinetopic_text_using_Ctrl_Home_key_when_at_middle_text
	Then 'Text Formatting' topic is displayed on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	And User waits '500' miliseconds
	And User double clicks to the 'Text Formatting' topic text on Canvas
	And User waits '500' miliseconds
	And User presses the 'End' key on the keyboard
	And User releases all keys on keyboard
	And User presses the Shift and 'Enter' key combination on the keyboard
	And User releases all keys on keyboard
	And User enters 'Hello World Test' text to the topic on Canvas
	And User clicks by coordinates '100' and '100' on Canvas
	Then linebreak occurs in topic between 'Text Formatting' and 'Hello World Test' text
	When User clicks 'Text Formatting' topic on Canvas
	And User clicks to the 'Text Formatting' topic text on Canvas
	And User waits '500' miliseconds
	And User presses the Ctrl and 'Home' key combination on the keyboard
	And User releases all keys on keyboard
	And User enters 'Start' text to the topic on Canvas
	And User clicks by coordinates '100' and '100' on Canvas
	Then linebreak occurs in topic between 'StartText Formatting' and 'Hello World Test' text

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1472] @Upd_Qase
Scenario: To_verify_that_user_can_move_to_the_end_of_line_in_multilinetopic_text_using_Ctrl_end_key_when_at_start_text
	Then 'Text Formatting' topic is displayed on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	And User waits '500' miliseconds
	And User double clicks to the 'Text Formatting' topic text on Canvas
	And User waits '500' miliseconds
	And User presses the 'End' key on the keyboard
	And User releases all keys on keyboard
	And User presses the Shift and 'Enter' key combination on the keyboard
	And User releases all keys on keyboard
	And User enters 'Hello World Test' text to the topic on Canvas
	And User clicks by coordinates '100' and '100' on Canvas
	Then linebreak occurs in topic between 'Text Formatting' and 'Hello World Test' text
	When User clicks 'Text Formatting' topic on Canvas
	And User clicks to the 'Text Formatting' topic text on Canvas
	And User waits '500' miliseconds
	And User presses the Ctrl and 'Home' key combination on the keyboard
	And User releases all keys on keyboard
	And User presses the Ctrl and 'End' key combination on the keyboard
	And User releases all keys on keyboard
	And User enters 'End' text to the topic on Canvas
	And User clicks by coordinates '100' and '100' on Canvas
	Then linebreak occurs in topic between 'Text Formatting' and 'Hello World TestEnd' text

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1472] @Upd_Qase
Scenario: To_verify_that_user_can_move_to_the_end_of_line_in_multilinetopic_text_using_Ctrl_end_key_when_at_middle_text
	Then 'Text Formatting' topic is displayed on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	And User waits '500' miliseconds
	And User double clicks to the 'Text Formatting' topic text on Canvas
	And User waits '500' miliseconds
	And User presses the 'End' key on the keyboard
	And User releases all keys on keyboard
	And User presses the Shift and 'Enter' key combination on the keyboard
	And User releases all keys on keyboard
	And User enters 'Hello World Test' text to the topic on Canvas
	And User clicks by coordinates '100' and '100' on Canvas
	Then linebreak occurs in topic between 'Text Formatting' and 'Hello World Test' text
	When User clicks 'Text Formatting' topic on Canvas
	And User clicks to the 'Text Formatting' topic text on Canvas
	And User waits '500' miliseconds
	And User presses the Ctrl and 'End' key combination on the keyboard
	And User releases all keys on keyboard
	And User enters 'End' text to the topic on Canvas
	And User clicks by coordinates '100' and '100' on Canvas
	Then linebreak occurs in topic between 'Text Formatting' and 'Hello World TestEnd' text

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1473] @Upd_Qase
Scenario: To_verify_that_user_can_cancel_editing_of_topic_text_using_Esc_key
	Then 'FT3' topic is displayed on Canvas
	When User clicks 'FT3' topic on Canvas
	And User waits '500' miliseconds
	And User clicks to the 'FT3' topic text on Canvas
	And User enters 'Middle' text to the topic on Canvas
	And User presses the 'Esc' key on the keyboard
	And User waits '500' miliseconds
	Then text cursor is not displayed on Canvas
	And 'FT3' topic is displayed on Canvas

@MindManager @Keyboard_Shortcuts @TextControls @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1475] @Upd_Qase
Scenario: To_verify_that_user_can_select_all_topic_text_using_Ctrl_A_keys
	When User clicks 'This is a multiline' topic on Canvas
	And User waits '500' miliseconds
	And User clicks to the 'This is a multiline' topic text on Canvas
	And User waits '500' miliseconds
	And User presses the Ctrl and 'A' key combination on the keyboard
	And User releases all keys on keyboard
	And User waits '500' miliseconds
	And User enters 'NewTextAddedToTopic' text to the topic on Canvas
	And User clicks by coordinates '100' and '100' on Canvas
	Then 'NewTextAddedToTopic' topic is displayed on Canvas