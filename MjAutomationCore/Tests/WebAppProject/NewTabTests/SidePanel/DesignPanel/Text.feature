@retry(2)
Feature: Text
Check Text functionality of Design panel

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'MT1' topic on Canvas
	When User clicks menu button with 'design' name in 'ToolbarPageElement' container
	Then 'design' Menu is displayed to User
	When User clicks button with 'text' name in 'design' menu
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Text' section is displayed as expanded of 'PanelByName' side panel with 'Design' header

@MindManager @Side_Toolbox @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1225] @Health_Check @Upd_Qase
Scenario: Check_that_Font_style_and_text_size_can_be_changed_via_side_panel
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'SidePanel' container
	Then 'MT1' topic text is displayed  'Times New Roman' in font
	When User clicks font size section in text editor and selects '14' option in 'text-style-size' selectbox in 'SidePanel' container
	Then 'MT1' topic text has '18.6667' size

@MindManager @Side_Toolbox @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1225] @Upd_Qase
Scenario: Check_that_Bold_Italic_Underline_Strikethrough_font_style_can_be_changed_via_the_side_panel
	When User clicks 'italic' button in font style section of text editor in 'SidePanel' container
	Then 'italic' button is selected in font style section of text editor in 'SidePanel' container
	Then 'MT1' topic text is displayed 'italic' style
	When User clicks 'bold' button in font style section of text editor in 'SidePanel' container
	Then 'bold' button is selected in font style section of text editor in 'SidePanel' container
	When User clicks 'underline' button in font style section of text editor in 'SidePanel' container
	Then 'underline' button is selected in font style section of text editor in 'SidePanel' container
	When User clicks 'strikethrough' button in font style section of text editor in 'SidePanel' container
	Then 'strikethrough' button is selected in font style section of text editor in 'SidePanel' container
	Then 'MT1' topic text is displayed 'bold underline line-through' style

@MindManager @Top_Menu @Design @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1225] @Upd_Qase
Scenario: Check_Text_Align_button_functionality
	When User clicks 'align-left' button in font style section of text editor in 'SidePanel' container
	Then 'align-left' button is selected in font style section of text editor in 'SidePanel' container
	Then 'MT1' topic text is aligned 'left'
	When User clicks 'align-right' button in font style section of text editor in 'SidePanel' container
	Then 'align-right' button is selected in font style section of text editor in 'SidePanel' container
	Then 'MT1' topic text is aligned 'right'
	When User clicks 'align-center' button in font style section of text editor in 'SidePanel' container
	Then 'align-center' button is selected in font style section of text editor in 'SidePanel' container
	Then 'MT1' topic text is aligned 'center'
	
@MindManager @Top_Menu @Design @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1225] @Upd_Qase
Scenario: Check_Text_Color_button_functionality
	When User clicks Color button in text editor in 'SidePanel' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'MT1' topic text has 'rgba(244, 177, 16, 1)' color on Canvas

@MindManager @Side_Panel @Design @Text @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-833] @Upd_Qase
Scenario: Verify_the_correct_values_are_displayed_on_the_side_panel_when_multiple_topic_are_selected
	When User selects first 'FT2' and second 'MT1ST1ST' topic on Canvas
	Then 'Segoe UI' font family option is selected in text editor on 'SidePanel' container
	When User selects first 'FT3' and second 'MT1' topic on Canvas
	Then no font family option is selected in text editor on 'SidePanel' container

@MindManager @Side_Panel @Design @Text @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-834] @Upd_Qase
Scenario: Verify_font_style_can_be_changed_via_side_panel
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'SidePanel' container
	Then 'MT1' topic text is displayed  'Times New Roman' in font
	When User clicks font family section in text editor and selects 'Delius' option in 'font-family' selectbox in 'SidePanel' container
	Then 'MT1' topic text is displayed  'Delius' in font
	When User clicks font family section in text editor and selects 'Helvetica' option in 'font-family' selectbox in 'SidePanel' container
	Then 'MT1' topic text is displayed  'Helvetica' in font

@MindManager @Side_Panel @Design @Text @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-834] @Upd_Qase
Scenario: Verify_font_style_of_multiple_topics_can_be_changed_via_side_panel
	When User selects first 'MT3' and second 'MT4' and third 'MT5' topic on Canvas
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'SidePanel' container
	Then 'MT3' topic text is displayed  'Times New Roman' in font
	Then 'MT4' topic text is displayed  'Times New Roman' in font
	Then 'MT5' topic text is displayed  'Times New Roman' in font

@MindManager @Side_Panel @Design @Text @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-835] @Upd_Qase
Scenario: Verify_size_can_be_changed_via_side_panel
	When User clicks font size section in text editor and selects '14' option in 'text-style-size' selectbox in 'SidePanel' container
	Then 'MT1' topic text has '18.6667' size
	When User clicks font size section in text editor and selects '8' option in 'text-style-size' selectbox in 'SidePanel' container
	Then 'MT1' topic text has '10.6667' size
	When User clicks font size section in text editor and selects '72' option in 'text-style-size' selectbox in 'SidePanel' container
	Then 'MT1' topic text has '96' size
	When User selects first 'MT3' and second 'MT4' and third 'MT5' topic on Canvas
	When User clicks font size section in text editor and selects '14' option in 'text-style-size' selectbox in 'SidePanel' container
	Then 'MT3' topic text has '18.6667' size
	Then 'MT4' topic text has '18.6667' size
	Then 'MT5' topic text has '18.6667' size
  
@MindManager @Side_Panel @Design @Text @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-836] @Upd_Qase
Scenario: Verify_that_color_can_be_changed_via_side_panel
	When User clicks Color button in text editor in 'SidePanel' container
	Then Color Picker window is displayed to User
	When User click Eyedropper button on Color Picker
	When User hovers cursor the 'MT3' topic
	When User moves cursor by '50' '50' coordinates on Canvas
	Then Magnifier Cursor is displayed on Canvas
	When User hovers cursor the 'RL1' topic
	When User clicks 'RL1' topic on Canvas
	When User clicks 'Apply' button in Color Picker window
	Then 'MT1' topic text has 'rgba(251, 209, 188, 1)' color on Canvas
	When User clicks 'FT2' topic on Canvas
	When User clicks Color button in text editor in 'SidePanel' container
	When User clicks 'rgb(251, 209, 188)' checkbox in palette container on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'FT2' topic text has 'rgba(251, 209, 188, 1)' color on Canvas
	When User selects first 'CT' and second 'MT4' topic on Canvas
	When User clicks Color button in text editor in 'SidePanel' container
	When User enters '#800080' hex code in input field on Color picker
	When User presses the 'Enter' key on the keyboard
	When User clicks 'Apply' button in Color Picker window
	Then 'CT' topic text has 'rgba(128, 0, 128, 1)' color on Canvas
	Then 'MT4' topic text has 'rgba(128, 0, 128, 1)' color on Canvas

@MindManager @Side_Panel @Design @Text @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-837] @Upd_Qase
Scenario: Verify_bold_font_style_can_be_changed_via_side_panel
	Then 'MT1' topic text is displayed 'normal' style
	When User clicks 'bold' button in font style section of text editor in 'SidePanel' container
	Then 'MT1' topic text is displayed 'bold' style
	Then 'bold' button is selected in font style section of text editor in 'SidePanel' container
	When User selects first 'MT3' and second 'MT4' and third 'MT5' topic on Canvas
	When User clicks 'bold' button in font style section of text editor in 'SidePanel' container
	Then 'MT3' topic text is displayed 'bold' style
	Then 'MT4' topic text is displayed 'bold' style
	Then 'MT5' topic text is displayed 'bold' style
	Then 'bold' button is selected in font style section of text editor in 'SidePanel' container
	When User clicks 'bold' button in font style section of text editor in 'SidePanel' container
	Then 'MT3' topic text is displayed 'normal' style
	Then 'MT4' topic text is displayed 'normal' style
	Then 'MT5' topic text is displayed 'normal' style
	Then 'bold' button is unselected in font style section of text editor in 'SidePanel' container

@MindManager @Side_Panel @Design @Text @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-838] @Upd_Qase
Scenario: Verify_italic_font_style_can_be_changed_via_side_panel
	Then 'MT1' topic text is displayed 'normal' style
	When User clicks 'italic' button in font style section of text editor in 'SidePanel' container
	Then 'MT1' topic text is displayed 'italic' style
	Then 'italic' button is selected in font style section of text editor in 'SidePanel' container
	When User selects first 'MT3' and second 'MT4' and third 'MT5' topic on Canvas
	When User clicks 'italic' button in font style section of text editor in 'SidePanel' container
	Then 'MT3' topic text is displayed 'italic' style
	Then 'MT4' topic text is displayed 'italic' style
	Then 'MT5' topic text is displayed 'italic' style
	Then 'italic' button is selected in font style section of text editor in 'SidePanel' container
	When User clicks 'italic' button in font style section of text editor in 'SidePanel' container
	Then 'MT3' topic text is displayed 'normal' style
	Then 'MT4' topic text is displayed 'normal' style
	Then 'MT5' topic text is displayed 'normal' style
	Then 'italic' button is unselected in font style section of text editor in 'SidePanel' container

@MindManager @Side_Panel @Design @Text @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-839] @Upd_Qase
Scenario: Verify_underline_font_style_can_be_changed_via_side_panel
	Then 'MT1' topic text is displayed 'normal' style
	When User clicks 'underline' button in font style section of text editor in 'SidePanel' container
	Then 'MT1' topic text is displayed 'underline' style
	Then 'underline' button is selected in font style section of text editor in 'SidePanel' container
	When User selects first 'MT3' and second 'MT4' and third 'MT5' topic on Canvas
	When User clicks 'underline' button in font style section of text editor in 'SidePanel' container
	Then 'MT3' topic text is displayed 'underline' style
	Then 'MT4' topic text is displayed 'underline' style
	Then 'MT5' topic text is displayed 'underline' style
	Then 'underline' button is selected in font style section of text editor in 'SidePanel' container
	When User clicks 'underline' button in font style section of text editor in 'SidePanel' container
	Then 'MT3' topic text is displayed 'normal' style
	Then 'MT4' topic text is displayed 'normal' style
	Then 'MT5' topic text is displayed 'normal' style
	Then 'underline' button is unselected in font style section of text editor in 'SidePanel' container

@MindManager @Side_Panel @Design @Text @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-840] @Upd_Qase
Scenario: Verify_strikethrough_font_style_can_be_changed_via_side_panel
	Then 'MT1' topic text is displayed 'normal' style
	When User clicks 'strikethrough' button in font style section of text editor in 'SidePanel' container
	Then 'MT1' topic text is displayed 'strikethrough' style
	Then 'strikethrough' button is selected in font style section of text editor in 'SidePanel' container
	When User selects first 'MT3' and second 'MT4' and third 'MT5' topic on Canvas
	When User clicks 'strikethrough' button in font style section of text editor in 'SidePanel' container
	Then 'MT3' topic text is displayed 'strikethrough' style
	Then 'MT4' topic text is displayed 'strikethrough' style
	Then 'MT5' topic text is displayed 'strikethrough' style
	Then 'strikethrough' button is selected in font style section of text editor in 'SidePanel' container
	When User clicks 'strikethrough' button in font style section of text editor in 'SidePanel' container
	Then 'MT3' topic text is displayed 'normal' style
	Then 'MT4' topic text is displayed 'normal' style
	Then 'MT5' topic text is displayed 'normal' style
	Then 'strikethrough' button is unselected in font style section of text editor in 'SidePanel' container