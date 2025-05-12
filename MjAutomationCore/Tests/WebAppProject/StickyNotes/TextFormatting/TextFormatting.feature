@retry(2)
Feature: TextFormatting
Check text formatting of sticky notes

Background: Pre-condition
	Given User uploads following files to '/' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | StickyNotes.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Sticky Note 2' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky Note 2' topic on Canvas
	And Floating Toolbar is displayed on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	And font size 'auto' is displayed in font style section of text editor in 'TextEditorPopup' container

@MindManager @StickyNotes @TextFormatting @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2210] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_add_text_to_the_sticky_notes
	When User clicks on text in the 'Sticky Note 2' topic on Canvas
	And User enters 'test ' text to the topic on Canvas
	Then text 'Sticky test Note 2' is displayed to the topic on Canvas

@MindManager @StickyNotes @TextFormatting @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2214] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_apply_font_formatting_to_the_sticky_notes
	When User clicks 'Sticky Note 1' topic on Canvas
	Then Floating Toolbar is displayed on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	And User clicks font family section in text editor and selects 'Barrio' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'Sticky Note 1' topic text is displayed  'Barrio' in font
	When User clicks font size section in text editor and selects '14' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	Then font size '14' is displayed in font style section of text editor in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#ff0000' hex code in input field on Color picker
	And User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	And 'Sticky Note 1' topic text has 'rgba(255, 0, 0, 1)' color on Canvas

@MindManager @StickyNotes @TextFormatting @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2214] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_apply_font_style_to_the_sticky_notes
	When User clicks 'Sticky Note 1' topic on Canvas
	Then Floating Toolbar is displayed on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	And User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	Then 'Sticky Note 1' topic text is displayed 'bold' style
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	And User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	Then 'Sticky Note 1' topic text is displayed 'italic' style
	When User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	And User clicks 'underline' button in font style section of text editor in 'TextEditorPopup' container
	Then 'Sticky Note 1' topic text is displayed 'underline' style
	When User clicks 'underline' button in font style section of text editor in 'TextEditorPopup' container
	And User clicks 'strikethrough' button in font style section of text editor in 'TextEditorPopup' container
	Then 'Sticky Note 1' topic text is displayed 'strikethrough' style

@MindManager @StickyNotes @TextFormatting @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2216] @Upd_Qase
Scenario: To_verify_that_user_can_change_text_alignment_to_the_sticky_notes
	When User clicks 'Sticky Note 1' topic on Canvas
	Then Floating Toolbar is displayed on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	And User clicks align icon in text editor and selects 'right' option in 'text-alignment' selectbox in 'TextEditorPopup' container
	Then 'Sticky Note 1' topic text is aligned 'right'
	And 'Sticky Note 1' topic text container width is '87.2031'
	When User clicks 'Sticky Note 1' topic on Canvas
	And User enters 'test alignment ' text to the topic on Canvas
	Then text 'Sticky test alignment Note 1' is displayed to the topic on Canvas
	And 'Sticky test alignment Note 1' topic text is aligned 'right'
	And 'Sticky test alignment Note 1' topic text container width is '154.391'

@MindManager @StickyNotes @TextFormatting @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2348] @Upd_Qase
Scenario: To_verify_that_text_is_automatically_reduced_to_fit_the_topic_in_the_sticky_notes
	When User clicks 'Sticky Note 1' topic on Canvas
	And User clicks on text in the 'Sticky Note 1' topic on Canvas
	And User enters 'This_is_a_test_to_determine_if_the_three_dots_appears' text to the topic on Canvas
	And User presses the 'Enter' key on the keyboard
	Then text is truncated and ellipsis 'Sticky This_is_a_test_to_determine_if_the…' is displayed in Topic
	And font size 'auto' is displayed in font style section of text editor in 'TextEditorPopup' container

@MindManager @StickyNotes @TextFormatting @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2348] @Upd_Qase
Scenario: To_verify_that_text_is_automatically_reduced_to_fit_the_topic_after_reducing_sticky_note_size
	When User clicks 'Sticky Note 1' topic on Canvas
	And User drag the 'right' edge of the 'Sticky Note 1' topic by '-30' and '-30' coordinates on Canvas
	And User clicks 'Sticky Note 2' topic on Canvas
	And User clicks 'St…' topic on Canvas
	And User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	And font size 'auto' is displayed in font style section of text editor in 'TextEditorPopup' container
	And text is truncated and ellipsis 'St…' is displayed in Topic