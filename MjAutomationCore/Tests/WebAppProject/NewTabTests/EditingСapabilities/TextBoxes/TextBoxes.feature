@retry(2)
Feature: TextBoxes
Check the functionality of Text Boxes

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                   |
		| auto_test_SRND.mmap | NavigationControlsMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
 
@MindManager @EditingCapabilities @TextBoxes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-531] @Upd_Qase @JIRA[MMCV-9842]
Scenario: To_verify_that_it_is_possible_to_create_a_text_box_in_the_web
	When User mouse over to the 'Insert Text Box' button on Tool panel
	Then 'Insert Text Box' tooltip is displayed to the User
	When User clicks 'Insert Text Box' button on Tools panel
	Then 'text_box' icon is displayed beside cursor
	When User clicks by coordinates '200' and '200' on Canvas
	Then 'text_box' icon is not displayed beside cursor
	When User waits '100' miliseconds
	Then Textbox is selected on Canvas
	Then Text box is editable on Canvas
	When User clicks by coordinates '250' and '250' on Canvas
	Then 'Text Label' Textbox is displayed on Canvas

@MindManager @EditingCapabilities @TextBoxes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-533] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_add_text_to_the_text_box_in_the_web
	Then 'Testbox' Textbox is displayed on Canvas
	When User doubleClick on Textbox with text 'Testbox' on Canvas
	Then Textbox is selected on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	Then User enter 'Testing' text into the Textbox
	Then 'Testing' Textbox is displayed on Canvas

@MindManager @EditingCapabilities @TextBoxes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-534] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_delete_text_from_the_text_box_using_backspace_key_in_the_web
	Then 'Testbox' Textbox is displayed on Canvas
	When User doubleClick on Textbox with text 'Testbox' on Canvas
	Then Textbox is selected on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User presses the 'Backspace' key on the keyboard
	Then 'Testbox' Textbox is not displayed on Canvas
	Then 'Tesbox' Textbox is displayed on Canvas

@MindManager @EditingCapabilities @TextBoxes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-534] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_delete_text_from_the_text_box_using_delete_key_in_the_web
	Then 'Testbox' Textbox is displayed on Canvas
	When User doubleClick on Textbox with text 'Testbox' on Canvas
	Then Textbox is selected on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User presses the 'Delete' key on the keyboard
	Then 'Testbox' Textbox is not displayed on Canvas
	Then 'Testox' Textbox is displayed on Canvas

@MindManager @EditingCapabilities @TextBoxes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-535] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_replace_text_in_the_text_box_with_another_text_in_the_web
	Then 'Testbox' Textbox is displayed on Canvas
	When User clicks 'MT1' topic on Canvas
	When User double clicks to the 'MT1' topic text on Canvas
	When User presses the Ctrl_C combination key on the keyboard
	When User clicks by coordinates '250' and '250' on Canvas
	When User doubleClick on Textbox with text 'Testbox' on Canvas
	Then Textbox is selected on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User doubleClick on Textbox with text 'Testbox' on Canvas
	When User presses the Ctrl_V combination key on the keyboard
	Then 'Testbox' Textbox is not displayed on Canvas
	Then 'MT1' Textbox is displayed on Canvas

@MindManager @EditingCapabilities @TextBoxes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-536] @Upd_Qase
Scenario: To_verify_that_user_can_select_and_multi_select_text_boxes
	Then 'Testbox' Textbox is displayed on Canvas
	Then 'SecondTextBox' Textbox is displayed on Canvas
	When User click on Textbox with text 'SecondTextBox' on canvas
	Then Textbox is selected on Canvas
	Then text editor is displayed in 'TextEditorPopup' container

@MindManager @EditingCapabilities @TextBoxes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-537] @Upd_Qase @JIRA[MMCV-10078]
Scenario: To_verify_that_user_can_multi_select_text_boxes_with_Ctrl_key
	Then 'Testbox' Textbox is displayed on Canvas
	Then 'SecondTextBox' Textbox is displayed on Canvas
	When User click on Textbox with text 'Testbox' on canvas
	Then Textbox is selected on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	Then '1' Textbox with border 'rgb(99, 165, 88)' is displayed on canvas
	When User presses and hold the 'Ctrl' key on the keyboard
	When User click on Textbox with text 'SecondTextBox' on canvas
	Then '2' Textbox with border 'rgb(99, 165, 88)' is displayed on canvas
	When User clicks by coordinates '200' and '200' on Canvas
	Then All Textbox is deselected on Canvas

@MindManager @EditingCapabilities @TextBoxes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-537] @Upd_Qase @JIRA[MMCV-10078]
Scenario: To_verify_that_user_can_multi_select_text_boxes_with_Shift_key
	Then 'Testbox' Textbox is displayed on Canvas
	Then 'SecondTextBox' Textbox is displayed on Canvas
	When User click on Textbox with text 'Testbox' on canvas
	Then Textbox is selected on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	Then '1' Textbox with border 'rgb(99, 165, 88)' is displayed on canvas
	When User presses and hold the 'Shift' key on the keyboard
	When User click on Textbox with text 'SecondTextBox' on canvas
	Then '2' Textbox with border 'rgb(99, 165, 88)' is displayed on canvas
	When User clicks by coordinates '200' and '200' on Canvas
	Then All Textbox is deselected on Canvas

@MindManager @EditingCapabilities @TextBoxes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-539] @Upd_Qase
Scenario: To_verify_that_user_can_apply_bold_font_formatting_to_text_boxes
	Then 'Testbox' Textbox is displayed on Canvas
	Then 'SecondTextBox' Textbox is displayed on Canvas
	When User click on Textbox with text 'SecondTextBox' on canvas
	Then Textbox is selected on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User doubleClick on Textbox with text 'SecondTextBox' on Canvas
	Then 'SecondTextBox' textbox text is displayed 'normal' style
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	Then 'bold' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'SecondTextBox' textbox text is displayed 'bold' style

@MindManager @EditingCapabilities @TextBoxes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-539] @Upd_Qase
Scenario: To_verify_that_user_can_apply_italic_font_formatting_to_text_boxes
	Then 'Testbox' Textbox is displayed on Canvas
	Then 'SecondTextBox' Textbox is displayed on Canvas
	When User click on Textbox with text 'SecondTextBox' on canvas
	Then Textbox is selected on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User doubleClick on Textbox with text 'SecondTextBox' on Canvas
	Then 'SecondTextBox' textbox text is displayed 'normal' style
	When User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	Then 'italic' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'SecondTextBox' textbox text is displayed 'italic' style

@MindManager @EditingCapabilities @TextBoxes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-539] @Upd_Qase
Scenario: To_verify_that_user_can_apply_underline_font_formatting_to_text_boxes
	Then 'Testbox' Textbox is displayed on Canvas
	Then 'SecondTextBox' Textbox is displayed on Canvas
	When User click on Textbox with text 'SecondTextBox' on canvas
	Then Textbox is selected on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User doubleClick on Textbox with text 'SecondTextBox' on Canvas
	Then 'SecondTextBox' textbox text is displayed 'normal' style
	When User clicks 'underline' button in font style section of text editor in 'TextEditorPopup' container
	Then 'underline' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'SecondTextBox' textbox text is displayed 'underline' style

@MindManager @EditingCapabilities @TextBoxes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-539] @Upd_Qase
Scenario: To_verify_that_user_can_apply_strikethrough_font_formatting_to_text_boxes
	Then 'Testbox' Textbox is displayed on Canvas
	Then 'SecondTextBox' Textbox is displayed on Canvas
	When User click on Textbox with text 'SecondTextBox' on canvas
	Then Textbox is selected on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User doubleClick on Textbox with text 'SecondTextBox' on Canvas
	Then 'SecondTextBox' textbox text is displayed 'normal' style
	When User clicks 'strikethrough' button in font style section of text editor in 'TextEditorPopup' container
	Then 'strikethrough' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'SecondTextBox' textbox text is displayed 'strikethrough' style