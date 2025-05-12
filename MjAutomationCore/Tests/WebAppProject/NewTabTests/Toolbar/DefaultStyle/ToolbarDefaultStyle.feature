@retry(2)
Feature: ToolbarDefaultStyle
Check Toolbar Default Style functionality 

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath                   |
		| auto_test_SRND.mmap | NavigationControlsMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @Toolbar @ToolbarDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1322] @Upd_Qase
Scenario: To_verify_that_user_can_set_the_default_attributes_for_floating_topics
	Then User set zoom level to '32' via the side tool bar
	When User clicks 'Floating Topic' topic on Canvas
	When User double clicks to the 'Floating Topic' topic text on Canvas
	When User enters 'Test' text to the topic on Canvas
	When User clicks 'MT2' topic on Canvas
	When User clicks 'Test' topic on Canvas
	Then 'Test' is outlined with a blue circuit
	Then 'Set Default Style' button is displayed as enabled on the Tools panel
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'Test' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'Test' is outlined with a blue circuit
	When User double clicks to the 'Test' topic text on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'Test' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	Then 'italic' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'Test' topic text is displayed 'italic' style
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'Test' topic text is displayed  'Times New Roman' in font
	When User clicks 'up' arrow in font size section of text editor in 'TextEditorPopup' container
	Then 'Test' topic text has '18.666' size
	When User clicks align icon in text editor and selects 'center' option in 'text-alignment' selectbox in 'TextEditorPopup' container
	Then 'Test' is outlined with a blue circuit
	When User clicks 'MT2' topic on Canvas
	When User clicks 'Test' topic on Canvas
	Then 'Test' topic text is aligned 'center'
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Style' button in Share context menu
	When User mouse over to the 'Add floating topic' button on Tool panel
	When User clicks 'Add floating topic' button on Tools panel
	When User add floating topic by coordinates '200', '200' to the Canvas
	Then 'Floating Topic' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'Floating Topic' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	Then 'Floating Topic' topic text is displayed 'italic' style
	Then 'Floating Topic' topic text is displayed  'Times New Roman' in font
	Then 'Floating Topic' topic text has '18.666' size
	Then 'Floating Topic' topic text is aligned 'center'

@MindManager @Toolbar @ToolbarDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1323] @Upd_Qase
Scenario: To_verify_that_user_can_set_the_default_attributes_for_main_topics
	When User clicks 'Main Topic' topic on Canvas
	When User double clicks to the 'Main Topic' topic text on Canvas
	When User enters 'Test' text to the topic on Canvas
	When User clicks 'Floating Topic' topic on Canvas
	When User clicks 'Test' topic on Canvas
	Then 'Test' is outlined with a blue circuit
	Then 'Set Default Style' button is displayed as enabled on the Tools panel
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'Test' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'Test' is outlined with a blue circuit
	When User double clicks to the 'Test' topic text on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'Test' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	Then 'italic' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'Test' topic text is displayed 'italic' style
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'Test' topic text is displayed  'Times New Roman' in font
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks 'up' arrow in font size section of text editor in 'TextEditorPopup' container
	Then 'Test' topic text has '18.666' size
	When User clicks align icon in text editor and selects 'right' option in 'text-alignment' selectbox in 'TextEditorPopup' container
	When User clicks 'MT2' topic on Canvas
	When User clicks 'Test' topic on Canvas
	Then 'Test' topic text is aligned 'right'
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Style' button in Share context menu
	When User clicks 'MT1' topic on Canvas
	Then 'MT1' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'MT1' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	Then 'MT1' topic text is displayed 'italic' style
	Then 'MT1' topic text is displayed  'Times New Roman' in font
	Then 'MT1' topic text has '18.666' size
	Then 'MT1' topic text is aligned 'right'
	When User clicks 'Central Topic' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	Then 'Main Topic' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'Main Topic' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	Then 'Main Topic' topic text is displayed 'italic' style
	Then 'Main Topic' topic text is displayed  'Times New Roman' in font
	Then 'Main Topic' topic text has '18.666' size
	Then 'Main Topic' topic text is aligned 'right'

@MindManager @Toolbar @ToolbarDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1324] @Upd_Qase
Scenario: To_verify_that_user_can_set_the_default_attributes_for_subtopic_topics
	When User clicks 'Subtopic' subtopic on Canvas
	When User presses the 'Delete' key on the keyboard
	Then 'Subtopic' subtopic is not displayed on Canvas
	When User clicks 'MTST1' topic on Canvas
	Then 'MTST1' is outlined with a blue circuit
	Then 'Set Default Style' button is displayed as enabled on the Tools panel
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'MTST1' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'MTST1' is outlined with a blue circuit
	When User double clicks to the 'MTST1' topic text on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'MTST1' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	Then 'italic' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'MTST1' topic text is displayed 'italic' style
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'MTST1' topic text is displayed  'Times New Roman' in font
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks 'up' arrow in font size section of text editor in 'TextEditorPopup' container
	Then 'MTST1' topic text has '16' size
	When User clicks align icon in text editor and selects 'right' option in 'text-alignment' selectbox in 'TextEditorPopup' container
	Then 'right' align option is selected in text editor in 'TextEditorPopup' container
	When User clicks 'MTST2' topic on Canvas
	Then 'MTST1' topic text is aligned 'right'
	When User clicks 'MTST1' topic on Canvas
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Style' button in Share context menu
	When User clicks 'MTST2' topic on Canvas
	Then 'MTST2' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'MTST2' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	Then 'MTST2' topic text is displayed 'italic' style
	Then 'MTST2' topic text is displayed  'Times New Roman' in font
	Then 'MTST2' topic text has '16' size
	Then 'MTST2' topic text is aligned 'right'
	When User clicks 'MT2' topic on Canvas
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Subtopic' subtopic is displayed on Canvas
	Then 'Subtopic' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'Subtopic' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	Then 'Subtopic' topic text is displayed 'italic' style
	Then 'Subtopic' topic text is displayed  'Times New Roman' in font
	Then 'Subtopic' topic text has '16' size
	Then 'Subtopic' topic text is aligned 'right'

@MindManager @Toolbar @ToolbarDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1327] @Upd_Qase
Scenario: To_verify_that_user_can_set_the_default_attributes_for_callout_topics
	When User clicks 'Callout' topic on Canvas
	When User double clicks to the 'Callout' topic text on Canvas
	When User enters 'Test' text to the topic on Canvas
	When User clicks 'Floating Topic' topic on Canvas
	When User clicks 'Test' topic on Canvas
	Then 'Test' is outlined with a blue circuit
	Then 'Set Default Style' button is displayed as enabled on the Tools panel
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#ff137a0c' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'Test' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'Test' is outlined with a blue circuit
	When User double clicks to the 'Test' topic text on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks Color button in text editor in 'TextEditorPopup' container
	Then Color Picker window is displayed to User
	When User enters '#fff4b110' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then Color Picker window is not displayed to User
	Then 'Test' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	When User clicks 'italic' button in font style section of text editor in 'TextEditorPopup' container
	Then 'italic' button is selected in font style section of text editor in 'TextEditorPopup' container
	Then 'Test' topic text is displayed 'italic' style
	When User clicks font family section in text editor and selects 'Times New Roman' option in 'font-family' selectbox in 'TextEditorPopup' container
	Then 'Test' topic text is displayed  'Times New Roman' in font
	When User clicks 'up' arrow in font size section of text editor in 'TextEditorPopup' container
	Then 'Test' topic text has '16' size
	When User clicks align icon in text editor and selects 'right' option in 'text-alignment' selectbox in 'TextEditorPopup' container
	When User clicks 'Test' topic on Canvas
	Then 'Test' topic text is aligned 'right'
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Style' button in Share context menu
	When User clicks 'MT2' topic on Canvas
	When User clicks 'Add callout' button on Tools panel
	Then 'Callout' callout is displayed on Canvas
	Then 'Callout' topic has Fill Color 'rgb(19, 122, 12)' on Canvas
	Then 'Callout' topic text has 'rgba(244, 177, 16, 1)' color on Canvas
	Then 'Callout' topic text is displayed 'italic' style
	Then 'Callout' topic text is displayed  'Times New Roman' in font
	Then 'Callout' topic text has '16' size
	Then 'Callout' topic text is aligned 'right'

@MindManager @Toolbar @ToolbarDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1328] @Upd_Qase @JIRA[MMCV-10330]
Scenario: Check_that_User_can_set_relationship_default_attribute
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'ImageTopic1' topic on Canvas
	When User clicks 'Central Topic' topic on Canvas
	Then '1' relationship lines are displayed on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#2fccc4' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then relationship line has Color '#2FCCC4' on Canvas
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Set Default Style' item in 'toolpanel-popup' dropdown menu
	Then toast notification is displayed on Overlay panel
	Then text 'Default Style Saved!' is displayed in toast notification on Overlay panel
	When User clicks 'Delete' button on Tools panel
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'ImageTopic1' topic on Canvas
	When User clicks 'Central Topic' topic on Canvas
	Then relationship line has Color '#2FCCC4' on Canvas

@MindManager @Toolbar @ToolbarDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1329] @Upd_Qase @JIRA[MMCV-9960]
Scenario: Check_that_User_can_rset_relationship_label_default_attribute
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'ImageTopic1' topic on Canvas
	When User clicks 'Central Topic' topic on Canvas
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
	When User clicks 'Set Default Style' item in 'toolpanel-popup' dropdown menu
	When User waits '500' miliseconds
	Then text 'Default Style Saved!' is displayed in toast notification on Overlay panel
	Then 'Relationship label' topic text is displayed  'Verdana' in font
	When User clicks 'Delete' button on Tools panel
	When User clicks 'ImageTopic1' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	Then cursor relationship added to the 'ImageTopic1' topic on Canvas
	When User clicks 'Central Topic' topic on Canvas
	When User clicks Relationship label on Canvas
	When User enters 'Relationship label 2' text to the topic on Canvas
	When User clicks by coordinates '200' and '70' on Canvas
	Then 'Relationship label 2' topic text is displayed  'Verdana' in font

@MindManager @Toolbar @ToolbarDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1330] @Upd_Qase @JIRA[MMCV-10330]
Scenario: Check_that_User_can_set_boundaries_default_attribute
	When User clicks 'Main Topic' topic on Canvas
	Then 'Main Topic' is outlined with a blue circuit
	When User clicks 'Add boundary' button on Tools panel
	Then 'Main Topic' topic is located in boundary on Canvas
	When User selects 'Main Topic' topic boundary body on Canvas
	When User clicks 'Colors' button on Tools panel
	Then Color Picker window is displayed to User
	When User enters '#2fccc4' hex code in input field on Color picker
	When User clicks 'Apply' button in Color Picker window
	Then 'Main Topic' topic boundary body is 'RGBA(47,204,196,1)' color on Canvas
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks 'Set Default Style' item in 'toolpanel-popup' dropdown menu
	Then text 'Default Style Saved!' is displayed in toast notification on Overlay panel
	When User selects 'Main Topic' topic boundary body on Canvas
	When User clicks 'Delete' button on Tools panel
	When User clicks 'Main Topic' topic on Canvas
	When User clicks 'Add boundary' button on Tools panel
	Then 'Main Topic' topic boundary body is 'RGBA(47,204,196,1)' color on Canvas