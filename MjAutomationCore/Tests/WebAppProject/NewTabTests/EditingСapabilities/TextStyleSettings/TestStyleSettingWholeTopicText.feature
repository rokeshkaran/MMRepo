@retry(2)
Feature: TextStyleSettingsWholeTopicText
   Check functionality context menu for Text style settings applies to the entire topic

Background: Pre - condition
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                     |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	Then User set zoom level to '36' via the side tool bar

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-268] @Upd_Qase
Scenario: Check_that_Font_style_can_be_applied_all_topic_text
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'Text Formatting' topic text is displayed  'Times New Roman' in font

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-268] @Upd_Qase
Scenario: Check_that_Font_style_can_be_applied_part_topic_text
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks and hold editable cursor and moves by '20' '0' coordinates on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'matting' topic text is displayed  'Times New Roman' in font

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-268] @Upd_Qase
Scenario: Check_that_Font_style_can_be_applied_to_multiline_topic_text
	When User remembers 'Multiline topic text' topic model id and name
	When User clicks 'Multiline topic text' topic on Canvas
	When User clicks 'Multiline topic text' topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font family section in text editor and selects 'Barrio' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then text 'Multiline topic text' is displayed in 'Barrio' font in the 'Multiline topic text' topic on Canvas
	Then text 'Topic for a specific' is displayed in 'Barrio' font in the 'Multiline topic text' topic on Canvas
	Then text 'Text formatting test' is displayed in 'Barrio' font in the 'Multiline topic text' topic on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-268] @Upd_Qase
Scenario: Check_that_Font_style_can_be_applied_to_part_multiline_topic_text
	When User remembers 'Multiline topic text' topic model id and name
	When User clicks 'Multiline topic text' topic on Canvas
	When User clicks 'Multiline topic text' topic on Canvas
	When User clicks and hold editable cursor and moves by '20' '0' coordinates on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font family section in text editor and selects 'Barrio' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then text 'Multiline topic text' is displayed in 'Source Sans Pro' font in the 'Multiline topic text' topic on Canvas
	Then text 'Topic for' is displayed in 'Source Sans Pro' font in the 'Multiline topic text' topic on Canvas
	Then text 'a specific' is displayed in 'Barrio' font in the 'Multiline topic text' topic on Canvas
	Then text 'Text formatting test' is displayed in 'Source Sans Pro' font in the 'Multiline topic text' topic on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-269] @Upd_Qase
Scenario: Check_that_Font_Size_can_be_applied_to_topic_text
	When User remembers 'Text Formatting' topic model id and name
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font size section in text editor and selects '26' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	Then text 'Text Formatting' has font size of '34.666' in the 'Text Formatting' topic on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-269] @Upd_Qase
Scenario: Check_that_Font_Size_can_be_applied_to_part_topic_text
	When User remembers 'Text Formatting' topic model id and name
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks and hold editable cursor and moves by '20' '0' coordinates on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User waits '1000' miliseconds
	When User clicks font size section in text editor and selects '26' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	Then text 'matting' has font size of '34.666' in the 'Text Formatting' topic on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-269] @Upd_Qase
Scenario: Check_that_Font_Size_can_be_applied_to_multiline_part_topic_text
	When User remembers 'Multiline topic text' topic model id and name
	When User clicks 'Multiline topic text' topic on Canvas
	When User clicks 'Multiline topic text' topic on Canvas
	When User clicks and hold editable cursor and moves by '20' '0' coordinates on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font size section in text editor and selects '24' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	Then text 'a specific' has font size of '32' in the 'Multiline topic text' topic on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-269] @Upd_Qase
Scenario: Check_that_Font_Size_can_be_applied_to_multiline_topic_text
	When User remembers 'Multiline topic text' topic model id and name
	When User clicks 'Multiline topic text' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font size section in text editor and selects '24' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	Then text 'Multiline topic text' has font size of '32' in the 'Multiline topic text' topic on Canvas
	Then text 'Topic for a specific' has font size of '32' in the 'Multiline topic text' topic on Canvas
	Then text 'Text formatting test' has font size of '32' in the 'Multiline topic text' topic on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-270] @Upd_Qase
Scenario: Check_that_color_can_be_applied_to_topic_text_by_enter_hex_code
	When User remembers 'Text Formatting' topic model id and name
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User presses the 'Enter' key on the keyboard
	Then Color Preview has color 'rgb(244, 177, 16)' on Color Picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'Text Formatting' topic text has 'rgba(244, 177, 16, 1)' color on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Not_Run_Edge @Qase[WEB-270] @Upd_Qase
Scenario: Check_that_color_can_be_applied_to_topic_text_by_clicking_on_color_area_not_edge
	When User remembers 'Text Formatting' topic model id and name
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	Then Color Canvas is displayed on Color Picker
	When User click mouse by '50' '-50' coordinates in field color Area
	Then Point in field color located in '154' '31' coordinated
	Then Colour Hex code '#c53838' is displayed on Hex Code Color Picker
	Then Color Preview has color 'rgb(197, 56, 56)' on Color Picker
	When User clicks 'Apply' button in Color Picker window
	Then text 'Text Formattin' has 'rgba(197, 56, 56, 1)' color in the 'Text Formatting' topic on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-270] @Upd_Qase
Scenario: Check_that_color_can_be_applied_to_topic_text_by_clicking_on_color_area
	When User remembers 'Text Formatting' topic model id and name
	When User remembers 'Text Formatting' text color in 'Text Formatting' topic on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	Then Color Canvas is displayed on Color Picker
	When User remembers color preview in the color picker
	When User remembers the location of the cursor in field color Picker
	When User remembers hex code input field value on color picker
	When User click mouse by '50' '-50' coordinates in field color Area
	Then point in field color has location changed
	Then Color preview is changed in the color picker
	Then hex code input field value is changed in color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'Text Formatting' topic text color is changed on 'Text Formatting' Topic

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Not_Run_Edge @Qase[WEB-270] @Upd_Qase
Scenario: Check_that_color_can_be_applied_to_topic_text_by_dragging_point_on_color_area_not_edge
	When User remembers 'Text Formatting' topic model id and name
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	When User remembers 'Text Formatting' text color in 'Text Formatting' topic on Canvas
	Then Color Picker window is displayed to User
	Then Color Canvas is displayed on Color Picker
	When User remembers hex code input field value on color picker
	When User remembers color preview in the color picker
	When User drag and drop color point through color Area by '60' '-60' coordinates
	Then Point in field color located in '49' '114' coordinated
	Then hex code input field value is changed in color picker
	Then Color preview is changed in the color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'Text Formatting' topic text color is changed on 'Text Formatting' Topic

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-270] @Upd_Qase
Scenario: Check_that_color_can_be_applied_to_topic_text_by_dragging_point_on_color_area
	When User remembers 'Text Formatting' topic model id and name
	When User remembers 'Text Formatting' text color in 'Text Formatting' topic on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	Then Color Canvas is displayed on Color Picker
	When User remembers color preview in the color picker
	When User remembers the location of the cursor in field color Picker
	When User remembers hex code input field value on color picker
	When User drag and drop color point through color Area by '60' '-60' coordinates
	Then point in field color has location changed
	Then Color preview is changed in the color picker
	Then hex code input field value is changed in color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'Text Formatting' topic text color is changed on 'Text Formatting' Topic

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Not_Run_Edge @Qase[WEB-270] @Upd_Qase
Scenario: Check_that_color_can_be_applied_to_topic_text_by_clicking_on_color_Slider_not_edge
	When User remembers 'Text Formatting' topic model id and name
	When User remembers 'Text Formatting' text color in 'Text Formatting' topic on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User remembers color preview in the color picker
	When User remembers color of сolor area in the color picker
	When User remembers the location of the cursor in field color Picker
	When User remembers hex code input field value on color picker
	Then Color Slider is displayed on Color Picker
	When User clicks by coordinate '50' on color Slider
	When User drag and drop color point through color Area by '100' '-220' coordinates
	Then Slider cursor has location changed in the color picker
	Then Color preview is changed in the color picker
	Then Color of сolor area is changed in the color picker
	Then hex code input field value is changed in color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'Text Formatting' topic text color is changed on 'Text Formatting' Topic

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-270] @Upd_Qase
Scenario: Check_that_color_can_be_applied_to_topic_text_by_clicking_on_color_Slider
	When User remembers 'Text Formatting' topic model id and name
	When User remembers 'Text Formatting' text color in 'Text Formatting' topic on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User remembers color preview in the color picker
	When User remembers color of сolor area in the color picker
	When User remembers the location of the cursor in field color Picker
	When User remembers hex code input field value on color picker
	Then Color Slider is displayed on Color Picker
	When User clicks by coordinate '50' on color Slider
	When User drag and drop color point through color Area by '100' '-220' coordinates
	Then Slider cursor has location changed in the color picker
	Then Color preview is changed in the color picker
	Then Color of сolor area is changed in the color picker
	Then hex code input field value is changed in color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'Text Formatting' topic text color is changed on 'Text Formatting' Topic

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-270] @Upd_Qase
Scenario: Check_that_color_can_be_applied_to_topic_text_by_chosen_color_in_palette_on_color_picker
	When User remembers 'Text Formatting' topic model id and name
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#800080' hex code in input field on Color picker
	When User presses the 'Enter' key on the keyboard
	When User enters '#FF0000' hex code in input field on Color picker
	When User presses the 'Enter' key on the keyboard
	When User enters '#1bff00' hex code in input field on Color picker
	When User presses the 'Enter' key on the keyboard
	When User clicks 'Cancel' button in Color Picker window
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	Then checkbox with color 'rgb(27, 255, 0)' is displayed in palette container on Color picker
	Then checkbox with color 'rgb(128, 0, 128)' is displayed in palette container on Color picker
	Then checkbox with color 'rgb(255, 0, 0)' is displayed in palette container on Color picker
	When User clicks 'rgb(27, 255, 0)' checkbox in palette container on Color picker
	Then Color Preview has color 'rgb(27, 255, 0)' on Color Picker
	Then Colour Hex code '#1bff00' is displayed on Hex Code Color Picker
	Then Point in field color located in '220' '-10' coordinated
	Then Color slider has value '64.6078px' in the color picker
	When User clicks 'Apply' button in Color Picker window
	Then text 'Text Formatting' has 'rgba(27, 255, 0, 1)' color in the 'Text Formatting' topic on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-270] @Upd_Qase
Scenario: Check_that_color_can_be_applied_to_topic_text_by_eyedropper_tool
	When User remembers 'Text Formatting' topic model id and name
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	Then Eyedropper button is displayed on Color Picker
	When User click Eyedropper button on Color Picker
	When User hovers cursor the 'Bold' topic
	When User moves cursor by '50' '50' coordinates on Canvas
	Then Magnifier Cursor is displayed on Canvas
	When User hovers cursor the 'MT8' topic
	When User clicks 'MT8' topic on Canvas
	Then Colour Hex code '#ecf4fa' is displayed on Hex Code Color Picker
	Then Color slider has value '123.429px' in the color picker
	Then Point in field color located in '3' '-6' coordinated
	When User click Eyedropper button on Color Picker
	Then Color Preview has color 'rgb(236, 244, 250)' on Color Picker
	When User clicks 'Apply' button in Color Picker window
	Then text 'Text Formatting' has 'rgba(236, 244, 250, 1)' color in the 'Text Formatting' topic on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-271] @Upd_Qase
Scenario: Check_that_Bold_font_style_can_be_applied_to_topic_text
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	Then 'bold' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'Text Formatting' topic text is displayed 'bold' style

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-271] @Upd_Qase
Scenario: Check_that_Bold_font_style_can_be_applied_to_part_topic_text
	When User remembers 'Text Formatting' topic model id and name
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks and hold editable cursor and moves by '20' '0' coordinates on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	Then 'bold' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then text 'Text For' is displayed 'normal' style in the 'Text Formatting' topic on Canvas
	Then text 'matting' is displayed 'bold' style in the 'Text Formatting' topic on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-271] @Upd_Qase
Scenario: Check_that_Bold_font_style_can_be_applied_to_multiline_topic_text
	When User remembers 'Multiline topic text' topic model id and name
	When User clicks 'Multiline topic text' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	Then text 'Multiline topic text' is displayed 'bold' style in the 'Multiline topic text' topic on Canvas
	Then text 'Topic for a specific' is displayed 'bold' style in the 'Multiline topic text' topic on Canvas
	Then text 'Text formatting test' is displayed 'bold' style in the 'Multiline topic text' topic on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-271] @Upd_Qase
Scenario: Check_that_Bold_font_style_can_be_applied_to_multiline_part_topic_text
	When User remembers 'Multiline topic text' topic model id and name
	When User clicks 'Multiline topic text' topic on Canvas
	When User clicks 'Multiline topic text' topic on Canvas
	When User clicks and hold editable cursor and moves by '20' '0' coordinates on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	Then text 'Multiline topic text' is displayed 'normal' style in the 'Multiline topic text' topic on Canvas
	Then text 'Topic for' is displayed 'normal' style in the 'Multiline topic text' topic on Canvas
	Then text 'a specific' is displayed 'bold' style in the 'Multiline topic text' topic on Canvas
	Then text 'Text formatting test' is displayed 'normal' style in the 'Multiline topic text' topic on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-271] @Upd_Qase
Scenario: Check_that_Bold_font_style_can_be_remove_from_the_topic_text
	Then 'Bold' topic text is displayed 'bold' style
	When User clicks 'Bold' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	Then 'bold' button is selected in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	Then 'bold' button is unselected in font style section of text editor in 'TextEditorPopup' container
	Then 'Bold' topic text is displayed 'none' style

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-272] @Upd_Qase
Scenario: Check_that_Italic_font_style_can_be_applied_to_all_of_topic_text
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	Then 'italic' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'Text Formatting' topic text is displayed 'italic' style

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-272] @Upd_Qase
Scenario: Check_that_Italic_font_style_can_be_applied_to_multiline_topic_text
	When User remembers 'Multiline topic text' topic model id and name
	When User clicks 'Multiline topic text' topic on Canvas
	When User clicks 'Multiline topic text' topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	Then text 'Multiline topic text' is displayed 'italic' style in the 'Multiline topic text' topic on Canvas
	Then text 'Topic for a specific' is displayed 'italic' style in the 'Multiline topic text' topic on Canvas
	Then text 'Text formatting test' is displayed 'italic' style in the 'Multiline topic text' topic on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-272] @Upd_Qase
Scenario: Check_that_Italic_font_style_can_be_remove_from_the_topic_text
	Then 'Italic' topic text is displayed 'italic' style
	When User clicks 'Italic' topic on Canvas
	When User clicks 'Italic' topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	Then 'italic' button is selected in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	Then 'italic' button is unselected in font style section of text editor in 'TextEditorPopup' container
	Then 'Italic' topic text is displayed 'none' style

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-273] @Upd_Qase
Scenario: Check_that_Underline_font_style_can_be_applied_to_topic_text
	When User double clicks to the 'Text Formatting' topic text on Canvas
	Then 'Text Formatting' is outlined with a blue circuit
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks 'underline' button in font style section of text editor in 'TextEditorPopup' container
	Then 'Text Formatting' topic text is displayed 'underline' style
	Then 'underline' button is selected in font style section of text editor in 'TextEditorPopup' container
	When User clicks by coordinates '200' and '70' on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-273] @Upd_Qase
Scenario: Check_that_Underline_font_style_can_be_applied_to_part_of_multiline_topic_text
	When User remembers 'Multiline topic text' topic model id and name
	When User clicks 'Multiline topic text' topic on Canvas
	When User clicks 'Multiline topic text' topic on Canvas
	When User presses the 'ArrowUp' key on the keyboard
	When User presses the 'Home' key on the keyboard
	When User selects from `0` to '20' the text symbol in 'Multiline topic text' topic
	When User clicks 'underline' button in font style section of text editor in 'TextEditorPopup' container
	Then text 'Multiline topic text' is displayed 'underline' style in the 'Multiline topic text' topic on Canvas
	Then text 'Topic for a specific' is displayed 'normal' style in the 'Multiline topic text' topic on Canvas
	Then text 'Text formatting test' is displayed 'normal' style in the 'Multiline topic text' topic on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-274] @Upd_Qase
Scenario: Check_that_Strikethrough_font_style_can_be_applied_to_topic_text
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks 'strikethrough' button in font style section of text editor in 'TextEditorPopup' container
	Then 'strikethrough' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'Text Formatting' topic text is displayed 'strikethrough' style

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-274] @Upd_Qase
Scenario: Check_that_Strikethrough_font_style_can_be_applied_to_part_of_multiline_topic_text
	When User remembers 'Multiline topic text' topic model id and name
	When User clicks 'Multiline topic text' topic on Canvas
	When User clicks 'Multiline topic text' topic on Canvas
	When User presses the 'ArrowUp' key on the keyboard
	When User presses the 'Home' key on the keyboard
	When User selects from `0` to '20' the text symbol in 'Multiline topic text' topic
	When User clicks 'strikethrough' button in font style section of text editor in 'TextEditorPopup' container
	Then text 'Multiline topic text' is displayed 'strikethrough' style in the 'Multiline topic text' topic on Canvas
	Then text 'Topic for a specific' is displayed 'normal' style in the 'Multiline topic text' topic on Canvas
	Then text 'Text formatting test' is displayed 'normal' style in the 'Multiline topic text' topic on Canvas

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1413] @Upd_Qase
Scenario: Check_that_text_can_be_aligned
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks align icon in text editor and selects 'left' option in 'text-alignment' selectbox in 'TextEditorPopup' container
	Then 'left' align option is selected in text editor in 'TextEditorPopup' container
	Then 'Text Formatting' topic text is aligned 'left'
	When User clicks by coordinates '200' and '50' on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks align icon in text editor and selects 'center' option in 'text-alignment' selectbox in 'TextEditorPopup' container
	Then 'center' align option is selected in text editor in 'TextEditorPopup' container
	When User clicks by coordinates '200' and '50' on Canvas
	Then 'Text Formatting' topic text is aligned 'center'
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks align icon in text editor and selects 'right' option in 'text-alignment' selectbox in 'TextEditorPopup' container
	Then 'right' align option is selected in text editor in 'TextEditorPopup' container
	When User clicks by coordinates '200' and '50' on Canvas
	Then 'Text Formatting' topic text is aligned 'right'

@MindManager @EditingCapabilities @TextStyleSettings @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1321] @Upd_Qase @JIRA[MMCV-9794]
Scenario: Check_that_Font_Size_can_be_applied_to_topic_text_via_arrow_button
	When User clicks 'Text Formatting' topic on Canvas
	Then 'Text Formatting' is outlined with a blue circuit
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	Then 'Text Formatting' topic text has '16' size
	When User clicks 'up' arrow in font size section of text editor in 'TextEditorPopup' container
	Then 'Text Formatting' topic text has '18.666' size
	When User clicks 'down' arrow in font size section of text editor in 'TextEditorPopup' container
	Then 'Text Formatting' topic text has '16' size
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks 'Text Formatting' topic on Canvas
	When User clicks and hold editable cursor and moves by '20' '0' coordinates on Canvas
	When User clicks 'down' arrow in font size section of text editor in 'TextEditorPopup' container
	Then 'matting' topic text has '13.333' size
	When User clicks 'up' arrow in font size section of text editor in 'TextEditorPopup' container
	Then 'Text Formatting' topic text has '16' size
