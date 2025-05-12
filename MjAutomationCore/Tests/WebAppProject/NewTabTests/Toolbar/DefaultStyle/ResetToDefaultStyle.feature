@retry(2)
Feature: ResetToDefaultStyle
Check the User can reset Defaults Styles

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1333] @Upd_Qase
Scenario: Check_that_User_can_reset_floating_topic_default_style
	When User clicks 'ImageTopic2' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'underline' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'strikethrough' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	When User clicks by coordinates '200' and '70' on Canvas
	Then 'ImageTopic2' topic text is displayed  'Times New Roman' in font
	Then 'ImageTopic2' topic text is displayed 'bold underline line-through' style
	Then 'ImageTopic2' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	Then 'ImageTopic2' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	When User clicks 'ImageTopic2' topic on Canvas
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then 'ImageTopic2' topic text is displayed  'Segoe UI' in font
	Then 'ImageTopic2' topic text is displayed 'normal' style
	Then 'ImageTopic2' topic text has 'rgba(0, 0, 0, 1)' color on Canvas
	Then 'ImageTopic2' topic has Fill Color 'rgb(236, 244, 250)' on Canvas

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1334] @Upd_Qase
Scenario: Check_that_User_can_reset_main_topic_default_style
	When User clicks 'MT' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'underline' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'strikethrough' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	When User clicks by coordinates '200' and '70' on Canvas
	Then 'MT' topic text is displayed  'Times New Roman' in font
	Then 'MT' topic text is displayed 'bold underline line-through' style
	Then 'MT' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	Then 'MT' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	When User clicks 'MT' topic on Canvas
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then 'MT' topic text is displayed  'Segoe UI' in font
	Then 'MT' topic text is displayed 'normal' style
	Then 'MT' topic text has 'rgba(0, 0, 0, 1)' color on Canvas
	Then 'MT' topic has Fill Color 'rgb(236, 244, 250)' on Canvas

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1335] @Upd_Qase
Scenario: Check_that_User_can_reset_sub_topic_default_style
	When User clicks '2378' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'underline' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'strikethrough' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	When User clicks by coordinates '200' and '70' on Canvas
	Then '2378' topic text is displayed  'Times New Roman' in font
	Then '2378' topic text is displayed 'bold underline line-through' style
	Then '2378' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	Then '2378' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	When User clicks '2378' topic on Canvas
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then '2378' topic text is displayed  'Segoe UI' in font
	Then '2378' topic text is displayed 'normal' style
	Then '2378' topic text has 'rgba(0, 0, 0, 1)' color on Canvas
	Then '2378' topic has Fill Color 'rgba(0, 0, 0, 0)' on Canvas

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1336] @Upd_Qase
Scenario: Check_that_User_can_reset_color_shapes_to_default_style
	When User adds 'Circle' shape from 'toolpanel-popup' dropdown menu to '200','210' position on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#800080' hex code in input field on Color picker
	When User presses the 'Enter' key on the keyboard
	When User clicks 'Apply' button in Color Picker window
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User click on 'Line Color' tab in Color Picker Header
	When User enters '#ff15d023' hex code in input field on Color picker
	When User presses the 'Enter' key on the keyboard
	When User clicks 'Apply' button in Color Picker window
	Then 'rgb(128, 0, 128)' fill color is displayed to the 'Circle' Shape
	Then 'rgb(21, 208, 35)' color is displayed to the 'Circle' shape line
	When User clicks 'Format Shape' button of side Toolbox
	When User clicks 'Transparency' selectbox in 'Fill' section of 'PanelByName' side panel with 'Format Shape' header and select '60%' in dropdown menu
	Then 'rgba(128, 0, 128, 0.4)' transparency color is displayed to the 'Circle' Shape
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then 'rgba(255, 255, 255, 0)' fill color is displayed to the 'Circle' Shape
	Then 'rgb(68, 68, 68)' color is displayed to the 'Circle' shape line

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1336] @Upd_Qase
Scenario: Check_that_User_can_reset_line_shapes_to_default_style
	When User adds 'Explosion' shape from 'toolpanel-popup' dropdown menu to '200','210' position on Canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	When User clicks 'Pattern' selectbox in 'Line' section of 'PanelByName' side panel with 'Format Shape' header and select '12,3,3,3' in dropdown menu
	Then '5.33333px, 1.33333px, 1.33333px, 1.33333px' pattern line is displayed to the 'Explosion' shape
	When User clicks 'Weight' selectbox in 'Line' section of 'PanelByName' side panel with 'Format Shape' header and select '12 pt' in dropdown menu
	Then '32px' size is displayed for 'Explosion' shape line
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then 'none' pattern line is displayed to the 'Explosion' shape
	Then '2.66667px' size is displayed for 'Explosion' shape line

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1337] @Upd_Qase
Scenario: Check_that_User_can_reset_smart_shapes_swim_lines_color_to_default_style
	When User adds 'Swim Lanes' Smart shape on the 'Horizontal' option to '200','210' position on canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#800080' hex code in input field on Color picker
	When User presses the 'Enter' key on the keyboard
	When User clicks 'Apply' button in Color Picker window
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User click on 'Line Color' tab in Color Picker Header
	When User enters '#ff15d023' hex code in input field on Color picker
	When User presses the 'Enter' key on the keyboard
	When User clicks 'Apply' button in Color Picker window
	Then 'Swim Lanes' Smart shape with '3' Horizontal lanes is displayed on Canvas
	Then 'rgb(128, 0, 128)' fill color is displayed to the 'Swim Lanes' Smart Shape
	Then 'rgb(21, 208, 35)' color is displayed to the 'Swim Lanes' smart shape line
	When User clicks 'Format Shape' button of side Toolbox
	When User clicks 'Transparency' selectbox in 'Fill' section of 'PanelByName' side panel with 'Format Shape' header and select '60%' in dropdown menu
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then 'rgba(255, 255, 255, 0)' fill color is displayed to the 'Swim Lanes' Smart Shape
	Then 'rgb(68, 68, 68)' color is displayed to the 'Swim Lanes' smart shape line

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1337] @Upd_Qase
Scenario: Check_that_User_can_reset_smart_shapes_swim_lines_line_style_to_default_style
	When User adds 'Swim Lanes' Smart shape on the 'Horizontal' option to '200','210' position on canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	When User clicks 'Pattern' selectbox in 'Line' section of 'PanelByName' side panel with 'Format Shape' header and select '12,3,3,3' in dropdown menu
	Then '5.33333px, 1.33333px, 1.33333px, 1.33333px' pattern line is displayed to the 'Swim Lanes' smart shape
	When User clicks 'Weight' selectbox in 'Line' section of 'PanelByName' side panel with 'Format Shape' header and select '12 pt' in dropdown menu
	Then '16px' size is displayed for 'Swim Lanes' smart shape line
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then 'none' pattern line is displayed to the 'Swim Lanes' smart shape
	Then '1.33333px' size is displayed for 'Swim Lanes' smart shape line

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1337] @Upd_Qase
Scenario: Check_that_User_can_reset_smart_shapes_funnel_colors_to_default_style
	When User adds 'Funnel' Smart shape on the 'Horizontal' option to '200','210' position on canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#800080' hex code in input field on Color picker
	When User presses the 'Enter' key on the keyboard
	When User clicks 'Apply' button in Color Picker window
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User click on 'Line Color' tab in Color Picker Header
	When User enters '#ff15d023' hex code in input field on Color picker
	When User presses the 'Enter' key on the keyboard
	When User clicks 'Apply' button in Color Picker window
	Then Funnel Smart shape with '3' segments is displayed on Canvas
	Then 'rgb(128, 0, 128)' fill color is displayed to the 'Funnel' Smart Shape
	Then 'rgb(21, 208, 35)' color is displayed to the 'Funnel' smart shape line
	When User clicks 'Format Shape' button of side Toolbox
	When User clicks 'Transparency' selectbox in 'Fill' section of 'PanelByName' side panel with 'Format Shape' header and select '60%' in dropdown menu
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then 'rgba(255, 255, 255, 0)' fill color is displayed to the 'Funnel' Smart Shape
	Then 'rgb(68, 68, 68)' color is displayed to the 'Funnel' smart shape line

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1337] @Upd_Qase
Scenario: Check_that_User_can_reset_smart_shapes_funnel_lines_style_to_default_style
	When User adds 'Funnel' Smart shape on the 'Horizontal' option to '200','210' position on canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	When User clicks 'Pattern' selectbox in 'Line' section of 'PanelByName' side panel with 'Format Shape' header and select '12,3,3,3' in dropdown menu
	Then '5.33333px, 1.33333px, 1.33333px, 1.33333px' pattern line is displayed to the 'Funnel' smart shape
	When User clicks 'Weight' selectbox in 'Line' section of 'PanelByName' side panel with 'Format Shape' header and select '12 pt' in dropdown menu
	Then '16px' size is displayed for 'Funnel' smart shape line
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then 'none' pattern line is displayed to the 'Funnel' smart shape
	Then '1.33333px' size is displayed for 'Funnel' smart shape line

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1337] @Upd_Qase
Scenario: Check_that_User_can_reset_smart_shapes_table_lines_to_default_style
	When User adds 'Table' Smart shape to '50','50' position on canvas
	Then 'Table' Smart shape is displayed on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#800080' hex code in input field on Color picker
	When User presses the 'Enter' key on the keyboard
	When User clicks 'Apply' button in Color Picker window
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User click on 'Line Color' tab in Color Picker Header
	When User enters '#ff15d023' hex code in input field on Color picker
	When User presses the 'Enter' key on the keyboard
	When User clicks 'Apply' button in Color Picker window
	Then 'rgb(128, 0, 128)' fill color is displayed to the 'Table' Smart Shape
	Then 'rgb(21, 208, 35)' color is displayed to the 'Table' smart shape line
	When User clicks 'Format Shape' button of side Toolbox
	When User clicks 'Transparency' selectbox in 'Fill' section of 'PanelByName' side panel with 'Format Shape' header and select '60%' in dropdown menu
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then 'rgba(255, 255, 255, 0)' fill color is displayed to the 'Table' Smart Shape
	Then 'rgb(68, 68, 68)' color is displayed to the 'Table' smart shape line

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1337] @Upd_Qase
Scenario: Check_that_User_can_reset_smart_shapes_table_lines_style_to_default_style
	When User adds 'Table' Smart shape to '50','50' position on canvas
	When User clicks 'Format Shape' button of side Toolbox
	Then 'PanelByName' side panel with 'Format Shape' header is displayed to the User
	When User clicks 'Pattern' selectbox in 'Line' section of 'PanelByName' side panel with 'Format Shape' header and select '12,3,3,3' in dropdown menu
	Then '5.33333px, 1.33333px, 1.33333px, 1.33333px' pattern line is displayed to the 'Table' smart shape
	When User clicks 'Weight' selectbox in 'Line' section of 'PanelByName' side panel with 'Format Shape' header and select '12 pt' in dropdown menu
	Then '16px' size is displayed for 'Table' smart shape line
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then 'none' pattern line is displayed to the 'Table' smart shape
	Then '1.33333px' size is displayed for 'Table' smart shape line

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1338] @Upd_Qase
Scenario: Check_that_User_can_reset_callout_to_default_style
	When User clicks 'MTCO' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'underline' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'strikethrough' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'MTCO' topic text is displayed  'Times New Roman' in font
	Then 'MTCO' topic text is displayed 'bold underline line-through' style
	Then 'MTCO' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	Then 'MTCO' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	When User clicks 'MTCO' topic on Canvas
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then 'MTCO' topic text is displayed  'Segoe UI' in font
	Then 'MTCO' topic text is displayed 'normal' style
	Then 'MTCO' topic text has 'rgba(0, 0, 0, 1)' color on Canvas
	Then 'MTCO' topic has Fill Color 'rgb(251, 209, 188)' on Canvas

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1339] @Upd_Qase @JIRA[MMCV-10329]
Scenario: Check_that_User_can_reset_relationship_default_style
	When User clicks 'MT' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'MT' topic on Canvas
	When User clicks 'FT' topic on Canvas
	Then '1' relationship lines are displayed on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#2fccc4' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then relationship line has Color '#2FCCC4' on Canvas
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then relationship line has Color '#CF4D0C' on Canvas

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1340] @Upd_Qase
Scenario: Check_that_User_can_reset_relationship_label_default_style
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'ImageTopic1' topic on Canvas
	When User clicks 'FT' topic on Canvas
	Then '1' relationship lines are displayed on Canvas
	When User clicks Relationship label on Canvas
	When User enters 'Relationship label' text to the topic on Canvas
	When User clicks by coordinates '200' and '70' on Canvas
	When User clicks 'Relationship label' topic on Canvas
	Then 'Relationship label' is outlined with a blue circuit
	When User clicks on text in the 'Relationship label' topic on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font family section in text editor and selects 'Verdana' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'Relationship label' topic text is displayed  'Verdana' in font
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then 'Relationship label' topic text is displayed  'Segoe UI' in font

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1341] @Upd_Qase @JIRA[MMCV-10329]
Scenario: Check_that_User_can_reset_boundaries_default_style
	When User clicks 'MT' topic on Canvas
	Then 'MT' is outlined with a blue circuit
	When User clicks by coordinates '100' and '50' on Canvas
	When User clicks 'MT' topic on Canvas
	When User clicks 'Add boundary' button on Tools panel
	Then 'MT' topic is located in boundary on Canvas
	When User selects 'MT' topic boundary body on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#2fccc4' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'MT' topic boundary body is 'RGBA(47,204,196,1)' color on Canvas
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then 'MT' topic boundary body is 'RGBA(251,209,188,1)' color on Canvas

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1342] @Upd_Qase
Scenario: Check_that_User_can_reset_textbox_to_default_style
	When User clicks 'Insert Text Box' button on Tools panel
	When User clicks by coordinates '200' and '250' on Canvas
	When User clicks 'MTCO' topic on Canvas
	When User doubleClick on Textbox with text 'Text Label' on Canvas
	Then User enter 'Testing' text into the Textbox
	When User doubleClick on Textbox with text 'Testing' on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	Then text editor is displayed in 'TextEditorPopup' container
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	When User clicks 'bold' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'underline' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'strikethrough' button in font style section of text editor in 'TextEditorPopup' container
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	When User clicks font size section in text editor and selects '36' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	When User clicks by coordinates '50' and '50' on Canvas
	Then 'Testing' textbox text is displayed 'bold underline line-through italic' style
	Then 'Testing' textbox text is displayed  'Times New Roman' in font
	Then 'Testing' textbox text has '48px' size
	Then 'Testing' textbox text has 'rgba(244, 177, 16, 1)' color on Canvas
	When User clicks on added textbox with text 'Testing' on Canvas
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then 'Testing' textbox text is displayed  'Segoe UI' in font
	Then 'Testing' textbox text is displayed 'normal' style
	Then 'Testing' textbox text has '18.6667px' size
	Then 'Testing' textbox text has 'rgba(68, 68, 68, 1)' color on Canvas

@MindManager @Toolbar @ResetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1343] @Upd_Qase
Scenario: Check_that_User_can_reset_image_to_default_style
	When User uploads 'CoolFreesh.jfif' image from Tool panel to '300','300' position on Canvas
	When User clicks on 'CoolFreesh.jfif' uploaded image on Canvas
	When User clicks 'Format Shape' button of side Toolbox
	When User clicks 'Transparency' selectbox in 'Fill' section of 'PanelByName' side panel with 'Format Shape' header and select '60%' in dropdown menu
	Then Transparency of 'CoolFreesh.jfif' image on Canvas is '0.4'
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Reset to Default' item in 'toolpanel-popup' dropdown menu
	Then Transparency of 'CoolFreesh.jfif' image on Canvas is '1'