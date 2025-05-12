@retry(2)
Feature: NotesStyling
Check that it is possible to style notes

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'CT' topic on Canvas
	Then 'CT' is outlined with a blue circuit

@MindManager @Notes @NotesStyling @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-801] @Upd_Qase
Scenario: Verify_User_Can_Change_Note_Font
	When User clicks 'Notes' button of side Toolbox
	When User enters 'Note#1' text to input note field on Notes panel
	When User presses the Ctrl_A combination key on the keyboard
	When User click 'fontname' section in note editor and selects 'Delius' option in drop down options list
	Then 'Note#1' note text is displayed 'Delius' in font
	When User click 'fontname' section in note editor and selects 'Impact' option in drop down options list
	Then 'Note#1' note text is displayed 'Impact' in font
	When User click 'fontname' section in note editor and selects 'Helvetica' option in drop down options list
	Then 'Note#1' note text is displayed 'Helvetica' in font

@MindManager @Notes @NotesStyling @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-803] @Upd_Qase
Scenario: Verify_User_Can_Change_Note_Text_Bold
	When User clicks 'Notes' button of side Toolbox
	When User enters 'Note#1' text to input note field on Notes panel
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks on 'bold' button in note style section 'note-style' of 'PanelByName' side panel with 'Notes' header
	Then 'Note#1' text is displayed 'bold' style
	Then 'bold' button is selected in note syle section 'note-style' of 'PanelByName' side panel with 'Notes' header
	When User clicks on 'bold' button in note style section 'note-style' of 'PanelByName' side panel with 'Notes' header
	Then 'Note#1' text is displayed 'normal' style
	Then 'bold' button is unselected in note syle section 'note-style' of 'PanelByName' side panel with 'Notes' header
	
@MindManager @Notes @NotesStyling @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-804] @Upd_Qase
Scenario: Verify_It_Is_Possible_To_Make_Note_Text_Italic
	When User clicks 'Notes' button of side Toolbox
	When User enters 'Note#1' text to input note field on Notes panel
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks on 'italic' button in note style section 'note-style' of 'PanelByName' side panel with 'Notes' header
	Then 'Note#1' text is displayed 'italic' style
	Then 'italic' button is selected in note syle section 'note-style' of 'PanelByName' side panel with 'Notes' header
	When User clicks on 'italic' button in note style section 'note-style' of 'PanelByName' side panel with 'Notes' header
	Then 'Note#1' text is displayed 'normal' style
	Then 'italic' button is unselected in note syle section 'note-style' of 'PanelByName' side panel with 'Notes' header

@MindManager @Notes @NotesStyling @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-805] @Upd_Qase
Scenario: Verify_It_Is_Possible_To_Make_Note_Text_Underline
	When User clicks 'Notes' button of side Toolbox
	When User enters 'Note#1' text to input note field on Notes panel
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks on 'underline' button in note style section 'note-style' of 'PanelByName' side panel with 'Notes' header
	Then 'Note#1' text is displayed 'underline solid rgb(0, 0, 0)' style
	Then 'underline' button is selected in note syle section 'note-style' of 'PanelByName' side panel with 'Notes' header
	When User clicks on 'underline' button in note style section 'note-style' of 'PanelByName' side panel with 'Notes' header
	Then 'Note#1' text is displayed 'normal' style
	Then 'underline' button is unselected in note syle section 'note-style' of 'PanelByName' side panel with 'Notes' header
	 
@MindManager @Notes @NotesStyling @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-806] @Upd_Qase
Scenario: Verify_It_Is_Possible_To_Make_Note_Text_Strikethrough
	When User clicks 'Notes' button of side Toolbox
	When User enters 'Note#1' text to input note field on Notes panel
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks on 'strikethrough' button in note style section 'note-style' of 'PanelByName' side panel with 'Notes' header
	Then 'Note#1' text is displayed 'strikethrough' style
	Then 'strikethrough' button is selected in note syle section 'note-style' of 'PanelByName' side panel with 'Notes' header
	When User clicks on 'strikethrough' button in note style section 'note-style' of 'PanelByName' side panel with 'Notes' header
	Then 'Note#1' text is displayed 'normal' style
	Then 'strikethrough' button is unselected in note syle section 'note-style' of 'PanelByName' side panel with 'Notes' header

@MindManager @Notes @NotesStyling @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-807] @Upd_Qase
Scenario: Verify_User_Can_Change_Note_Font_Size
	When User clicks 'Notes' button of side Toolbox
	When User enters 'Note#1' text to input note field on Notes panel
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks in note editor and selects '10' option in 'text-style-size-option' selectbox
	Then 'Note#1' note text has '13.3333px' size
	When User clicks in note editor and selects '14' option in 'text-style-size-option' selectbox
	Then 'Note#1' note text has '18.6667px' size
	When User clicks in note editor and selects '72' option in 'text-style-size-option' selectbox
	Then 'Note#1' note text has '96px' size

@MindManager @Notes @NotesStyling @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-808] @Upd_Qase
Scenario: Verify_It_Is_Possible_To_Add_An_Image_To_Topic_Note
	When User clicks 'Notes' button of side Toolbox
	When User enters 'Note#1Note#2' text to input note field on Notes panel
	When User clicks Notes input field
	When User presses the 'Home' key on the keyboard
	When User presses the Ctrl_ArrowRight combination key on the keyboard
	When User clicks on 'note-icon-picture' button in note style section 'note-insert' of 'PanelByName' side panel with 'Notes' header
	When User uploads 'FruitsOutlineIcon.png' file through input type file to note field
	Then Image 'FruitsOutlineIcon.png' is displayed at position '1' between 'Note' and '#1Note#2' text to input note field on Notes panel

@MindManager @Notes @NotesStyling @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1392] @Upd_Qase
Scenario: Verify_Size_Can_Be_Changed_For_Topic_Text_Via_Arrow_Button
	When User clicks 'Notes' button of side Toolbox
	When User enters 'Note#1Note#2' text to input note field on Notes panel
	When User presses the Ctrl_A combination key on the keyboard
	Then 'Note#1Note#2' note text has '16px' size
	When User clicks 'up' arrow in font size section of note editor
	Then 'Note#1Note#2' note text has '18.6667px' size
	When User clicks 'down' arrow in font size section of note editor
	Then 'Note#1Note#2' note text has '16px' size
	When User selects from `0` to '6' the text symbol in 'CT' topic
	When User clicks 'up' arrow in font size section of note editor
	Then 'Note#1' note text has '18.6667px' size
	Then 'Note#2' note text has '16px' size
	When User selects from `0` to '6' the text symbol in 'CT' topic
	When User clicks 'down' arrow in font size section of note editor
	Then 'Note#1' note text has '16px' size
	Then 'Note#2' note text has '16px' size